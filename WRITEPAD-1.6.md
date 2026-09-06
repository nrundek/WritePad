# Writepad 1.6

Writepad je pristupačan uređivač teksta i digitalna bilježnica za Windows.

Instalacija: `writer-dist\Writepad-1.6-Setup.exe`  
Prijenosna aplikacija: `writer-dist\Writepad.exe`

## Novosti

- Sve četiri margine stranice iznose **2,5 cm** u prikazu, `.writer` bilježnici, ispisu te izvozu u Word, PDF i HTML.
- **Datum i vrijeme** sada koristi `Ctrl+F5`; stari prečac `Ctrl+Alt+D` više nije aktivan.
- `Ctrl+7` pretvara trenutačni redak ili označene odlomke u **običan tekst**. Time se jednostavno uklanja slučajno primijenjeni naslov u običnom pisanju i Pandoc Markdownu.
- Opcija **Najavi novi redak** tijekom pisanja samo reproducira kratko zvonce pri prijelazu u novi redak. Pri čitanju i kretanju strelicama više ne prikazuje niti izgovara broj retka.
- Stavke Pomoć i **Tipkovni prečaci** ažurirane su za ove promjene. Oba HTML prikaza zatvaraju se tipkom `Escape`.

## Provjera

```powershell
.\writer-build\build.ps1
.\writer-dist\Writepad.exe --self-test .writer-build\regression-tests-1.6
.\writer-dist\Writepad.exe --pandoc-self-test .writer-build\pandoc-tests-1.6
.\writer-dist\Writepad.exe --writing-self-test .writer-build\writing-tests-1.6
```
