local L = LibStub("AceLocale-3.0"):NewLocale("Mechanic", "deDE")
if not L then
	return
end

-- Core
L["Mechanic"] = "Mechanic"
L["Unknown command: %s"] = "Unbekannter Befehl: %s"
L["Commands: console, errors, tests, perf, reload, gc, pause, copy, clear"] =
	"Befehle: console, errors, tests, perf, reload, gc, pause, copy, clear"
L["GC: %.1f KB freed (%.1f MB -> %.1f MB)"] = "GC: %.1f KB freigegeben (%.1f MB -> %.1f MB)"
L["GC executed: %s freed"] = "GC ausgeführt: %s freigegeben"

-- Tabs
L["Console"] = "Konsole"
L["Errors"] = "Fehler"
L["Tests"] = "Tests"
L["Performance"] = "Leistung"
L["Tools"] = "Werkzeuge"
L["API"] = "API"
L["Inspect"] = "Inspektor"

-- Console
L["Source"] = "Quelle"
L["Category"] = "Kategorie"
L["Search"] = "Suchen"
L["Clear"] = "Löschen"
L["Dedup All"] = "Alle Deduplizieren"
L["Dedup Adj"] = "Benachbarte Deduplizieren"
L["Dedup Adjacent"] = "Benachbarte Deduplizieren"
L["Pause"] = "Pause"
L["Resume"] = "Fortsetzen"
L["Reset Button"] = "Zurücksetzen"
L["All"] = "Alle"
L["System"] = "System"
L["Lines: %d"] = "Zeilen: %d"
L["Lines: 0"] = "Zeilen: 0"
L["Reload UI"] = "UI Neuladen"

-- Errors
L["Session"] = "Sitzung"
L["Current Session"] = "Aktuelle Sitzung"
L["Previous Session"] = "Vorherige Sitzung"
L["All Sessions"] = "Alle Sitzungen"
L["None"] = "Keine"
L["Copy Error"] = "Fehler Kopieren"
L["Wipe"] = "Leeren"
L["Wipe Session"] = "Sitzung Leeren"
L["!BugGrabber Required"] = "!BugGrabber Erforderlich"
L["No errors in this session."] = "Keine Fehler in dieser Sitzung."
L["0/0"] = "0/0"
L["%d/%d"] = "%d/%d"
L["<"] = "<"
L[">"] = ">"
L["Error database wiped."] = "Fehlerdatenbank geleert."
L["[Error]"] = "[Fehler]"
L["Session: %s | Error: %d/%d"] = "Sitzung: %s | Fehler: %d/%d"
L["The Errors module requires !BugGrabber to capture Lua errors."] =
	"Das Fehlermodul benötigt !BugGrabber um Lua-Fehler zu erfassen."
L["Download from:"] = "Download von:"
L["After installing, type /reload"] = "Nach der Installation /reload eingeben"

-- Tests
L["Run Selected"] = "Ausgewählten Ausführen"
L["Run All Auto"] = "Alle Auto Ausführen"
L["Validate"] = "Validieren"
L["Total"] = "Gesamt"
L["Passed"] = "Bestanden"
L["Failed"] = "Fehlgeschlagen"
L["Pending"] = "Ausstehend"
L["PASSED"] = "BESTANDEN"
L["FAILED"] = "FEHLGESCHLAGEN"
L["PENDING"] = "AUSSTEHEND"
L["Status: %s%s|r"] = "Status: %s%s|r"
L["Status: |cff888888Not run|r"] = "Status: |cff888888Nicht ausgeführt|r"
L["Category: %s"] = "Kategorie: %s"
L["Select a test"] = "Test auswählen"
L["Tree View"] = "Baumansicht"
L["Export"] = "Exportieren"
L["Export Button"] = "Exportieren"
L["Duration: %.3fs"] = "Dauer: %.3fs"
L["Message: %s"] = "Nachricht: %s"
L["Details:"] = "Details:"
L["  %s %s: %s%s|r"] = "  %s %s: %s%s|r"
L["Captured Logs:"] = "Erfasste Protokolle:"
L["  %s"] = "  %s"
L["No test selected."] = "Kein Test ausgewählt."
L["Tests complete: %d/%d passed"] = "Tests abgeschlossen: %d/%d bestanden"
L["Result: %d/%d passed, %d failed, %d pending"] = "Ergebnis: %d/%d bestanden, %d fehlgeschlagen, %d ausstehend"
L["%s > %s"] = "%s > %s"
L["Total: %d | Passed: %d | Failed: %d | Pending: %d"] = "Gesamt: %d | Bestanden: %d | Fehlgeschlagen: %d | Ausstehend: %d"
L["No addons have registered diagnostic tools.\n\nAddons can register tools via:\nMechanicLib:Register(name, { tools = { ... } })"] =
	"Keine Addons haben Diagnosewerkzeuge registriert.\n\nAddons können Werkzeuge registrieren via:\nMechanicLib:Register(name, { tools = { ... } })"

-- Performance
L["Auto-Refresh"] = "Auto-Aktualisierung"
L["Reset Stats"] = "Statistiken Zurücksetzen"
L["CPU Profiling"] = "CPU-Profil"
L["FPS"] = "FPS"
L["Latency"] = "Latenz"
L["Memory"] = "Speicher"
L["Addon"] = "Addon"
L["Tracking"] = "Verfolgung"
L["Total Memory"] = "Gesamtspeicher"
L["Reset"] = "Zurücksetzen"
L["FPS: --"] = "FPS: --"
L["FPS: %.0f"] = "FPS: %.0f"
L["Latency: --ms / --ms"] = "Latenz: --ms / --ms"
L["Latency: %dms / %dms"] = "Latenz: %dms / %dms"
L["Lua Memory: -- MB"] = "Lua-Speicher: -- MB"
L["Lua Memory: %s"] = "Lua-Speicher: %s"
L["Tracking: %s | Total Memory: %s"] = "Verfolgung: %s | Gesamtspeicher: %s"
L["Tracking: %s | Total Memory: %s | CPU Profiling: %s"] = "Verfolgung: %s | Gesamtspeicher: %s | CPU-Profil: %s"
L["Total:"] = "Gesamt:"
L["Total: %.2f ms/s"] = "Gesamt: %.2f ms/s"
L["Table View"] = "Tabellenansicht"
L["Performance stats reset."] = "Leistungsstatistiken zurückgesetzt."
L["General"] = "Allgemein"
L["General Tab"] = "Allgemein"
L["Addons Tab"] = "Addons"
L["%"] = "%"
L["CPU ms/s"] = "CPU ms/s"
L["-"] = "-"
L["ON"] = "AN"
L["OFF"] = "AUS"
L["%s - Performance Breakdown"] = "%s - Leistungsübersicht"
L["Metric             | ms/s     | %     | Description"] = "Metrik             | ms/s     | %     | Beschreibung"
L["-------------------|----------|-------|-----------------------------"] =
	"-------------------|----------|-------|-----------------------------"
L["Addon              | Memory   | %     | CPU ms/s | %"] = "Addon              | Speicher | %     | CPU ms/s | %"
L["-------------------|----------|-------|----------|-------"] =
	"-------------------|----------|-------|----------|-------"
L["Addon              | Memory   | %"] = "Addon              | Speicher | %"
L["-------------------|----------|------"] = "-------------------|----------|------"
L["CPU profiling requires a UI reload. Continue?"] = "CPU-Profil erfordert UI-Neuladen. Fortfahren?"
L["Reload"] = "Neuladen"
L["Cancel"] = "Abbrechen"
L["No sub-metrics available for this addon."] = "Keine Untermetriken für dieses Addon verfügbar."
L["Addon performance tracking not available."] = "Addon-Leistungsverfolgung nicht verfügbar."
L["!Mechanic is initializing..."] = "!Mechanic wird initialisiert..."
L["Addon does not provide sub-metrics."] = "Addon stellt keine Untermetriken bereit."
L["Refresh"] = "Aktualisieren"

-- Settings
L["Copy Options"] = "Kopieroptionen"
L["Registered Addons"] = "Registrierte Addons"
L["Console Buffer Size"] = "Konsolenpuffergröße"
L["Show Timestamps"] = "Zeitstempel Anzeigen"
L["Include Environment Header"] = "Umgebungsheader Einschließen"
L["Include Character Info"] = "Charakterinfo Einschließen"
L["Include Timestamp"] = "Zeitstempel Einschließen"
L["Refresh Interval"] = "Aktualisierungsintervall"
L["Track Event Frequency"] = "Ereignishäufigkeit Verfolgen"
L["Show Minimap Icon"] = "Minimap-Symbol Anzeigen"

-- API
L["Run"] = "Ausführen"
L["Run Category"] = "Kategorie Ausführen"
L["Run Namespace"] = "Namespace Ausführen"
L["Copy Report"] = "Bericht Kopieren"
L["Results:"] = "Ergebnisse:"
L["Not yet run"] = "Noch nicht ausgeführt"
L["Notes:"] = "Notizen:"
L["Parameters:"] = "Parameter:"
L["Midnight Impact: %s%s|r"] = "Midnight-Auswirkung: %s%s|r"
L["Midnight Note:"] = "Midnight-Hinweis:"
L["Select an API"] = "API auswählen"
L["Select a category"] = "Kategorie auswählen"
L["Search APIs..."] = "APIs suchen..."
L["▼"] = "▼"
L["PROTECTED"] = "GESCHÜTZT"
L["MISSING"] = "FEHLT"
L["Function not found"] = "Funktion nicht gefunden"
L["Cannot call from addon code"] = "Kann nicht aus Addon-Code aufgerufen werden"
L["This API is protected and cannot be called from addon code in Midnight.\n\nConsider using the reskin strategy with Blizzard frames."] =
	"Diese API ist geschützt und kann in Midnight nicht aus Addon-Code aufgerufen werden.\n\nErwägen Sie die Reskin-Strategie mit Blizzard-Frames."
L["Function not available: %s\n\nThis may be a newer API not yet available in this WoW version."] =
	"Funktion nicht verfügbar: %s\n\nDies könnte eine neuere API sein, die in dieser WoW-Version noch nicht verfügbar ist."
L["No API selected."] = "Keine API ausgewählt."

-- Shared Export
L["Metric"] = "Metrik"
L["ms/s"] = "ms/s"
L["Description"] = "Beschreibung"
L["Press Ctrl+C to copy the text below."] = "Strg+C drücken um den Text zu kopieren."
L["Close"] = "Schließen"
L["Inspecting: %s"] = "Inspiziere: %s"
L["No object selected for inspection."] = "Kein Objekt zur Inspektion ausgewählt."
L["--- Members ---"] = "--- Mitglieder ---"
L["... (truncated)"] = "... (gekürzt)"

-- Inspect
L["Pick"] = "Auswählen"
L["Picking..."] = "Auswählen..."
L["Watch"] = "Überwachen"
L["+ Watch"] = "+ Überwachen"
L["Frame path or global table..."] = "Frame-Pfad oder globale Tabelle..."
L["Select a frame"] = "Frame auswählen"
L["Geometry"] = "Geometrie"
L["Visibility"] = "Sichtbarkeit"
L["Texture"] = "Textur"
L["FontString"] = "Schriftstring"
L["Common Properties"] = "Allgemeine Eigenschaften"
L["Properties"] = "Eigenschaften"
L["Export Changes"] = "Änderungen Exportieren"
L["Reset All Changes"] = "Alle Änderungen Zurücksetzen"
L["Shown"] = "Sichtbar"
L["Alpha"] = "Alpha"
L["Layering"] = "Ebenen"
L["Level"] = "Ebene"
L["Strata"] = "Strata"
L["Width"] = "Breite"
L["Height"] = "Höhe"
L["Frame Level"] = "Frame-Ebene"
L["Frame Strata"] = "Frame-Strata"
L["Scale"] = "Skalierung"
L["Text"] = "Text"
L["Color"] = "Farbe"
L["Text Color"] = "Textfarbe"
L["Vertex Color"] = "Vertexfarbe"
L["No changes to export."] = "Keine Änderungen zum Exportieren."
L["Scripts"] = "Skripte"
L["Watch List"] = "Überwachungsliste"
L["+ Watch Current"] = "+ Aktuelles Überwachen"
L["Remove from Watch List"] = "Von Überwachungsliste Entfernen"
L["Clear Watch List"] = "Überwachungsliste Leeren"
L["Export All"] = "Alles Exportieren"
L["Session: %s | Errors: %d"] = "Sitzung: %s | Fehler: %d"
L["Test Item"] = "Testelement"
L["Player"] = "Spieler"
L["Interactivity"] = "Interaktivität"
L["Anchors"] = "Anker"
L["Regions"] = "Bereiche"
L["Regions (Textures/FontStrings)"] = "Bereiche (Texturen/Schriftzeichen)"
L["FenUI Details"] = "FenUI-Details"
L["Attributes"] = "Attribute"
L["Hierarchy"] = "Hierarchie"
L["Safe"] = "Sicher"
L["Safe APIs Only"] = "Nur sichere APIs"

-- Self-Registration
L["Register Mechanic"] = "Mechanic Registrieren"
L["View Health Log"] = "Gesundheitsprotokoll Anzeigen"
L["Clear Health Log"] = "Gesundheitsprotokoll Leeren"
L["Reset UI Position"] = "UI-Position Zurücksetzen"
L["Export persistent internal error log for agent auditing."] =
	"Persistentes internes Fehlerprotokoll für Agent-Prüfung exportieren."
L["Clear all entries from the persistent health log."] = "Alle Einträge aus dem persistenten Gesundheitsprotokoll löschen."
L["Reset the main frame to default size and position."] = "Hauptframe auf Standardgröße und -position zurücksetzen."
L["Mechanic: Developer tools for World of Warcraft"] = "Mechanic: Entwicklerwerkzeuge für World of Warcraft"
L["Health log cleared."] = "Gesundheitsprotokoll geleert."
L["UI position reset."] = "UI-Position zurückgesetzt."
L["Tools : !Mechanic : View Health Log"] = "Werkzeuge : !Mechanic : Gesundheitsprotokoll Anzeigen"

-- Export Dialog Titles
L["Console Export"] = "Konsole Exportieren"
L["Errors Export"] = "Fehler Exportieren"
L["Tests Export"] = "Tests Exportieren"
L["Performance Export"] = "Leistung Exportieren"
L["Performance: %s"] = "Leistung: %s"
L["API: %s"] = "API: %s"
L["Tools: %s"] = "Werkzeuge: %s"
L["Inspect: %s"] = "Inspektor: %s"
L["API Export"] = "API Exportieren"
L["Tools Export"] = "Werkzeuge Exportieren"
L["Inspect Export"] = "Inspektor Exportieren"

-- Help System
L["Help"] = "Hilfe"

-- Help: Inspect Tab
L["HELP_INSPECT_TITLE"] = "Inspektor-Reiter"
L["HELP_INSPECT_OVERVIEW_HEADING"] = "Übersicht"
L["HELP_INSPECT_OVERVIEW_BODY"] =
	"Der Inspektor-Reiter ist ein leistungsfähiger Frame-Debugger zum Erkunden der WoW-UI-Hierarchie. Sie können jeden sichtbaren Frame auswählen, seine Eltern-/Kind-Beziehungen navigieren, Eigenschaften in Echtzeit bearbeiten und Frames live überwachen."
L["HELP_INSPECT_PICK_HEADING"] = "Auswahlmodus"
L["HELP_INSPECT_PICK_BODY"] =
	"Klicken Sie auf die Auswahl-Schaltfläche (Fadenkreuz-Symbol), um den Auswahlmodus zu starten. Bewegen Sie die Maus über einen Frame in der Spiel-UI - er wird mit einem orangefarbenen Rahmen hervorgehoben und beschriftet. Klicken Sie, um diesen Frame zur Inspektion auszuwählen, oder drücken Sie ESC zum Abbrechen."
L["HELP_INSPECT_PATH_HEADING"] = "Pfadeingabe"
L["HELP_INSPECT_PATH_BODY"] =
	"Geben Sie einen Frame-Pfad direkt in das Eingabefeld ein (z.B. PlayerFrame, Minimap.ZoomIn oder UIParent). Drücken Sie Enter zum Inspizieren. Pfade werden über den globalen WoW-Namespace und die Frame-Hierarchie aufgelöst. Verwenden Sie Punkte, um zu Kind-Frames zu navigieren."
L["HELP_INSPECT_TREE_HEADING"] = "Baumnavigation"
L["HELP_INSPECT_TREE_BODY"] =
	"Das Baum-Panel auf der linken Seite zeigt die Frame-Hierarchie. Klicken Sie auf '>' um Elternknoten zu erweitern und Kinder zu sehen. Klicken Sie auf einen Knoten, um diesen Frame auszuwählen. Der Baum aktualisiert sich, wenn Sie einen neuen Frame auswählen. Augensymbole schalten die Frame-Sichtbarkeit um."
L["HELP_INSPECT_PROPERTIES_HEADING"] = "Eigenschaften-Panel"
L["HELP_INSPECT_PROPERTIES_BODY"] =
	"Das Eigenschaften-Panel ermöglicht Echtzeit-Bearbeitung von Frame-Attributen wie Position, Größe, Alpha, Skalierung, Strata und Farben. Änderungen werden sofort auf die Live-UI angewendet. Jede Eigenschaft hat eine Zurücksetzen-Schaltfläche. Verwenden Sie Änderungen Exportieren für Lua-Code."
L["HELP_INSPECT_DETAILS_HEADING"] = "Details-Panel"
L["HELP_INSPECT_DETAILS_BODY"] =
	"Das Details-Panel zeigt schreibgeschützte Informationen einschließlich Frame-Typ, Elternkette, Anker, Regionen (Texturen/Schriftstrings), Skripte und Attribute. Klicken Sie auf die Zusammenklapp-Umschalter (v/>), um Abschnitte ein- oder auszublenden."
L["HELP_INSPECT_WATCH_HEADING"] = "Überwachungsliste"
L["HELP_INSPECT_WATCH_BODY"] =
	"Heften Sie häufig inspizierte Frames an die Überwachungsliste mit der '+ Überwachen'-Schaltfläche. Überwachte Frames erscheinen im rechten Panel mit live-aktualisierten Werten. Klicken Sie auf einen Überwachungseintrag, um zu diesem Frame zu springen. Löschen entfernt alle Überwachungen."
L["HELP_INSPECT_EXPORT_HEADING"] = "Exportieren"
L["HELP_INSPECT_EXPORT_BODY"] =
	"Die Export-Schaltfläche kopiert alle Frame-Informationen in die Zwischenablage. Bei Eigenschaftsänderungen generiert 'Änderungen Exportieren' gebrauchsfertigen Lua-Code mit Vorher/Nachher-Werten. Ideal zum Teilen mit anderen Entwicklern oder KI-Assistenten."

-- Help: Console Tab
L["HELP_CONSOLE_TITLE"] = "Konsolen-Reiter"
L["HELP_CONSOLE_OVERVIEW_HEADING"] = "Übersicht"
L["HELP_CONSOLE_OVERVIEW_BODY"] =
	"Die Konsole sammelt Debug-Ausgaben aller MechanicLib-registrierten Addons an einem Ort. Sie erfasst Print-Anweisungen, Debug-Logs und benutzerdefinierte Kategorien mit Zeitstempeln. Der Puffer hält die neuesten Einträge (konfigurierbar in den Einstellungen)."
L["HELP_CONSOLE_SOURCE_HEADING"] = "Quellenfilterung"
L["HELP_CONSOLE_SOURCE_BODY"] =
	"Die linke Navigation listet alle Addons auf, die Nachrichten gesendet haben. Wählen Sie ein Addon, um nur dessen Logs anzuzeigen. Wählen Sie 'Alle', um alles zu sehen. Jedes Addon zeigt eine Nachrichtenanzahl in Klammern."
L["HELP_CONSOLE_SEARCH_HEADING"] = "Suche"
L["HELP_CONSOLE_SEARCH_BODY"] =
	"Tippen Sie in das Suchfeld, um Nachrichten nach Textinhalt zu filtern. Die Suche durchsucht Nachrichtentext, Quell-Addon-Name und Kategorie. Kombinieren Sie mit Quellenfilterung für präzise Ergebnisse."
L["HELP_CONSOLE_DEDUP_HEADING"] = "Deduplizierungsmodi"
L["HELP_CONSOLE_DEDUP_BODY"] =
	"Zwei Deduplizierungsmodi reduzieren Rauschen. 'Alle Deduplizieren' entfernt alle doppelten Nachrichten vollständig. 'Benachbarte Deduplizieren' fasst nur aufeinanderfolgende wiederholte Nachrichten zusammen und zeigt eine Anzahl wie (x5). Umschaltflächen sind in der Symbolleiste."
L["HELP_CONSOLE_PAUSE_HEADING"] = "Pause/Fortsetzen"
L["HELP_CONSOLE_PAUSE_BODY"] =
	"Klicken Sie auf Pause, um die Anzeige einzufrieren und keine neuen Nachrichten zu erfassen. So können Sie Logs lesen, ohne dass sie davonscrollen. Erneut klicken zum Fortsetzen. Die Schaltfläche zeigt ein Wiedergabesymbol wenn pausiert."
L["HELP_CONSOLE_CLEAR_HEADING"] = "Löschen"
L["HELP_CONSOLE_CLEAR_BODY"] =
	"Die Löschen-Schaltfläche (Papierkorbsymbol) leert den gesamten Konsolenpuffer. Nützlich, um beim Debuggen einer bestimmten Aktion frisch zu starten. Gelöschte Nachrichten können nicht wiederhergestellt werden."
L["HELP_CONSOLE_EXPORT_HEADING"] = "Exportieren"
L["HELP_CONSOLE_EXPORT_BODY"] =
	"Export kopiert alle aktuell gefilterten Logs in die Zwischenablage in einem teilbaren Format. Falls in den Einstellungen aktiviert, enthält es einen Umgebungsheader mit WoW-Version, Charakterinfo und Standort für vollständigen Fehlerberichtkontext."

-- Help: Errors Tab
L["HELP_ERRORS_TITLE"] = "Fehler-Reiter"
L["HELP_ERRORS_OVERVIEW_HEADING"] = "Übersicht"
L["HELP_ERRORS_OVERVIEW_BODY"] =
	"Der Fehler-Reiter zeigt von !BugGrabber erfasste Lua-Fehler an. Er zeigt die Fehlermeldung, den vollständigen Stack-Trace und lokale Variablen zum Zeitpunkt des Fehlers. Unverzichtbar für Addon-Debugging und Fehlersuche."
L["HELP_ERRORS_SESSION_HEADING"] = "Sitzungs-Dropdown"
L["HELP_ERRORS_SESSION_BODY"] =
	"Filtern Sie Fehler nach Sitzung mit dem Dropdown. 'Aktuelle Sitzung' zeigt Fehler seit Ihrem letzten /reload. 'Vorherige Sitzung' zeigt Fehler von vor dem letzten Reload. 'Alle Sitzungen' zeigt die vollständige von BugGrabber gespeicherte Fehlerhistorie."
L["HELP_ERRORS_SOURCE_HEADING"] = "Quellenfilterung"
L["HELP_ERRORS_SOURCE_BODY"] =
	"Die linke Navigation gruppiert Fehler nach dem verursachenden Addon. Mechanic erkennt die Quelle automatisch aus dem Stack-Trace. Klicken Sie auf ein Addon, um nur dessen Fehler zu sehen. Die Anzahl zeigt, wie viele Fehler das Addon hat."
L["HELP_ERRORS_NAV_HEADING"] = "Fehlernavigation"
L["HELP_ERRORS_NAV_BODY"] =
	"Verwenden Sie die < und > Schaltflächen, um Fehler einzeln durchzugehen. Der Zähler zeigt Ihre aktuelle Position (z.B. 3/12). Die Hauptanzeige zeigt den vollständigen Fehler mit koloriertem Stack-Trace zur leichteren Lesbarkeit."
L["HELP_ERRORS_PAUSE_HEADING"] = "Pause"
L["HELP_ERRORS_PAUSE_BODY"] =
	"Klicken Sie auf Pause, um die Erfassung neuer Fehler zu stoppen. Nützlich, wenn Sie vorhandene Fehler untersuchen möchten, ohne dass neue hinzukommen. Fehlerzahl und Anzeige bleiben eingefroren bis Sie fortsetzen."
L["HELP_ERRORS_WIPE_HEADING"] = "Leeren"
L["HELP_ERRORS_WIPE_BODY"] =
	"Die Leeren-Schaltfläche (Papierkorbsymbol) löscht die gesamte BugGrabber-Fehlerdatenbank. Verwenden Sie dies nach dem Beheben von Fehlern oder wenn die Fehlerliste zu lang wird. Diese Aktion kann nicht rückgängig gemacht werden."
L["HELP_ERRORS_EXPORT_HEADING"] = "Exportieren"
L["HELP_ERRORS_EXPORT_BODY"] =
	"Export kopiert alle Fehler (oder den aktuell gefilterten Satz) in die Zwischenablage mit vollständigen Stack-Traces. Enthält Umgebungsheader falls aktiviert. Perfekt zum Teilen in Fehlerberichten oder zum Einfügen in KI-Assistenten zur Debugging-Hilfe."
L["HELP_ERRORS_BUGGRABBER_HEADING"] = "BugGrabber Erforderlich"
L["HELP_ERRORS_BUGGRABBER_BODY"] =
	"Dieses Modul benötigt das !BugGrabber-Addon zum Erfassen von Lua-Fehlern. Wenn nicht installiert, sehen Sie Anweisungen zum Download von CurseForge oder WoWInterface. Nach der Installation /reload eingeben."

-- Help: Tests Tab
L["HELP_TESTS_TITLE"] = "Tests-Reiter"
L["HELP_TESTS_OVERVIEW_HEADING"] = "Übersicht"
L["HELP_TESTS_OVERVIEW_BODY"] =
	"Der Tests-Reiter bietet einen Test-Runner für Addon-Diagnosen. Addons können Tests über MechanicLib registrieren, um ihre Funktionalität zu validieren. Tests sind nach Addon und Kategorie in einer Baumansicht organisiert."
L["HELP_TESTS_TREE_HEADING"] = "Testbaum"
L["HELP_TESTS_TREE_BODY"] =
	"Durchsuchen Sie hierarchisch organisierte Tests: Addon > Kategorie > Test. Klicken Sie zum Erweitern von Knoten. Jeder Test zeigt ein Statussymbol. Klicken Sie auf einen Test, um seine Details im rechten Panel zu sehen. Der Baum aktualisiert sich nach Testausführung."
L["HELP_TESTS_RUN_HEADING"] = "Ausgewählten Ausführen"
L["HELP_TESTS_RUN_BODY"] =
	"Klicken Sie auf die Wiedergabe-Schaltfläche, um den aktuell ausgewählten Test auszuführen. Das Ergebnis erscheint im Details-Panel mit Bestanden/Fehlgeschlagen-Status, Ausführungsdauer, Fehlermeldungen und erfasster Log-Ausgabe."
L["HELP_TESTS_AUTO_HEADING"] = "Alle Auto Ausführen"
L["HELP_TESTS_AUTO_BODY"] =
	"Die 'Alle Auto Ausführen'-Schaltfläche führt alle mit autoRun = true markierten Tests aller registrierten Addons aus. Dies sind typischerweise schnelle Validierungstests. Eine Zusammenfassung erscheint im Chat mit Gesamt-Bestanden/Fehlgeschlagen."
L["HELP_TESTS_DETAILS_HEADING"] = "Testdetails"
L["HELP_TESTS_DETAILS_BODY"] =
	"Wenn ein Test ausgewählt ist, zeigt das Details-Panel: Testname, Kategorie, Typ (auto/manuell), farbcodierter Status, Ausführungsdauer in Sekunden, Fehlermeldungen, strukturierte Ergebnisdetails und erfasste Logs."
L["HELP_TESTS_STATUS_HEADING"] = "Statussymbole"
L["HELP_TESTS_STATUS_BODY"] =
	"Teststatus wird mit farbigen Symbolen angezeigt: [+] grün = bestanden, [x] rot = fehlgeschlagen, [?] gelb = ausstehend/läuft, [-] grau = noch nicht ausgeführt. Diese erscheinen sowohl im Baum als auch im Details-Panel."
L["HELP_TESTS_EXPORT_HEADING"] = "Exportieren"
L["HELP_TESTS_EXPORT_BODY"] =
	"Export kopiert alle Testergebnisse in die Zwischenablage in einem strukturierten Format. Enthält Bestanden/Fehlgeschlagen-Zählungen, einzelne Testergebnisse und Fehlerdetails. Nützlich für CI-Berichte oder zum Teilen mit Teammitgliedern."

-- Help: Performance Tab
L["HELP_PERF_TITLE"] = "Leistungs-Reiter"
L["HELP_PERF_OVERVIEW_HEADING"] = "Übersicht"
L["HELP_PERF_OVERVIEW_BODY"] =
	"Der Leistungs-Reiter überwacht die Ressourcennutzung von Addons einschließlich Speicher und CPU-Zeit. Die Allgemein-Ansicht zeigt Systemmetriken (FPS, Latenz, Lua-Speicher). Klicken Sie auf ein Addon in der linken Navigation für dessen detaillierte Aufschlüsselung."
L["HELP_PERF_GENERAL_HEADING"] = "Allgemeine Ansicht"
L["HELP_PERF_GENERAL_BODY"] =
	"Die Standardansicht zeigt: aktuelle FPS, Home/World-Latenz, gesamte Lua-Speichernutzung und eine sortierbare Tabelle aller Addons mit Speicher- und CPU-Statistiken. Die Fußzeile zeigt Verfolgungsdauer und Gesamtwerte."
L["HELP_PERF_ADDONS_HEADING"] = "Addon-Liste"
L["HELP_PERF_ADDONS_BODY"] =
	"Die Addon-Tabelle zeigt die Speichernutzung jedes Addons (KB/MB), Prozentsatz vom Gesamten, CPU-Zeit (ms/s bei aktivem Profiling) und CPU-Prozentsatz. Klicken Sie auf Spaltenüberschriften zum Sortieren. Klicken Sie auf eine Addon-Zeile für detaillierte Aufschlüsselung."
L["HELP_PERF_CPU_HEADING"] = "CPU-Profiling"
L["HELP_PERF_CPU_BODY"] =
	"Aktivieren Sie CPU-Profiling über das Kontrollkästchen, um die CPU-Nutzung pro Addon zu verfolgen. Dies erfordert einen UI-Reload, da es das eingebaute WoW-Profiling-System verwendet. CPU-Spalten zeigen Millisekunden pro Sekunde und Prozentsatz der Frame-Zeit."
L["HELP_PERF_REFRESH_HEADING"] = "Auto-Aktualisierung"
L["HELP_PERF_REFRESH_BODY"] =
	"Wenn aktiviert, werden Metriken automatisch alle paar Sekunden aktualisiert. Deaktivieren Sie dies für Snapshot-Analyse, wenn Sie stabile Zahlen benötigen. Manuelle Aktualisierung erfolgt beim Wechseln von Ansichten oder Rückkehr zum Reiter."
L["HELP_PERF_SUBMETRICS_HEADING"] = "Untermetriken"
L["HELP_PERF_SUBMETRICS_BODY"] =
	"Wählen Sie ein Addon in der linken Navigation, um dessen registrierte Untermetriken-Aufschlüsselung zu sehen. Addons können benutzerdefinierte Metriken über MechanicLib registrieren, die interne Zeitmessungen zeigen (z.B. 'Ereignisverarbeitung: 2.5ms'). Nicht alle Addons bieten dies."
L["HELP_PERF_RESET_HEADING"] = "Statistiken Zurücksetzen"
L["HELP_PERF_RESET_BODY"] =
	"Klicken Sie auf Zurücksetzen, um gesammelte Leistungsdaten zu löschen und von Null zu messen. Nützlich nach Ladebildschirmen, großen Ereignissen oder wenn Sie eine frische Messbasis für eine bestimmte Aktivität benötigen."
L["HELP_PERF_EXPORT_HEADING"] = "Exportieren"
L["HELP_PERF_EXPORT_BODY"] =
	"Export kopiert alle Leistungsdaten in die Zwischenablage in einer formatierten Tabelle. Enthält Systemmetriken, alle Addon-Speicher/CPU-Statistiken und Untermetriken bei Anzeige eines bestimmten Addons. Ideal für Leistungsberichte."

-- Help: Tools Tab
L["HELP_TOOLS_TITLE"] = "Werkzeuge-Reiter"
L["HELP_TOOLS_OVERVIEW_HEADING"] = "Übersicht"
L["HELP_TOOLS_OVERVIEW_BODY"] =
	"Der Werkzeuge-Reiter hostet benutzerdefinierte Diagnosepanels, die von Addons registriert wurden. Jedes Addon kann seine eigene Werkzeuge-UI für Debugging, Konfiguration oder spezialisierte Operationen bereitstellen. Wählen Sie ein Addon aus der linken Navigation, um dessen Panel anzuzeigen."
L["HELP_TOOLS_ADDON_HEADING"] = "Addon-Auswahl"
L["HELP_TOOLS_ADDON_BODY"] =
	"Die linke Navigation listet alle Addons auf, die Werkzeuge über MechanicLib registriert haben. Klicken Sie auf einen Addon-Namen, um dessen benutzerdefiniertes Panel im Inhaltsbereich zu laden. Das Panel wird vom eigenen Code des Addons erstellt."
L["HELP_TOOLS_PANEL_HEADING"] = "Werkzeugpanels"
L["HELP_TOOLS_PANEL_BODY"] =
	"Jedes Addon definiert sein eigenes Werkzeugpanel-Layout. Häufige Verwendungen umfassen: interne Logs anzeigen, Zustand zurücksetzen, Debug-Optionen konfigurieren, Daten exportieren und addon-spezifische Diagnosen ausführen. Konsultieren Sie die Dokumentation jedes Addons."
L["HELP_TOOLS_REGISTER_HEADING"] = "Für Addon-Entwickler"
L["HELP_TOOLS_REGISTER_BODY"] =
	"Registrieren Sie Werkzeuge via MechanicLib:Register(name, { tools = { createPanel = function(parent), destroyPanel = function(panel) } }). Ihre createPanel-Funktion erhält einen Eltern-Frame, den Sie mit UI-Elementen füllen können."
L["HELP_TOOLS_EXPORT_HEADING"] = "Exportieren"
L["HELP_TOOLS_EXPORT_BODY"] =
	"Export kopiert eine Zusammenfassung der registrierten Werkzeuganbieter in die Zwischenablage. Nützlich für MechanicLib-Integrations-Debugging oder zur Dokumentation, welche Addons die Werkzeugschnittstelle unterstützen."

-- Help: API Tab
L["HELP_API_TITLE"] = "API-Reiter"
L["HELP_API_OVERVIEW_HEADING"] = "Übersicht"
L["HELP_API_OVERVIEW_BODY"] =
	"Der API-Reiter ist eine Testbank zum Erkunden von WoWs Lua-APIs. Durchsuchen Sie kategorisierte Funktionen, testen Sie sie mit Parametern, sehen Sie Rückgabewerte und prüfen Sie die Midnight 12.0-Kompatibilität. Unverzichtbar für Addon-Entwicklung und Fehlerbehebung."
L["HELP_API_BROWSER_HEADING"] = "API-Browser"
L["HELP_API_BROWSER_BODY"] =
	"Die linke Navigation organisiert APIs nach Kategorie (Unit, Spell, Item, Frame, etc.). Verwenden Sie das Suchfeld zum Filtern nach Name. Kategorieüberschriften sind fett und nicht anklickbar. Klicken Sie auf eine API, um ihre Details und Parameter zu sehen."
L["HELP_API_PARAMS_HEADING"] = "Parameter"
L["HELP_API_PARAMS_BODY"] =
	"Jede API zeigt ihre Parameter mit Eingabefeldern. Geben Sie Werte direkt ein oder verwenden Sie das Dropdown (v), um aus gängigen Beispielen zu wählen. Parametertypen werden in Klammern angezeigt. Erforderlich vs. optional wird angegeben."
L["HELP_API_RUN_HEADING"] = "Ausführen-Schaltfläche"
L["HELP_API_RUN_BODY"] =
	"Klicken Sie auf Ausführen, um die API mit Ihren aktuellen Parameterwerten auszuführen. Ergebnisse erscheinen im Ergebnisfeld unten mit Rückgabewerten, Fehlern oder 'geschützt'-Status. Nützlich zum Testen der API-Verfügbarkeit."
L["HELP_API_CATEGORY_HEADING"] = "Kategorie Ausführen"
L["HELP_API_CATEGORY_BODY"] =
	"Klicken Sie auf 'Alle Ausführen', um alle APIs in der aktuellen Kategorie im Batch zu testen. Dies identifiziert schnell, welche APIs verfügbar, geschützt oder in Ihrer WoW-Version fehlend sind. Ergebniszusammenfassung erscheint mit Zählungen."
L["HELP_API_MIDNIGHT_HEADING"] = "Midnight-Auswirkung"
L["HELP_API_MIDNIGHT_BODY"] =
	"Jede API zeigt ihren Midnight 12.0-Kompatibilitätsstatus. GRÜN = unverändert und sicher. GELB = bedingt (Verhalten kann abweichen). ROT = brechend (geschützt oder entfernt). Prüfen Sie den Midnight-Hinweis für spezifische Anleitungen."
L["HELP_API_NOTES_HEADING"] = "Persönliche Notizen"
L["HELP_API_NOTES_BODY"] =
	"Das Notizen-Feld unten ermöglicht es Ihnen, persönliche Anmerkungen für jede API zu speichern. Notizen werden in Ihrem Mechanic-Profil gespeichert und bleiben sitzungsübergreifend erhalten. Verwenden Sie sie für Erinnerungen, Workarounds oder Dokumentation."
L["HELP_API_EXPORT_HEADING"] = "Bericht Kopieren"
L["HELP_API_EXPORT_BODY"] =
	"Die Kopieren-Schaltfläche exportiert die Details der aktuellen API einschließlich Name, Kategorie, Parameter, Midnight-Status, letzte Laufergebnisse und Ihre Notizen. Perfekt für Dokumentation oder zum Teilen in Diskussionen."
