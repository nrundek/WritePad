$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$sourceDir = Join-Path $projectRoot 'writer-native'
$buildDir = Join-Path $projectRoot '.writer-build'
$distDir = Join-Path $projectRoot 'writer-dist'
$csc = 'C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe'

if (-not (Test-Path -LiteralPath $csc)) {
    throw 'The C# compiler required to build Writer was not found.'
}
New-Item -ItemType Directory -Path $buildDir, $distDir -Force | Out-Null

$references = @(
    '/reference:System.Windows.Forms.dll',
    '/reference:System.Drawing.dll',
    '/reference:System.Xml.dll',
    '/reference:System.Web.Extensions.dll',
    '/reference:System.IO.Compression.dll',
    '/reference:System.IO.Compression.FileSystem.dll'
)
$appOutput = Join-Path $buildDir 'Writepad.exe'
$notice = Join-Path $projectRoot 'THIRD-PARTY-NOTICES.txt'
$typewriterSound = Join-Path $sourceDir 'Resources\typewriter-key.wav'
$brailleSound = Join-Path $sourceDir 'Resources\perkins-brailler-key.wav'
$combinedSound = Join-Path $sourceDir 'Resources\combined-typing-keys.wav'
$spellLibrary = Join-Path $sourceDir 'Dependencies\WeCantSpell.Hunspell.dll'
$webViewCore = Join-Path $sourceDir 'Dependencies\Microsoft.Web.WebView2.Core.dll'
$webViewForms = Join-Path $sourceDir 'Dependencies\Microsoft.Web.WebView2.WinForms.dll'
$webViewLoader = Join-Path $sourceDir 'Dependencies\WebView2Loader.dll'
$webViewArguments = @(
    "/reference:$webViewCore", "/reference:$webViewForms",
    "/resource:$webViewCore,Writer.Microsoft.Web.WebView2.Core.dll,public",
    "/resource:$webViewForms,Writer.Microsoft.Web.WebView2.WinForms.dll,public",
    "/resource:$webViewLoader,Writer.WebView2Loader.dll,public"
)
$pandocArchive = Join-Path $sourceDir 'Resources\pandoc-3.11-windows-x86_64.zip'
$pandocCommands = Join-Path $sourceDir 'Resources\PandocCommands.json'
if ((Get-FileHash -Algorithm SHA256 -LiteralPath $pandocArchive).Hash.ToLowerInvariant() -ne '2ab72baf2399450e148ddf7a2a8689806c42e1bba71862b57e220fd9b8456d3d') { throw 'Bundled Pandoc checksum mismatch.' }
$dictionaryZip = Join-Path $buildDir 'Dictionaries.zip'
Add-Type -AssemblyName System.IO.Compression.FileSystem
if (Test-Path -LiteralPath $dictionaryZip) { Remove-Item -LiteralPath $dictionaryZip }
[IO.Compression.ZipFile]::CreateFromDirectory((Join-Path $sourceDir 'Resources\Dictionaries'), $dictionaryZip)
$thirdPartySources = Join-Path $buildDir 'THIRD-PARTY-SOURCES.zip'
$sourceStream = [IO.File]::Open($thirdPartySources, [IO.FileMode]::Create)
$sourceArchive = New-Object IO.Compression.ZipArchive($sourceStream, [IO.Compression.ZipArchiveMode]::Create)
try {
    foreach ($dependency in Get-ChildItem -LiteralPath (Join-Path $sourceDir 'Dependencies') -File) {
        if ($dependency.Extension -eq '.dll') { continue }
        [IO.Compression.ZipFileExtensions]::CreateEntryFromFile($sourceArchive, $dependency.FullName, ('Dependencies/' + $dependency.Name)) | Out-Null
    }
    foreach ($dictionary in Get-ChildItem -LiteralPath (Join-Path $sourceDir 'Resources\Dictionaries') -File) {
        [IO.Compression.ZipFileExtensions]::CreateEntryFromFile($sourceArchive, $dictionary.FullName, ('Dictionaries/' + $dictionary.Name)) | Out-Null
    }
} finally { $sourceArchive.Dispose(); $sourceStream.Dispose() }
$sources = @(
    (Join-Path $sourceDir 'WriterProgram.cs'),
    (Join-Path $sourceDir 'WriterCore.cs'),
    (Join-Path $sourceDir 'WriterDialogs.cs'),
    (Join-Path $sourceDir 'WriterFeatures.cs'),
    (Join-Path $sourceDir 'WriterAudio.cs'),
    (Join-Path $sourceDir 'WriterMainForm.cs'),
    (Join-Path $sourceDir 'WriterRichTextEditor.cs'),
    (Join-Path $sourceDir 'WriterMarkdown.cs'),
    (Join-Path $sourceDir 'WriterPandoc.cs'),
    (Join-Path $sourceDir 'WriterPandocWriting.cs'),
    (Join-Path $sourceDir 'WriterPandocTests.cs'),
    (Join-Path $sourceDir 'WriterRecovery.cs'),
    (Join-Path $sourceDir 'WriterHistory.cs'),
    (Join-Path $sourceDir 'WriterWindows.cs'),
    (Join-Path $sourceDir 'WriterContextMenu.cs'),
    (Join-Path $sourceDir 'WriterProofreading.cs'),
    (Join-Path $sourceDir 'WriterJournal.cs'),
    (Join-Path $sourceDir 'WriterWritingTools.cs'),
    (Join-Path $sourceDir 'WriterInlineFormatting.cs'),
    (Join-Path $sourceDir 'WriterHtmlPreview.cs'),
    (Join-Path $sourceDir 'WriterWritingTests.cs'),
    (Join-Path $sourceDir 'WriterV2.cs')
)

& $csc /nologo /target:winexe /platform:x64 /optimize+ /debug- "/win32icon:$(Join-Path $projectRoot 'pisac.ico')" "/win32manifest:$(Join-Path $sourceDir 'app.manifest')" "/out:$appOutput" @references @webViewArguments "/reference:$spellLibrary" "/resource:$spellLibrary,Writer.WeCantSpell.Hunspell.dll,public" "/resource:$pandocArchive,Writer.Pandoc.zip,public" "/resource:$pandocCommands,Writer.PandocCommands.json,public" "/resource:$dictionaryZip,Writer.Dictionaries.zip,public" "/resource:$typewriterSound,Writer.TypewriterKey.wav,public" "/resource:$brailleSound,Writer.PerkinsBraillerKey.wav,public" "/resource:$combinedSound,Writer.CombinedTypingKeys.wav,public" @sources
if ($LASTEXITCODE -ne 0) { throw 'Writepad.exe build failed.' }
$installerOutput = Join-Path $distDir 'writepad_setup_2.7.exe'
& $csc /nologo /target:winexe /platform:x64 /optimize+ /debug- "/win32icon:$(Join-Path $projectRoot 'pisac.ico')" "/win32manifest:$(Join-Path $sourceDir 'installer.manifest')" "/out:$installerOutput" @references /reference:Microsoft.CSharp.dll "/resource:$appOutput,Writer.Payload.exe,public" "/resource:$notice,Writer.ThirdPartyNotices.txt,public" "/resource:$thirdPartySources,Writer.ThirdPartySources.zip,public" (Join-Path $sourceDir 'WriterInstaller.cs')
if ($LASTEXITCODE -ne 0) { throw 'Writer installer build failed.' }

Copy-Item -LiteralPath $appOutput -Destination (Join-Path $distDir 'Writepad.exe') -Force
Copy-Item -LiteralPath $appOutput -Destination (Join-Path $buildDir 'Writer.exe') -Force
Copy-Item -LiteralPath $appOutput -Destination (Join-Path $distDir 'Writer.exe') -Force
Copy-Item -LiteralPath $installerOutput -Destination (Join-Path $distDir 'Writepad-2.7-Setup.exe') -Force
Copy-Item -LiteralPath $installerOutput -Destination (Join-Path $distDir 'Writer-2.7-Setup.exe') -Force
Copy-Item -LiteralPath $notice -Destination (Join-Path $distDir 'THIRD-PARTY-NOTICES.txt') -Force
Copy-Item -LiteralPath $thirdPartySources -Destination (Join-Path $distDir 'THIRD-PARTY-SOURCES.zip') -Force
Copy-Item -LiteralPath (Join-Path $projectRoot 'WRITEPAD-2.7.md') -Destination (Join-Path $distDir 'WRITEPAD-2.7.md') -Force
Get-FileHash -Algorithm SHA256 -LiteralPath (Join-Path $distDir 'Writepad.exe'), $installerOutput
