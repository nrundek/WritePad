# Changelog

## Writepad [2.9.5] - 2026-10-03

- Added File > New dictation document: a separate blank page for transcribing a recording, with its own File and Sound menus.
  - File: Open audio file (Ctrl+Shift+O, MP3 and WAV), Save file (Ctrl+S, TXT) and Close dictation writing (Ctrl+F4), which returns to the main window and offers to save unsaved text.
  - Sound: Play / pause (Ctrl+Space, both while typing in the text and in the player), Back / Forward 5 seconds (Left / Right arrow while the player has focus), Return to start (Ctrl+Shift+Space) and Switch between text and player (Ctrl+Tab).
  - Playback is controlled only by you: opening a file and typing never start or pause the recording.
  - The recording is controlled on its own thread, so typed letters appear without delay and screen readers echo them while the sound plays.
- Added File > Writing speed: a separate blank page with a File menu (Save file Ctrl+S as TXT, Close measurement Ctrl+F4). Timing starts with the first typed character and stops at two Enters in a row; the total time, characters including spaces and the average speed in characters (keystrokes), words and syllables per minute are then written below the text.
- Fixed the A4 page view with Windows display scaling (for example 150 %): lines no longer run past the right margin, the page is sized to the real screen DPI, and pages break where the displayed lines reach the bottom of the sheet, so enlarged text (up to 34 points) always fits its page.
- The installer's completion step no longer offers "Run application"; it shows the completion message and OK.
- Help and Keyboard shortcuts describe the new windows and their shortcuts; README updated.
- Updated application, installer and help to 2.9.5.
## Writepad [2.9] - 2026-10-01

- Increase font / Decrease font (Ctrl++ / Ctrl+-, toolbar buttons A+ / A−) now really change the size of the letters instead of zooming the whole page: the A4 sheet keeps its size and margins, and the text reflows into more or fewer lines and pages, as when the font size is changed in Microsoft Word.
- The page count, Go to page and the page shown in the status bar follow the reflowed pages; the Dyslexia-friendly display reflows the same way.
- Font size remains a display preference: printing, PDF and the saved document keep their own font sizes.
- Added Edit > New page with Ctrl+Enter, as in Microsoft Word. It inserts a page break at the cursor and the text after it starts on a new page. The shortcut works in the writing area only; Enter keeps its usual meaning in dialogs. The right-click Insert > Page break command shows the same shortcut.
- Help describes the new font behaviour and the Ctrl+Enter shortcut.
- Added README.md.
- Updated application, installer and help to 2.9.

## Writepad [2.8.1] - 2026-09-25

- Save / Save As now list plain text (TXT) first and use it as the default for new documents (previously DOCX); opened TXT, DOCX, MD and RTF documents are still saved in the format they were opened in.
- Renamed Review > "Word wrap while writing" to "Word wrap" ("Prijelom riječi" / "Prelamanje reči"), including Help and spoken announcements.
- Word wrap page view is consistent across the whole document: the page being edited now lays out lines on the same device as pagination, and the other pages are drawn by the editor itself, so fonts, line spacing and margins match on every page at any zoom, in Dark mode and in the Dyslexia-friendly display.
- The page being edited no longer hides its last line when enlarged text is taller than the page layout.
- Framed the Decrease font, Increase font, Dark mode and Dyslexia-friendly display buttons.
- Framed the status-bar entries (page, counts, writing goal) and drew them in the text colour so they stay readable in Dark mode.
- Fixed a garbled dash in the document switcher list.
- Updated application, installer and help to 2.8.1.

## Writepad [2.8] - 2026-09-24

- With word wrap off, the document is shown as a continuous Word-style sheet with side margins; lines flow to the window width, so no text is hidden past the right edge.
- With word wrap on, the A4 line width now follows the zoom, so the left and right 2.5 cm margins are equal at every font size.
- Increase / Decrease font now change the displayed size by one point, from 12 to 34 points, and announce when the smallest or largest size is reached.
- Inactive pages are rendered at on-screen size, so enlarged text stays sharp, and an enlarged page scrolls horizontally to keep the caret in view.
- The workspace around the A4 page keeps its own colour, as in Word.
- Updated application, installer and help to 2.8.

## Writepad [2.7.3] - 2026-09-24

- Added Help > Official website, opening https://tiflolab.eu in the default web browser.

- Removed File > Export and added PDF and HTML to Save / Save As alongside TXT, DOCX, Markdown and RTF.
- Added Ctrl+Shift+F for Font and size.
- Updated application, installer and help to 2.7.3.

## Writepad [2.7.2] - 2026-09-23

- Made every main-menu command available in the right-click menu with synchronized labels, availability and check states.

- Fixed unwrapped document display with a full scrolling editor viewport and native caret scrolling.
- Removed duplicate active-page bitmap rendering that left glyph fragments beside text.
- Added synchronized Dark mode and Dyslexia-friendly display buttons next to font controls.
- Updated application and installer metadata and release artifacts to 2.7.2.

## Writepad [2.7] - 2026-09-18

- Restored the Word wrap option to the writing area; the read-only HTML preview now remains wrapped independently.
- Added separate preferences for registering Writepad as an available editor for text and DOCX files, plus Windows Default Apps confirmation for `.docx`. Opening a DOCX file never changes its default application automatically.
- Registered `writepad` through Windows App Paths so the installed application can be launched from the Run dialog.
- Replaced Export to PDF with an Export submenu containing PDF and HTML.
- Replaced the desktop/application icon with an open white writing pad and green fountain pen in seven Windows icon sizes.
- Added a high-contrast line between pages and clearer spoken/visual page-number announcements when reading, writing, crossing a page boundary, or using Go to page.
- Added DOCX input to Merge files alongside TXT and Markdown.
- Raised the application, installer, Help, tests, documentation, and release artifacts to version 2.7.
- Release installer: `writepad_setup_2.7.exe`.

## Writepad [2.5] - 2026-09-17

- Added direct opening and saving of Microsoft Word DOCX documents while keeping Writepad's core editing, navigation, formatting, counting, and accessibility tools available.
- Replaced the notebook workflow with a standard document workflow for DOCX, RTF, TXT, and Markdown files.
- Added DOCX support to the additional-document review window and removed notebook commands and `.writer` file associations from the interface and installer.
- Made Page view and Continuous view mutually exclusive, checkable Review-menu options; the active view is also shown and switchable from the status bar.
- Added page count to the Word, character, and page counts dialog.
- Expanded the status bar with current/total pages, words, characters with and without spaces, text-page units, lines, active view, and writing-goal progress.
- Replaced the old ring-bound notebook decoration with a restrained paper surface, subtle edge, and shadow.
- Document formatting, writing journal, goals, bookmarks, display mode, and related metadata are remembered privately by filename and protected by a content check.
- Improved large-document responsiveness by debouncing pagination and counts until typing pauses and by avoiding full line-array allocation during ordinary caret movement.
- Release installer: `writepad_setup_2.5.exe`.

## Writepad [2.02] - 2026-09-16

- Corrected the Croatian update prompt to use the feminine pronoun for “version”.
- Moved font zoom and reset to File > Accessibility while preserving their keyboard shortcuts; dark mode and dyslexia mode are persistent checkable options there.
- Added a persistent dyslexia-friendly display with a legible sans-serif interface, enlarged writing display, 1.5 line spacing, left alignment, and a warm low-glare palette.
- Improved contrast, focus visibility, control borders, and mouse targets throughout the application.

- Added separate A4 sheets, accessible current-page status, and page-range printing using a shared RichEdit pagination engine.
- Added Go to line (Ctrl+G), Go to page (Ctrl+Shift+G), font selection and font-size menu commands, and persistent default font preferences.
- Re-enabled native text drag/drop and restored native one-level Escape menu navigation.
- First-save dialogs start in the operating system Documents folder.
- TXT/MD formatting is stored atomically in private application storage, matched by path and content, with unique filename fallback for moved files. Legacy sidecars remain readable.
- Installer registers Open With support for TXT, MD, RTF, DOCX and WRITER without changing Windows default applications.
- Release installer: writepad_setup_2.02.exe.


## Writepad [1.6.8] - 2026-09-10

- Copied text and rich-text formatting are now flushed to the Windows clipboard so they remain available after Writepad closes.
- Added a background update check at every normal startup against `https://tiflolab.eu/wp-content/uploads/2026/09/writepad/`.
- Available updates now show a Yes/No prompt; declining does not suppress the prompt on later startups.
- Confirmed updates are downloaded from the trusted directory, verified, installed automatically, and Writepad is restarted.
- Raised the application, installer, Help, reports, documentation, and release artifacts to version 1.6.8.

## Writepad [1.6.7] - 2026-09-08

- Find now leaves the caret at the start of the match and announces the found text after Enter or Find next.
- Added Find next to the Edit menu on Ctrl+Shift+F3, including dispatch while the Find dialog has focus.
- Reworked Find and replace buttons to Replace, Replace all, and Close, with accessible completion messages and replacement counts.
- Raised the application, installer, Help, reports, documentation, and release artifacts to version 1.6.7.

## Writepad [1.6.1] - 2026-09-06

- Replaced the brief in-app Help with a complete Writepad 1.6.1 manual.
- Added the requested introduction describing Writepad as an advanced writing application, Markdown editor, and replacement for the Windows text editor.
- Documented every command in File, Edit, Writing, Counts, Bookmarks, Review, and Help, including all 106 Pandoc Markdown submenu commands and their available shortcuts.
- Raised the application, installer, reports, documentation, and release artifacts to version 1.6.1.

## Writepad [1.6] - 2026-09-06

- Enforced 2.5 cm on all four margins in the page view, notebook metadata, printing, and exports.
- Moved Date and time from Ctrl+Alt+D to Ctrl+F5.
- Added Ctrl+7 for converting the current line or selected paragraphs to body text and removing an accidental heading.
- Removed spoken and visual line-number messages from navigation; Announce new line now only plays the existing bell while typing enters a new line.
- Updated Help and the generated HTML keyboard-shortcut catalogue.
- Replaced the GitHub update feed with the tiflolab.eu update directory and automatic selection of the highest `writepad_setup_N.exe` version.
- Added a ready-to-upload `writepad_setup_1.6.exe` release artifact and restricted update downloads to the exact HTTPS host, directory, filename pattern, publisher, and installer version.
- Raised the application, installer, reports, documentation, and release artifacts to version 1.6.

## Writepad [1.5] - 2026-09-06

- Added the standard Windows print dialog on Ctrl+P for `.writer` notebooks and `.txt` files, with rendered output for Markdown notebooks.
- Replaced the Review submenu with one Add file or notebook command on Ctrl+Shift+I for `.writer` and `.txt` files.
- Added a Keyboard shortcuts Help document in HTML, grouped under every menu heading and closed with Escape.
- Added an immediate screen-reader announcement when writing-key blocking starts after a goal is reached.
- Raised the application, installer, reports, documentation, and release artifacts to version 1.5.

## Writepad [1.3] - 2026-09-06

- Rebuilt the writing-goal alert around a single explicit close path: OK, Enter, Space on the focused OK button, and Escape all dismiss it reliably.
- Put initial focus on OK while retaining the alert message in the dialog accessibility name for screen-reader announcement.
- Coalesced queued and simultaneously reached goals into one modal notification so the same alert cannot immediately reopen.
- Raised the application, installer, Help, reports, documentation, and release artifacts to version 1.3.

## Writepad [1.1] - 2026-09-06

- Combined word and both character counts in an accessible three-item F2 list and shifted the remaining F4-F10 commands to F3-F9.
- Added writing goals measured in text page units using the notebook's selected 1,800- or 1,500-character calculation.
- Made the goal-reached alert foreground-modal, immediately lock writing, and signal blocked typing keys until the alert is acknowledged; OK and Enter now close it reliably, and simultaneous goals produce one notification.
- Announced line numbers before screen-reader line content during keyboard navigation while preserving the typing bell.
- Exposed the native has-popup accessibility state on menu items that contain submenus.
- Added a higher Ctrl+Home tone and a lower Ctrl+End tone.
- Added background loading and focus retention when merging `.writer`, `.txt`, and `.md` files.
- Debounced page-map, status, and preview refreshes, optimized common single-character metadata edits, and replaced repeated statistics regular expressions with a single-pass counter.

## Writepad [1.0] - 2026-09-05

- Renamed the application, installer, shortcuts, associations, Help, and update repository from WriterBook to Writepad 1.0 while keeping the `.writer` notebook extension.
- Added verified removal of the previous WriterBook installation and migration of existing user settings.
- Added separate New file, Open file, and Merge files commands for `.txt` and `.md` documents.
- Added the Review and Bookmarks menus, moved text-page-unit calculation to Counts, and moved line or selection formatting to Edit.
- Added multi-document review in separate windows with cycling and individual close commands.
- Reworked the writing journal around New entry and Browse journal, with Escape saving, Enter editing, and Delete removal.
- Converted plain-text headings and direct bold, italic, and underline formatting to Markdown markers when switching modes.
- Fixed repeated F2-F5 screen-reader announcements and Escape focus restoration from the menu bar.
- Added optional current-line announcements and spoken and visual save confirmation.
- Added typewriter Shift press and release sounds and a new notebook-and-quill application icon.
- Replaced spoken line-number feedback while typing with a short bell, while retaining spoken line numbers during navigation and reading.
- Simplified the writing-goal completion message and removed redundant menu/submenu wording and visible parenthesized access letters.
- Changed menu command shortcut separators from commas to hyphens.
- Standardized editor, HTML preview, Word export, and PDF export defaults on Arial 12, 1.5 line spacing, and 18/16/14-point first-level headings.

## [3.0] - 2026-09-04

- Added Edit > Date and time with Ctrl+Alt+D to insert the computer's current localized date and time at the selection.
- Added a persistent checkable Writing > Word wrap option with wrapped vertical scrolling or unwrapped horizontal scrolling, retained in read mode and applied to HTML preview.
- Renamed the Croatian typing-sound commands to use “pisaći stroj” and “brajični stroj”.
- Updated application, Help, documentation, automated reports, installer metadata, and release artifacts to version 3.0.

## [2.0.1] - 2026-09-04

- Replaced the separate character function-key announcements with an accessible F3 list for characters excluding and including spaces; arrow keys read the two values and Escape returns to the document.
- Added text page unit calculation from either 1800 or 1500 characters including spaces, saved per `.writer` notebook, with F4 announcing the result.
- Added F5 current-line and total-line reporting.
- Added an accessible modal warning when a configured writing goal is reached.
- Added UTF-8 `.txt` opening and saving, with Ctrl+S for text save, Ctrl+Shift+S for text Save As, Ctrl+W for WriterBook notebook save, and Ctrl+Shift+E for Word/PDF export.
- Added File settings for registering WriterBook as an app for `.txt` and opening Windows Default Apps for user confirmation.
- Updated application, Help, documentation, automated reports, installer metadata, and release artifacts to version 2.0.1.

## [1.2.6] - 2026-09-03

- Removed the spelling-check, typography-check and personal-dictionary commands from the Writing menu and their Ctrl+F5/F6 shortcuts.
- Added a project-bound plain-text writing journal on Ctrl+F4, with New entry and Browse entries views.
- Automatically timestamps non-empty journal entries when they are saved or the journal closes, and stores them inside the `.writer` project.
- Made Ctrl+F4 and Escape close the journal and return focus to the writing document.
- Fixed intermittent Alt+F4 handling by allowing the normal Windows close key path instead of intercepting F4 in the menu keyboard hook.
- Fixed upgrades leaving duplicate old and new icons by removing legacy per-user desktop and Start menu shortcuts.
- Made uninstall remove both per-user and all-users shortcuts and delete the complete verified WriterBook program folder while preserving notebooks, exports, and settings.
- Updated Croatian, Serbian and English interface text, Help, documentation, application and installer to version 1.2.6.

## [1.2.5] - 2026-09-03

- Added Ctrl+M start/end selection with localized visible and spoken on/off announcements in Edit.
- Moved heading levels 1-6 to Ctrl+1-6 and added Ctrl+Shift+1/2/3 line-or-selection bold, italic and underline commands while retaining Ctrl+B/I/U typing toggles.
- Moved heading navigation to Ctrl+F1/F2, the heading list to Ctrl+Shift+H, spelling/typography review to Ctrl+F4/F5, and the personal dictionary to Ctrl+F6.
- Moved the read-only HTML preview switch to Shift+F6 and the Pandoc Markdown guide to Ctrl+Alt+M.
- Simplified proofreading to one issue and proposed change at a time, announced the number of findings, and exposed Correct, Ignore and Add to dictionary actions in a predictable tab order.
- Added an accessible personal-dictionary editor for all supported proofreading languages.
- Focus the HTML document immediately for reading and return with Shift+F6 or Escape.
- Fixed Alt+Tab so leaving an open notebook no longer opens the File menu.
- Extended plain-writing heading storage, HTML and Word import/export to heading level 6 and updated Croatian, Serbian and English help.

## [1.2.2] - 2026-09-03

- Replaced Ctrl+F4 RTF preview with a read-only WebView2 HTML document in both writing modes, including semantic headings, tables, lists, links, images and footnotes.
- Added browser-level keyboard return, heading navigation and list, reflow and 50-400% zoom; preview preserves source, selection, formatting and metadata.
- Verify rendered HTML and actual browser accessibility roles/heading levels; disable document scripts and editing in preview.
- Added mutually exclusive checked Writing (plain text) and Writing (Pandoc Markdown) menu choices.
- Default new notebooks to plain writing with the original direct rich-text formatting.
- Restore each notebook's saved mode, including recovery copies; legacy notebooks without a mode remain plain.
- Keep text and direct formatting when switching modes; disable Markdown-only commands in plain writing.
- Verified startup, checkmarks, repeated selection, per-notebook persistence, legacy loading, recovery and literal Word export in all three languages.

## [1.2.1] - 2026-09-03

- Fixed Ctrl+B/Ctrl+I typing toggles and added Ctrl+U as an underline toggle, also from Writing commands.
- Announce Bold, Italic and Underline on/off through the focused editor's accessibility events and expose checked menu states.
- Keep already typed formatting when switching off; handle nested styles, empty toggles and trailing spaces.
- Ctrl+F4 now returns from both previews to the writing document with the previous selection and focus.
- Added regression checks for typing, selection, style combinations, localized announcements and the real preview return route.

## [1.2] - 2026-09-03

- Added 106 categorized Pandoc Markdown commands and a searchable, accessible syntax guide in Writing.
- Bundled official Pandoc 3.11 with checksum verification, original notices and source archive.
- Added Markdown reader extension controls, notebook persistence and defaults-file import/export.
- Routed Markdown Word export through Pandoc; added RTF preview and HTML, EPUB, ODT, LaTeX, PPTX, RTF and text export.
- Added six-level and Setext heading navigation, metadata merging, unique footnotes and code delimiters.
- Added syntax, semantic export, insertion/undo, accessibility, language and persistence tests.
- Documented RTF/PDF and live-counter limitations; preserved the previous 1.1 installer.

## [1.1] - 2026-09-02

### Added

- Basic Markdown writing with headings 1-3, bold, italic, inline/fenced code, literal escapes and an accessible formatted preview.
- Paragraph heading styles, previous/next heading navigation and a heading list, including in preview.
- Ctrl+F1 through Ctrl+F12 commands, Ctrl+Shift+F1 for body paragraphs, Ctrl+B for bold and Ctrl+I for italics; existing function keys remain available.
- Offline dictionary checks for Croatian, Serbian Latin/Cyrillic and US English, with suggestions, explicit replacements, skip commands and persistent personal dictionaries.
- Typography review for repeated spaces, spaces before punctuation and repeated words, with selection-scoped checking and Markdown code/URL exclusions.
- Automatic working copies every 30 seconds, recovery of untitled notebooks, startup recovery and active-window locking.
- Atomic notebook saves and one previous saved version in `.writer.bak`.
- Markdown file import/export, rendered-text counters and semantic headings in Word/PDF export.
- Integration tests for the writing tools, languages, shortcuts, persistence and recovery failures.

### Changed

- New notebooks start in Markdown mode; older `.writer` notebooks retain rich-text mode.
- Added the Writing menu and updated Help, documentation, application and installer to WriterBook 1.1.

## [1.0.8] - 2026-09-02

### Changed

- Replaced the writing area's startup accessibility message with **New digital notebook, writing document** and removed the additional Alt/F1 instructions.
- Made **Enable typewriter sound** and **Enable braille writer sound** mutually exclusive. Enabling either option now disables the other, while both may remain disabled.
- When upgrading settings that previously had both sounds enabled, the typewriter sound remains enabled and the braille-writer sound is disabled.
- Updated application, installer, Help, documentation, and release artifacts to version 1.0.8.

## [1.0.7] - 2026-09-02

### Added

- Added a complete in-app update flow that downloads the latest GitHub `Setup.exe` release asset, verifies its SHA-256 digest, installs it, and restarts WriterBook after user confirmation.
- Added an installer auto-update mode that waits for the running WriterBook process to close before replacing application files.

### Fixed

- The update-available dialog now offers to download and install immediately instead of ending without an action after **OK**.
- Upgrades now preserve the user's language and typing-sound settings instead of replacing the settings file with defaults.

### Changed

- Updated application, installer, Help, documentation, and release artifacts to version 1.0.7.

## [1.0.6] - 2026-09-02

### Changed

- Kept only the option names **Enable typewriter sound** and **Enable braille writer sound**, with their standard checked or unchecked states.
- Removed the additional accessible descriptions, on/off announcements, and redundant Help explanations for the two sound options.
- Updated application, installer, documentation, and release artifacts to version 1.0.6.

## [1.0.5] - 2026-09-02

### Changed

- Renamed the two Edit-menu commands to **Enable typewriter sound** and **Enable braille writer sound**.
- Made the typewriter and Perkins Brailler sounds fully independent checkable options. Either sound, both sounds, or neither sound can now be enabled.
- When both options are checked, WriterBook plays a combined sample so both mechanical sounds remain audible.
- Migrated the saved Perkins selection from version 1.0.4 to the new independent braille-sound setting.
- Updated in-app Help, project documentation, installer metadata, and release artifacts for version 1.0.5.

## [1.0.4] - 2026-09-02

### Added

- Added two persistent, checkable commands to **Edit**: **Enable typewriter sound** and **Use braille writer sound**.
- Added embedded old-typewriter and classic Perkins Brailler keystroke sounds for typing, deleting, pasting, undoing, and other text edits.
- Added `F7`, `F8`, `F9`, and `F10` to the visible and screen-reader-accessible names of the bookmark commands in **Edit**.

### Fixed

- `F7` and `F8` bookmark confirmations are now announced from the focused writing area, so NVDA, JAWS, and other screen readers can reliably read them.
- Repeated announcements no longer restore a stale announcement as the writing area's accessible name.

### Changed

- Updated application, installer, update-check, file metadata, documentation, and release artifact names to version 1.0.4.
- Added third-party audio attribution and license notices to installed distributions.

