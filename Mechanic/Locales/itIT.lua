-- Italian locale for Mechanic
local L = LibStub("AceLocale-3.0"):NewLocale("Mechanic", "itIT")
if not L then return end

-- Core
L["Mechanic"] = "Mechanic"
L["Unknown command: %s"] = "Comando sconosciuto: %s"
L["Commands: console, errors, tests, perf, reload, gc, pause, copy, clear"] = "Comandi: console, errors, tests, perf, reload, gc, pause, copy, clear"
L["GC: %.1f KB freed (%.1f MB -> %.1f MB)"] = "GC: %.1f KB liberati (%.1f MB -> %.1f MB)"
L["GC executed: %s freed"] = "GC eseguito: %s liberati"

-- Tabs
L["Console"] = "Console"
L["Errors"] = "Errori"
L["Tests"] = "Test"
L["Performance"] = "Prestazioni"
L["Tools"] = "Strumenti"
L["API"] = "API"
L["Inspect"] = "Ispeziona"

-- Console
L["Source"] = "Origine"
L["Category"] = "Categoria"
L["Search"] = "Cerca"
L["Clear"] = "Pulisci"
L["Dedup All"] = "Deduplica Tutto"
L["Dedup Adj"] = "Deduplica Ady."
L["Dedup Adjacent"] = "Deduplica Adiacenti"
L["Pause"] = "Pausa"
L["Resume"] = "Riprendi"
L["Reset Button"] = "Reimposta"
L["All"] = "Tutto"
L["System"] = "Sistema"
L["Lines: %d"] = "Righe: %d"
L["Lines: 0"] = "Righe: 0"
L["Reload UI"] = "Ricarica IU"

-- Errors
L["Session"] = "Sessione"
L["Current Session"] = "Sessione Corrente"
L["Previous Session"] = "Sessione Precedente"
L["All Sessions"] = "Tutte le Sessioni"
L["None"] = "Nessuno"
L["Copy Error"] = "Copia Errore"
L["Wipe"] = "Cancella"
L["Wipe Session"] = "Cancella Sessione"
L["!BugGrabber Required"] = "!BugGrabber Richiesto"
L["No errors in this session."] = "Nessun errore in questa sessione."
L["0/0"] = "0/0"
L["%d/%d"] = "%d/%d"
L["<"] = "<"
L[">"] = ">"
L["Error database wiped."] = "Database errori cancellato."
L["[Error]"] = "[Errore]"
L["Session: %s | Error: %d/%d"] = "Sessione: %s | Errore: %d/%d"
L["The Errors module requires !BugGrabber to capture Lua errors."] = "Il modulo Errori richiede !BugGrabber per catturare errori Lua."
L["Download from:"] = "Scarica da:"
L["After installing, type /reload"] = "Dopo l'installazione, digita /reload"

-- Tests
L["Run Selected"] = "Esegui Selezionato"
L["Run All Auto"] = "Esegui Tutto Auto"
L["Validate"] = "Valida"
L["Total"] = "Totale"
L["Passed"] = "Superato"
L["Failed"] = "Fallito"
L["Pending"] = "In Attesa"
L["PASSED"] = "SUPERATO"
L["FAILED"] = "FALLITO"
L["PENDING"] = "IN ATTESA"
L["Status: %s%s|r"] = "Stato: %s%s|r"
L["Status: |cff888888Not run|r"] = "Stato: |cff888888Non eseguito|r"
L["Category: %s"] = "Categoria: %s"
L["Select a test"] = "Seleziona un test"
L["Tree View"] = "Vista ad Albero"
L["Export"] = "Esporta"
L["Export Button"] = "Esporta"
L["Duration: %.3fs"] = "Durata: %.3fs"
L["Message: %s"] = "Messaggio: %s"
L["Details:"] = "Dettagli:"
L["  %s %s: %s%s|r"] = "  %s %s: %s%s|r"
L["Captured Logs:"] = "Log Catturati:"
L["  %s"] = "  %s"
L["No test selected."] = "Nessun test selezionato."
L["Tests complete: %d/%d passed"] = "Test completati: %d/%d superati"
L["Result: %d/%d passed, %d failed, %d pending"] = "Risultato: %d/%d superati, %d falliti, %d in attesa"
L["%s > %s"] = "%s > %s"
L["Total: %d | Passed: %d | Failed: %d | Pending: %d"] = "Totale: %d | Superati: %d | Falliti: %d | In Attesa: %d"
L["No addons have registered diagnostic tools.\n\nAddons can register tools via:\nMechanicLib:Register(name, { tools = { ... } })"] =
	"Nessun addon ha registrato strumenti diagnostici.\n\nGli addon possono registrare strumenti via:\nMechanicLib:Register(name, { tools = { ... } })"

-- Performance
L["Auto-Refresh"] = "Aggiornamento Auto"
L["Reset Stats"] = "Reimposta Statistiche"
L["CPU Profiling"] = "Profilazione CPU"
L["FPS"] = "FPS"
L["Latency"] = "Latenza"
L["Memory"] = "Memoria"
L["Addon"] = "Addon"
L["Tracking"] = "Tracciamento"
L["Total Memory"] = "Memoria Totale"
L["Reset"] = "Reimposta"
L["FPS: --"] = "FPS: --"
L["FPS: %.0f"] = "FPS: %.0f"
L["Latency: --ms / --ms"] = "Latenza: --ms / --ms"
L["Latency: %dms / %dms"] = "Latenza: %dms / %dms"
L["Lua Memory: -- MB"] = "Memoria Lua: -- MB"
L["Lua Memory: %s"] = "Memoria Lua: %s"
L["Tracking: %s | Total Memory: %s"] = "Tracciamento: %s | Memoria Totale: %s"
L["Tracking: %s | Total Memory: %s | CPU Profiling: %s"] = "Tracciamento: %s | Memoria Totale: %s | Profilazione CPU: %s"
L["Total:"] = "Totale:"
L["Total: %.2f ms/s"] = "Totale: %.2f ms/s"
L["Table View"] = "Vista Tabella"
L["Performance stats reset."] = "Statistiche prestazioni reimpostate."
L["General"] = "Generale"
L["General Tab"] = "Generale"
L["Addons Tab"] = "Addon"
L["%"] = "%"
L["CPU ms/s"] = "CPU ms/s"
L["-"] = "-"
L["ON"] = "ATTIVO"
L["OFF"] = "DISATTIVO"
L["%s - Performance Breakdown"] = "%s - Dettaglio Prestazioni"
L["Metric             | ms/s     | %     | Description"] = "Metrica            | ms/s     | %     | Descrizione"
L["-------------------|----------|-------|-----------------------------"] = "-------------------|----------|-------|-----------------------------"
L["Addon              | Memory   | %     | CPU ms/s | %"] = "Addon              | Memoria  | %     | CPU ms/s | %"
L["-------------------|----------|-------|----------|-------"] = "-------------------|----------|-------|----------|-------"
L["Addon              | Memory   | %"] = "Addon              | Memoria  | %"
L["-------------------|----------|------"] = "-------------------|----------|------"
L["CPU profiling requires a UI reload. Continue?"] = "La profilazione CPU richiede un ricaricamento dell'IU. Continuare?"
L["Reload"] = "Ricarica"
L["Cancel"] = "Annulla"
L["No sub-metrics available for this addon."] = "Nessuna sotto-metrica disponibile per questo addon."
L["Addon performance tracking not available."] = "Tracciamento prestazioni addon non disponibile."
L["!Mechanic is initializing..."] = "!Mechanic è in inizializzazione..."
L["Addon does not provide sub-metrics."] = "L'addon non fornisce sotto-metriche."
L["Refresh"] = "Aggiorna"

-- Settings
L["Copy Options"] = "Opzioni di Copia"
L["Registered Addons"] = "Addon Registrati"
L["Console Buffer Size"] = "Dimensione Buffer Console"
L["Show Timestamps"] = "Mostra Timestamp"
L["Include Environment Header"] = "Includi Intestazione Ambiente"
L["Include Character Info"] = "Includi Info Personaggio"
L["Include Timestamp"] = "Includi Timestamp"
L["Refresh Interval"] = "Intervallo di Aggiornamento"
L["Track Event Frequency"] = "Traccia Frequenza Eventi"
L["Show Minimap Icon"] = "Mostra Icona Minimappa"

-- API
L["Run"] = "Esegui"
L["Run Category"] = "Esegui Categoria"
L["Run Namespace"] = "Esegui Namespace"
L["Copy Report"] = "Copia Rapporto"
L["Results:"] = "Risultati:"
L["Not yet run"] = "Non ancora eseguito"
L["Notes:"] = "Note:"
L["Parameters:"] = "Parametri:"
L["Midnight Impact: %s%s|r"] = "Impatto Midnight: %s%s|r"
L["Midnight Note:"] = "Nota Midnight:"
L["Select an API"] = "Seleziona un'API"
L["Select a category"] = "Seleziona una categoria"
L["Search APIs..."] = "Cerca API..."
L["▼"] = "▼"
L["PROTECTED"] = "PROTETTO"
L["MISSING"] = "MANCANTE"
L["Function not found"] = "Funzione non trovata"
L["Cannot call from addon code"] = "Non può essere chiamata da codice addon"
L["This API is protected and cannot be called from addon code in Midnight.\n\nConsider using the reskin strategy with Blizzard frames."] =
	"Questa API è protetta e non può essere chiamata da codice addon in Midnight.\n\nConsidera di usare la strategia reskin con i frame Blizzard."
L["Function not available: %s\n\nThis may be a newer API not yet available in this WoW version."] =
	"Funzione non disponibile: %s\n\nQuesta potrebbe essere un'API più recente non ancora disponibile in questa versione di WoW."
L["No API selected."] = "Nessuna API selezionata."

-- Shared Export
L["Metric"] = "Metrica"
L["ms/s"] = "ms/s"
L["Description"] = "Descrizione"
L["Press Ctrl+C to copy the text below."] = "Premi Ctrl+C per copiare il testo."
L["Close"] = "Chiudi"
L["Inspecting: %s"] = "Ispezionando: %s"
L["No object selected for inspection."] = "Nessun oggetto selezionato per l'ispezione."
L["--- Members ---"] = "--- Membri ---"
L["... (truncated)"] = "... (troncato)"

-- Inspect
L["Pick"] = "Seleziona"
L["Picking..."] = "Selezione..."
L["Watch"] = "Osserva"
L["+ Watch"] = "+ Osserva"
L["Frame path or global table..."] = "Percorso frame o tabella globale..."
L["Select a frame"] = "Seleziona un frame"
L["Geometry"] = "Geometria"
L["Visibility"] = "Visibilità"
L["Texture"] = "Texture"
L["FontString"] = "FontString"
L["Common Properties"] = "Proprietà Comuni"
L["Properties"] = "Proprietà"
L["Export Changes"] = "Esporta Modifiche"
L["Reset All Changes"] = "Reimposta Tutte le Modifiche"
L["Shown"] = "Visibile"
L["Alpha"] = "Alpha"
L["Layering"] = "Livelli"
L["Level"] = "Livello"
L["Strata"] = "Strato"
L["Width"] = "Larghezza"
L["Height"] = "Altezza"
L["Frame Level"] = "Livello Frame"
L["Frame Strata"] = "Strato Frame"
L["Scale"] = "Scala"
L["Text"] = "Testo"
L["Color"] = "Colore"
L["Text Color"] = "Colore Testo"
L["Vertex Color"] = "Colore Vertice"
L["No changes to export."] = "Nessuna modifica da esportare."
L["Scripts"] = "Script"
L["Watch List"] = "Lista di Osservazione"
L["+ Watch Current"] = "+ Osserva Corrente"
L["Remove from Watch List"] = "Rimuovi dalla Lista"
L["Clear Watch List"] = "Pulisci Lista"
L["Export All"] = "Esporta Tutto"
L["Session: %s | Errors: %d"] = "Sessione: %s | Errori: %d"
L["Test Item"] = "Elemento di Test"
L["Player"] = "Giocatore"

-- Self-Registration
L["Register Mechanic"] = "Registra Mechanic"
L["View Health Log"] = "Visualizza Log Salute"
L["Clear Health Log"] = "Pulisci Log Salute"
L["Reset UI Position"] = "Reimposta Posizione IU"
L["Export persistent internal error log for agent auditing."] =
	"Esporta log errori interno persistente per audit agent."
L["Clear all entries from the persistent health log."] = "Pulisci tutte le voci dal log salute persistente."
L["Reset the main frame to default size and position."] = "Reimposta il frame principale a dimensione e posizione predefinite."
L["Mechanic: Developer tools for World of Warcraft"] = "Mechanic: Strumenti di sviluppo per World of Warcraft"
L["Health log cleared."] = "Log salute pulito."
L["UI position reset."] = "Posizione IU reimpostata."
L["Tools : !Mechanic : View Health Log"] = "Strumenti : !Mechanic : Visualizza Log Salute"

-- Export Dialog Titles
L["Console Export"] = "Esporta Console"
L["Errors Export"] = "Esporta Errori"
L["Tests Export"] = "Esporta Test"
L["Performance Export"] = "Esporta Prestazioni"
L["Performance: %s"] = "Prestazioni: %s"
L["API: %s"] = "API: %s"
L["Tools: %s"] = "Strumenti: %s"
L["Inspect: %s"] = "Ispeziona: %s"
L["API Export"] = "Esporta API"
L["Tools Export"] = "Esporta Strumenti"
L["Inspect Export"] = "Esporta Ispezione"

-- Help System
L["Help"] = "Aiuto"

-- Missing Keys
L["Interactivity"] = "Interattività"
L["Anchors"] = "Ancoraggi"
L["Regions"] = "Regioni"
L["Regions (Textures/FontStrings)"] = "Regioni (Texture/FontString)"
L["FenUI Details"] = "Dettagli FenUI"
L["Attributes"] = "Attributi"
L["Hierarchy"] = "Gerarchia"
L["Safe"] = "Sicuro"
L["Safe APIs Only"] = "Solo API Sicure"

-- Help: Inspect Tab
L["HELP_INSPECT_TITLE"] = "Scheda Ispeziona"
L["HELP_INSPECT_OVERVIEW_HEADING"] = "Panoramica"
L["HELP_INSPECT_OVERVIEW_BODY"] =
	"La scheda Ispeziona è un potente debugger di frame per esplorare la gerarchia dell'UI di WoW. Puoi selezionare qualsiasi frame visibile, navigare le relazioni padre/figlio, modificare proprietà in tempo reale e monitorare i frame per aggiornamenti live."
L["HELP_INSPECT_PICK_HEADING"] = "Modalità Selezione"
L["HELP_INSPECT_PICK_BODY"] =
	"Clicca il pulsante Seleziona (icona mirino) per entrare in modalità selezione. Muovi il mouse su qualsiasi frame nell'UI del gioco - verrà evidenziato con un bordo arancione ed etichetta. Clicca per selezionare quel frame per l'ispezione, o premi ESC per annullare."
L["HELP_INSPECT_PATH_HEADING"] = "Input Percorso"
L["HELP_INSPECT_PATH_BODY"] =
	"Digita un percorso frame direttamente nel campo di input (es., PlayerFrame, Minimap.ZoomIn, o UIParent). Premi Invio per ispezionare. I percorsi vengono risolti usando il namespace globale di WoW e la gerarchia dei frame. Usa punti per attraversare i frame figli."
L["HELP_INSPECT_TREE_HEADING"] = "Navigazione Albero"
L["HELP_INSPECT_TREE_BODY"] =
	"Il pannello Albero a sinistra mostra la gerarchia dei frame. Clicca '>' per espandere nodi padre e vedere i figli. Clicca su qualsiasi nodo per selezionare quel frame. L'albero si aggiorna quando selezioni un nuovo frame. Le icone occhio alternano la visibilità del frame."
L["HELP_INSPECT_PROPERTIES_HEADING"] = "Pannello Proprietà"
L["HELP_INSPECT_PROPERTIES_BODY"] =
	"Il pannello Proprietà permette la modifica in tempo reale di attributi frame come posizione, dimensione, alfa, scala, strato e colori. Le modifiche vengono applicate istantaneamente all'UI live. Ogni proprietà ha un pulsante reset per ripristinare modifiche individuali. Usa Esporta Modifiche per generare codice Lua."
L["HELP_INSPECT_DETAILS_HEADING"] = "Pannello Dettagli"
L["HELP_INSPECT_DETAILS_BODY"] =
	"Il pannello Dettagli mostra informazioni di sola lettura inclusi tipo frame, catena genitori, ancoraggi, regioni (texture/fontstring), script e attributi. Clicca i toggle di collasso (v/>) per mostrare o nascondere sezioni."
L["HELP_INSPECT_WATCH_HEADING"] = "Lista Osservazione"
L["HELP_INSPECT_WATCH_BODY"] =
	"Fissa frame ispezionati frequentemente alla Lista Osservazione usando il pulsante '+ Osserva'. I frame osservati appaiono nel pannello destro con valori che si aggiornano live. Clicca una voce osservata per saltare a quel frame. Il pulsante Pulisci rimuove tutte le osservazioni."
L["HELP_INSPECT_EXPORT_HEADING"] = "Esporta"
L["HELP_INSPECT_EXPORT_BODY"] =
	"Il pulsante Esporta copia tutte le informazioni del frame negli appunti. Se hai fatto modifiche alle proprietà, 'Esporta Modifiche' genera codice Lua pronto all'uso mostrando valori prima/dopo. Ottimo per condividere con altri sviluppatori o agenti AI."

-- Help: Console Tab
L["HELP_CONSOLE_TITLE"] = "Scheda Console"
L["HELP_CONSOLE_OVERVIEW_HEADING"] = "Panoramica"
L["HELP_CONSOLE_OVERVIEW_BODY"] =
	"La Console aggrega output di debug da tutti gli addon registrati con MechanicLib in un unico posto. Cattura istruzioni print, log di debug e categorie personalizzate con timestamp. Il buffer mantiene le voci più recenti (configurabile nelle impostazioni)."
L["HELP_CONSOLE_SOURCE_HEADING"] = "Filtro Origine"
L["HELP_CONSOLE_SOURCE_BODY"] =
	"La navigazione sinistra elenca tutti gli addon che hanno inviato messaggi. Seleziona un addon per mostrare solo i suoi log. Seleziona 'Tutto' per vedere tutto. Ogni addon mostra un conteggio dei suoi messaggi tra parentesi."
L["HELP_CONSOLE_SEARCH_HEADING"] = "Ricerca"
L["HELP_CONSOLE_SEARCH_BODY"] =
	"Digita nella casella di ricerca per filtrare messaggi per contenuto testo. La ricerca confronta il testo del messaggio, nome addon origine e categoria. Combina con filtro origine per risultati precisi."
L["HELP_CONSOLE_DEDUP_HEADING"] = "Modalità Deduplica"
L["HELP_CONSOLE_DEDUP_BODY"] =
	"Due modalità deduplica aiutano a ridurre il rumore. 'Deduplica Tutto' rimuove tutti i messaggi duplicati completamente, mantenendo solo voci uniche. 'Deduplica Adiacenti' comprime solo messaggi ripetuti consecutivi, mostrando un conteggio come (x5). I pulsanti sono nella barra strumenti."
L["HELP_CONSOLE_PAUSE_HEADING"] = "Pausa/Riprendi"
L["HELP_CONSOLE_PAUSE_BODY"] =
	"Clicca il pulsante Pausa per bloccare la visualizzazione e smettere di catturare nuovi messaggi. Questo ti permette di leggere i log senza che scorrano via. Clicca di nuovo per riprendere. Il pulsante mostra un'icona play quando in pausa."
L["HELP_CONSOLE_CLEAR_HEADING"] = "Pulisci"
L["HELP_CONSOLE_CLEAR_BODY"] =
	"Il pulsante Pulisci (icona cestino) svuota l'intero buffer della console. Utile per iniziare da zero quando debug un'azione o scenario specifico. I messaggi puliti non possono essere recuperati."
L["HELP_CONSOLE_EXPORT_HEADING"] = "Esporta"
L["HELP_CONSOLE_EXPORT_BODY"] =
	"Esporta copia tutti i log attualmente filtrati negli appunti in formato condivisibile. Se abilitato nelle impostazioni, include un header ambiente con versione WoW, info personaggio e posizione per contesto completo del bug report."

-- Help: Errors Tab
L["HELP_ERRORS_TITLE"] = "Scheda Errori"
L["HELP_ERRORS_OVERVIEW_HEADING"] = "Panoramica"
L["HELP_ERRORS_OVERVIEW_BODY"] =
	"La scheda Errori mostra errori Lua catturati da !BugGrabber. Mostra il messaggio di errore, stack trace completo e variabili locali al momento dell'errore. Essenziale per debug addon e tracciamento bug."
L["HELP_ERRORS_SESSION_HEADING"] = "Menu Sessione"
L["HELP_ERRORS_SESSION_BODY"] =
	"Filtra errori per sessione usando il menu a tendina. 'Sessione Corrente' mostra errori dall'ultimo /reload. 'Sessione Precedente' mostra errori da prima dell'ultimo reload. 'Tutte le Sessioni' mostra lo storico errori completo salvato da BugGrabber."
L["HELP_ERRORS_SOURCE_HEADING"] = "Filtro Origine"
L["HELP_ERRORS_SOURCE_BODY"] =
	"La navigazione sinistra raggruppa errori per addon che li ha causati. Mechanic rileva automaticamente l'origine dallo stack trace. Clicca un addon per vedere solo i suoi errori. Il conteggio mostra quanti errori ha quell'addon."
L["HELP_ERRORS_NAV_HEADING"] = "Navigazione Errori"
L["HELP_ERRORS_NAV_BODY"] =
	"Usa i pulsanti < e > per scorrere gli errori uno alla volta. Il contatore mostra la tua posizione attuale (es., 3/12). La visualizzazione principale mostra l'errore completo con stack trace colorato per facile lettura."
L["HELP_ERRORS_PAUSE_HEADING"] = "Pausa"
L["HELP_ERRORS_PAUSE_BODY"] =
	"Clicca Pausa per smettere di catturare nuovi errori. Utile quando vuoi esaminare errori esistenti senza che ne vengano aggiunti nuovi. Il conteggio errori e la visualizzazione si bloccano fino a quando riprendi."
L["HELP_ERRORS_WIPE_HEADING"] = "Cancella"
L["HELP_ERRORS_WIPE_BODY"] =
	"Il pulsante Cancella (icona cestino) elimina l'intero database errori di BugGrabber. Usalo per iniziare da zero dopo aver risolto bug o quando la lista errori diventa troppo lunga. Questa azione non può essere annullata."
L["HELP_ERRORS_EXPORT_HEADING"] = "Esporta"
L["HELP_ERRORS_EXPORT_BODY"] =
	"Esporta copia tutti gli errori (o il set filtrato corrente) negli appunti con stack trace completi. Include header ambiente se abilitato. Perfetto per condividere in bug report o incollare in assistenti AI per aiuto debug."
L["HELP_ERRORS_BUGGRABBER_HEADING"] = "BugGrabber Richiesto"
L["HELP_ERRORS_BUGGRABBER_BODY"] =
	"Questo modulo richiede l'addon !BugGrabber per catturare errori Lua. Se non installato, vedrai istruzioni per scaricarlo da CurseForge o WoWInterface. Dopo l'installazione, digita /reload."

-- Help: Tests Tab
L["HELP_TESTS_TITLE"] = "Scheda Test"
L["HELP_TESTS_OVERVIEW_HEADING"] = "Panoramica"
L["HELP_TESTS_OVERVIEW_BODY"] =
	"La scheda Test fornisce un esecutore di test per diagnostica addon. Gli addon possono registrare test via MechanicLib per validare la loro funzionalità. I test sono organizzati per addon e categoria in vista albero."
L["HELP_TESTS_TREE_HEADING"] = "Albero Test"
L["HELP_TESTS_TREE_BODY"] =
	"Naviga i test organizzati gerarchicamente: Addon > Categoria > Test. Clicca per espandere nodi. Ogni test mostra un'icona stato. Clicca un test per vedere i dettagli nel pannello destro. L'albero si aggiorna dopo l'esecuzione dei test."
L["HELP_TESTS_RUN_HEADING"] = "Esegui Selezionato"
L["HELP_TESTS_RUN_BODY"] =
	"Clicca il pulsante play per eseguire il test attualmente selezionato. Il risultato appare nel pannello dettagli mostrando stato superato/fallito, durata esecuzione, messaggi errore e output log catturato."
L["HELP_TESTS_AUTO_HEADING"] = "Esegui Tutto Auto"
L["HELP_TESTS_AUTO_BODY"] =
	"Il pulsante 'Esegui Tutto Auto' esegue tutti i test marcati con autoRun = true in tutti gli addon registrati. Questi sono tipicamente test di validazione rapida. Un riepilogo appare in chat mostrando totale superati/falliti."
L["HELP_TESTS_DETAILS_HEADING"] = "Dettagli Test"
L["HELP_TESTS_DETAILS_BODY"] =
	"Quando un test è selezionato, il pannello dettagli mostra: nome test, categoria, tipo (auto/manuale), stato con codice colore, durata esecuzione in secondi, messaggio errore, dettagli risultato strutturati e log catturati."
L["HELP_TESTS_STATUS_HEADING"] = "Icone Stato"
L["HELP_TESTS_STATUS_BODY"] =
	"Lo stato test è mostrato con icone colorate: [+] verde = superato, [x] rosso = fallito, [?] giallo = in attesa/esecuzione, [-] grigio = non ancora eseguito. Questi appaiono sia nell'albero che nel pannello dettagli."
L["HELP_TESTS_EXPORT_HEADING"] = "Esporta"
L["HELP_TESTS_EXPORT_BODY"] =
	"Esporta copia tutti i risultati test negli appunti in formato strutturato. Include conteggi superati/falliti, risultati test individuali e dettagli errori. Utile per report CI o condivisione con membri del team."

-- Help: Performance Tab
L["HELP_PERF_TITLE"] = "Scheda Prestazioni"
L["HELP_PERF_OVERVIEW_HEADING"] = "Panoramica"
L["HELP_PERF_OVERVIEW_BODY"] =
	"La scheda Prestazioni monitora l'uso risorse addon inclusa memoria e tempo CPU. La vista Generale mostra metriche sistema (FPS, latenza, memoria Lua). Clicca un addon nella navigazione sinistra per vedere il suo dettaglio."
L["HELP_PERF_GENERAL_HEADING"] = "Vista Generale"
L["HELP_PERF_GENERAL_BODY"] =
	"La vista predefinita mostra: FPS corrente, latenza home/world, uso memoria Lua totale e una tabella ordinabile di tutti gli addon con statistiche memoria e CPU. Il footer mostra durata tracciamento e totali."
L["HELP_PERF_ADDONS_HEADING"] = "Lista Addon"
L["HELP_PERF_ADDONS_BODY"] =
	"La tabella addon mostra l'uso memoria di ogni addon (KB/MB), percentuale del totale, tempo CPU (ms/s se profilazione abilitata) e percentuale CPU. Clicca intestazioni colonna per ordinare. Clicca riga addon per dettaglio."
L["HELP_PERF_CPU_HEADING"] = "Profilazione CPU"
L["HELP_PERF_CPU_BODY"] =
	"Abilita Profilazione CPU tramite checkbox per tracciare uso CPU per addon. Richiede ricaricamento UI perché usa il sistema profilazione integrato di WoW. Le colonne CPU mostrano millisecondi per secondo e percentuale tempo frame."
L["HELP_PERF_REFRESH_HEADING"] = "Aggiornamento Auto"
L["HELP_PERF_REFRESH_BODY"] =
	"Quando abilitato, le metriche si aggiornano automaticamente ogni pochi secondi. Disabilita per analisi snapshot quando vuoi numeri stabili. Aggiornamento manuale avviene cambiando vista o tornando alla scheda."
L["HELP_PERF_SUBMETRICS_HEADING"] = "Sotto-Metriche"
L["HELP_PERF_SUBMETRICS_BODY"] =
	"Seleziona un addon nella navigazione sinistra per vedere il dettaglio delle sue sotto-metriche registrate. Gli addon possono registrare metriche personalizzate via MechanicLib mostrando timing interni (es., 'Elaborazione Eventi: 2.5ms'). Non tutti gli addon forniscono questo."
L["HELP_PERF_RESET_HEADING"] = "Reimposta Statistiche"
L["HELP_PERF_RESET_BODY"] =
	"Clicca Reimposta per cancellare i dati prestazioni accumulati e iniziare a misurare da zero. Utile dopo schermate caricamento, eventi importanti o quando vuoi una baseline di misurazione fresca per un'attività specifica."
L["HELP_PERF_EXPORT_HEADING"] = "Esporta"
L["HELP_PERF_EXPORT_BODY"] =
	"Esporta copia tutti i dati prestazioni negli appunti in tabella formattata. Include metriche sistema, tutte le statistiche memoria/CPU addon e sotto-metriche se visualizzi un addon specifico. Ottimo per report prestazioni."

-- Help: Tools Tab
L["HELP_TOOLS_TITLE"] = "Scheda Strumenti"
L["HELP_TOOLS_OVERVIEW_HEADING"] = "Panoramica"
L["HELP_TOOLS_OVERVIEW_BODY"] =
	"La scheda Strumenti ospita pannelli diagnostici personalizzati registrati da addon. Ogni addon può fornire la propria UI strumenti per debug, configurazione o operazioni specializzate. Seleziona un addon dalla navigazione sinistra per vedere il suo pannello."
L["HELP_TOOLS_ADDON_HEADING"] = "Selezione Addon"
L["HELP_TOOLS_ADDON_BODY"] =
	"La navigazione sinistra elenca tutti gli addon che hanno registrato strumenti via MechanicLib. Clicca nome addon per caricare il suo pannello personalizzato nell'area contenuto. Il pannello è creato dal codice dell'addon stesso."
L["HELP_TOOLS_PANEL_HEADING"] = "Pannelli Strumenti"
L["HELP_TOOLS_PANEL_BODY"] =
	"Ogni addon definisce il proprio layout pannello strumenti. Usi comuni includono: visualizzare log interni, reimpostare stato, configurare opzioni debug, esportare dati ed eseguire diagnostica specifica addon. Consulta la documentazione di ogni addon."
L["HELP_TOOLS_REGISTER_HEADING"] = "Per Sviluppatori Addon"
L["HELP_TOOLS_REGISTER_BODY"] =
	"Registra strumenti via MechanicLib:Register(name, { tools = { createPanel = function(parent), destroyPanel = function(panel) } }). La tua funzione createPanel riceve un frame padre da popolare con elementi UI."
L["HELP_TOOLS_EXPORT_HEADING"] = "Esporta"
L["HELP_TOOLS_EXPORT_BODY"] =
	"Esporta copia un riepilogo dei provider strumenti registrati negli appunti. Utile per debug integrazione MechanicLib o documentare quali addon supportano l'interfaccia strumenti."

-- Help: API Tab
L["HELP_API_TITLE"] = "Scheda API"
L["HELP_API_OVERVIEW_HEADING"] = "Panoramica"
L["HELP_API_OVERVIEW_BODY"] =
	"La scheda API è un banco prova per esplorare le API Lua di WoW. Sfoglia funzioni categorizzate, testale con parametri, vedi valori ritorno e verifica compatibilità Midnight 12.0. Essenziale per sviluppo addon e risoluzione problemi."
L["HELP_API_BROWSER_HEADING"] = "Browser API"
L["HELP_API_BROWSER_BODY"] =
	"La navigazione sinistra organizza le API per categoria (Unit, Spell, Item, Frame, ecc.). Usa la casella ricerca per filtrare per nome. Le intestazioni categoria sono in grassetto e non cliccabili. Clicca qualsiasi API per vedere dettagli e parametri."
L["HELP_API_PARAMS_HEADING"] = "Parametri"
L["HELP_API_PARAMS_BODY"] =
	"Ogni API mostra i suoi parametri con campi input. Digita valori direttamente o usa il menu a tendina (v) per selezionare da esempi comuni. I tipi parametro sono mostrati tra parentesi. Obbligatorio vs opzionale è indicato."
L["HELP_API_RUN_HEADING"] = "Pulsante Esegui"
L["HELP_API_RUN_BODY"] =
	"Clicca Esegui per eseguire l'API con i valori parametri correnti. I risultati appaiono nel box Risultati sotto mostrando valori ritorno, errori o stato 'protetto'. Utile per testare disponibilità API."
L["HELP_API_CATEGORY_HEADING"] = "Esegui Categoria"
L["HELP_API_CATEGORY_BODY"] =
	"Clicca 'Esegui Tutto' per testare in batch ogni API nella categoria corrente. Questo identifica rapidamente quali API sono disponibili, protette o mancanti nella tua versione WoW. Appare riepilogo risultati con conteggi."
L["HELP_API_MIDNIGHT_HEADING"] = "Impatto Midnight"
L["HELP_API_MIDNIGHT_BODY"] =
	"Ogni API mostra il suo stato compatibilità Midnight 12.0. VERDE = invariato e sicuro. GIALLO = condizionale (comportamento può differire). ROSSO = breaking (protetto o rimosso). Controlla Nota Midnight per guida specifica."
L["HELP_API_NOTES_HEADING"] = "Note Personali"
L["HELP_API_NOTES_BODY"] =
	"Il campo Note in basso ti permette di salvare annotazioni personali per ogni API. Le note sono salvate nel tuo profilo Mechanic e persistono tra sessioni. Usa per promemoria, workaround o documentazione."
L["HELP_API_EXPORT_HEADING"] = "Copia Report"
L["HELP_API_EXPORT_BODY"] =
	"Il pulsante Copia esporta i dettagli dell'API corrente inclusi nome, categoria, parametri, stato Midnight, ultimi risultati esecuzione e tue note. Perfetto per documentazione o condivisione in discussioni."
