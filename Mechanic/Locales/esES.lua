-- Spanish (Spain) locale for Mechanic
local L = LibStub("AceLocale-3.0"):NewLocale("Mechanic", "esES")
if not L then return end

-- Core
L["Mechanic"] = "Mechanic"
L["Unknown command: %s"] = "Comando desconocido: %s"
L["Commands: console, errors, tests, perf, reload, gc, pause, copy, clear"] = "Comandos: console, errors, tests, perf, reload, gc, pause, copy, clear"
L["GC: %.1f KB freed (%.1f MB -> %.1f MB)"] = "GC: %.1f KB liberados (%.1f MB -> %.1f MB)"
L["GC executed: %s freed"] = "GC ejecutado: %s liberados"

-- Tabs
L["Console"] = "Consola"
L["Errors"] = "Errores"
L["Tests"] = "Pruebas"
L["Performance"] = "Rendimiento"
L["Tools"] = "Herramientas"
L["API"] = "API"
L["Inspect"] = "Inspeccionar"

-- Console
L["Source"] = "Origen"
L["Category"] = "Categoría"
L["Search"] = "Buscar"
L["Clear"] = "Limpiar"
L["Dedup All"] = "Deduplicar Todo"
L["Dedup Adj"] = "Dedup. Ady."
L["Dedup Adjacent"] = "Deduplicar Adyacentes"
L["Pause"] = "Pausar"
L["Resume"] = "Reanudar"
L["Reset Button"] = "Reiniciar"
L["All"] = "Todo"
L["System"] = "Sistema"
L["Lines: %d"] = "Líneas: %d"
L["Lines: 0"] = "Líneas: 0"
L["Reload UI"] = "Recargar IU"

-- Errors
L["Session"] = "Sesión"
L["Current Session"] = "Sesión Actual"
L["Previous Session"] = "Sesión Anterior"
L["All Sessions"] = "Todas las Sesiones"
L["None"] = "Ninguno"
L["Copy Error"] = "Copiar Error"
L["Wipe"] = "Borrar"
L["Wipe Session"] = "Borrar Sesión"
L["!BugGrabber Required"] = "!BugGrabber Requerido"
L["No errors in this session."] = "Sin errores en esta sesión."
L["0/0"] = "0/0"
L["%d/%d"] = "%d/%d"
L["<"] = "<"
L[">"] = ">"
L["Error database wiped."] = "Base de datos de errores borrada."
L["[Error]"] = "[Error]"
L["Session: %s | Error: %d/%d"] = "Sesión: %s | Error: %d/%d"
L["The Errors module requires !BugGrabber to capture Lua errors."] = "El módulo de Errores requiere !BugGrabber para capturar errores Lua."
L["Download from:"] = "Descargar de:"
L["After installing, type /reload"] = "Después de instalar, escribe /reload"

-- Tests
L["Run Selected"] = "Ejecutar Seleccionado"
L["Run All Auto"] = "Ejecutar Todo Auto"
L["Validate"] = "Validar"
L["Total"] = "Total"
L["Passed"] = "Pasado"
L["Failed"] = "Fallido"
L["Pending"] = "Pendiente"
L["PASSED"] = "PASADO"
L["FAILED"] = "FALLIDO"
L["PENDING"] = "PENDIENTE"
L["Status: %s%s|r"] = "Estado: %s%s|r"
L["Status: |cff888888Not run|r"] = "Estado: |cff888888No ejecutado|r"
L["Category: %s"] = "Categoría: %s"
L["Select a test"] = "Seleccionar prueba"
L["Tree View"] = "Vista de Árbol"
L["Export"] = "Exportar"
L["Export Button"] = "Exportar"
L["Duration: %.3fs"] = "Duración: %.3fs"
L["Message: %s"] = "Mensaje: %s"
L["Details:"] = "Detalles:"
L["  %s %s: %s%s|r"] = "  %s %s: %s%s|r"
L["Captured Logs:"] = "Registros Capturados:"
L["  %s"] = "  %s"
L["No test selected."] = "Ninguna prueba seleccionada."
L["Tests complete: %d/%d passed"] = "Pruebas completadas: %d/%d pasadas"
L["Result: %d/%d passed, %d failed, %d pending"] = "Resultado: %d/%d pasadas, %d fallidas, %d pendientes"
L["%s > %s"] = "%s > %s"
L["Total: %d | Passed: %d | Failed: %d | Pending: %d"] = "Total: %d | Pasadas: %d | Fallidas: %d | Pendientes: %d"
L["No addons have registered diagnostic tools.\n\nAddons can register tools via:\nMechanicLib:Register(name, { tools = { ... } })"] =
	"Ningún addon ha registrado herramientas de diagnóstico.\n\nLos addons pueden registrar herramientas via:\nMechanicLib:Register(name, { tools = { ... } })"

-- Performance
L["Auto-Refresh"] = "Auto-Actualizar"
L["Reset Stats"] = "Reiniciar Estadísticas"
L["CPU Profiling"] = "Perfilado CPU"
L["FPS"] = "FPS"
L["Latency"] = "Latencia"
L["Memory"] = "Memoria"
L["Addon"] = "Addon"
L["Tracking"] = "Seguimiento"
L["Total Memory"] = "Memoria Total"
L["Reset"] = "Reiniciar"
L["FPS: --"] = "FPS: --"
L["FPS: %.0f"] = "FPS: %.0f"
L["Latency: --ms / --ms"] = "Latencia: --ms / --ms"
L["Latency: %dms / %dms"] = "Latencia: %dms / %dms"
L["Lua Memory: -- MB"] = "Memoria Lua: -- MB"
L["Lua Memory: %s"] = "Memoria Lua: %s"
L["Tracking: %s | Total Memory: %s"] = "Seguimiento: %s | Memoria Total: %s"
L["Tracking: %s | Total Memory: %s | CPU Profiling: %s"] = "Seguimiento: %s | Memoria Total: %s | Perfilado CPU: %s"
L["Total:"] = "Total:"
L["Total: %.2f ms/s"] = "Total: %.2f ms/s"
L["Table View"] = "Vista de Tabla"
L["Performance stats reset."] = "Estadísticas de rendimiento reiniciadas."
L["General"] = "General"
L["General Tab"] = "General"
L["Addons Tab"] = "Addons"
L["%"] = "%"
L["CPU ms/s"] = "CPU ms/s"
L["-"] = "-"
L["ON"] = "ACTIVADO"
L["OFF"] = "DESACTIVADO"
L["%s - Performance Breakdown"] = "%s - Desglose de Rendimiento"
L["Metric             | ms/s     | %     | Description"] = "Métrica            | ms/s     | %     | Descripción"
L["-------------------|----------|-------|-----------------------------"] = "-------------------|----------|-------|-----------------------------"
L["Addon              | Memory   | %     | CPU ms/s | %"] = "Addon              | Memoria  | %     | CPU ms/s | %"
L["-------------------|----------|-------|----------|-------"] = "-------------------|----------|-------|----------|-------"
L["Addon              | Memory   | %"] = "Addon              | Memoria  | %"
L["-------------------|----------|------"] = "-------------------|----------|------"
L["CPU profiling requires a UI reload. Continue?"] = "El perfilado CPU requiere recargar la IU. ¿Continuar?"
L["Reload"] = "Recargar"
L["Cancel"] = "Cancelar"
L["No sub-metrics available for this addon."] = "No hay sub-métricas disponibles para este addon."
L["Addon performance tracking not available."] = "Seguimiento de rendimiento de addon no disponible."
L["!Mechanic is initializing..."] = "!Mechanic está inicializando..."
L["Addon does not provide sub-metrics."] = "El addon no proporciona sub-métricas."
L["Refresh"] = "Actualizar"

-- Settings
L["Copy Options"] = "Opciones de Copia"
L["Registered Addons"] = "Addons Registrados"
L["Console Buffer Size"] = "Tamaño del Búfer de Consola"
L["Show Timestamps"] = "Mostrar Marcas de Tiempo"
L["Include Environment Header"] = "Incluir Cabecera de Entorno"
L["Include Character Info"] = "Incluir Info del Personaje"
L["Include Timestamp"] = "Incluir Marca de Tiempo"
L["Refresh Interval"] = "Intervalo de Actualización"
L["Track Event Frequency"] = "Rastrear Frecuencia de Eventos"
L["Show Minimap Icon"] = "Mostrar Icono del Minimapa"

-- API
L["Run"] = "Ejecutar"
L["Run Category"] = "Ejecutar Categoría"
L["Run Namespace"] = "Ejecutar Namespace"
L["Copy Report"] = "Copiar Informe"
L["Results:"] = "Resultados:"
L["Not yet run"] = "Aún no ejecutado"
L["Notes:"] = "Notas:"
L["Parameters:"] = "Parámetros:"
L["Midnight Impact: %s%s|r"] = "Impacto Midnight: %s%s|r"
L["Midnight Note:"] = "Nota Midnight:"
L["Select an API"] = "Seleccionar API"
L["Select a category"] = "Seleccionar categoría"
L["Search APIs..."] = "Buscar APIs..."
L["▼"] = "▼"
L["PROTECTED"] = "PROTEGIDO"
L["MISSING"] = "FALTANTE"
L["Function not found"] = "Función no encontrada"
L["Cannot call from addon code"] = "No se puede llamar desde código de addon"
L["This API is protected and cannot be called from addon code in Midnight.\n\nConsider using the reskin strategy with Blizzard frames."] =
	"Esta API está protegida y no se puede llamar desde código de addon en Midnight.\n\nConsidera usar la estrategia de reskin con marcos de Blizzard."
L["Function not available: %s\n\nThis may be a newer API not yet available in this WoW version."] =
	"Función no disponible: %s\n\nEsta puede ser una API más nueva aún no disponible en esta versión de WoW."
L["No API selected."] = "Ninguna API seleccionada."

-- Shared Export
L["Metric"] = "Métrica"
L["ms/s"] = "ms/s"
L["Description"] = "Descripción"
L["Press Ctrl+C to copy the text below."] = "Presiona Ctrl+C para copiar el texto."
L["Close"] = "Cerrar"
L["Inspecting: %s"] = "Inspeccionando: %s"
L["No object selected for inspection."] = "Ningún objeto seleccionado para inspección."
L["--- Members ---"] = "--- Miembros ---"
L["... (truncated)"] = "... (truncado)"

-- Inspect
L["Pick"] = "Seleccionar"
L["Picking..."] = "Seleccionando..."
L["Watch"] = "Vigilar"
L["+ Watch"] = "+ Vigilar"
L["Frame path or global table..."] = "Ruta de marco o tabla global..."
L["Select a frame"] = "Seleccionar marco"
L["Geometry"] = "Geometría"
L["Visibility"] = "Visibilidad"
L["Texture"] = "Textura"
L["FontString"] = "FontString"
L["Common Properties"] = "Propiedades Comunes"
L["Properties"] = "Propiedades"
L["Export Changes"] = "Exportar Cambios"
L["Reset All Changes"] = "Reiniciar Todos los Cambios"
L["Shown"] = "Visible"
L["Alpha"] = "Alfa"
L["Layering"] = "Capas"
L["Level"] = "Nivel"
L["Strata"] = "Estrato"
L["Width"] = "Ancho"
L["Height"] = "Alto"
L["Frame Level"] = "Nivel de Marco"
L["Frame Strata"] = "Estrato de Marco"
L["Scale"] = "Escala"
L["Text"] = "Texto"
L["Color"] = "Color"
L["Text Color"] = "Color de Texto"
L["Vertex Color"] = "Color de Vértice"
L["No changes to export."] = "Sin cambios para exportar."
L["Scripts"] = "Scripts"
L["Watch List"] = "Lista de Vigilancia"
L["+ Watch Current"] = "+ Vigilar Actual"
L["Remove from Watch List"] = "Quitar de la Lista"
L["Clear Watch List"] = "Limpiar Lista"
L["Export All"] = "Exportar Todo"
L["Session: %s | Errors: %d"] = "Sesión: %s | Errores: %d"
L["Test Item"] = "Elemento de Prueba"
L["Player"] = "Jugador"

-- Self-Registration
L["Register Mechanic"] = "Registrar Mechanic"
L["View Health Log"] = "Ver Registro de Salud"
L["Clear Health Log"] = "Limpiar Registro de Salud"
L["Reset UI Position"] = "Reiniciar Posición de IU"
L["Export persistent internal error log for agent auditing."] =
	"Exportar registro de errores interno persistente para auditoría de agente."
L["Clear all entries from the persistent health log."] = "Limpiar todas las entradas del registro de salud persistente."
L["Reset the main frame to default size and position."] = "Reiniciar el marco principal a tamaño y posición predeterminados."
L["Mechanic: Developer tools for World of Warcraft"] = "Mechanic: Herramientas de desarrollo para World of Warcraft"
L["Health log cleared."] = "Registro de salud limpiado."
L["UI position reset."] = "Posición de IU reiniciada."
L["Tools : !Mechanic : View Health Log"] = "Herramientas : !Mechanic : Ver Registro de Salud"

-- Export Dialog Titles
L["Console Export"] = "Exportar Consola"
L["Errors Export"] = "Exportar Errores"
L["Tests Export"] = "Exportar Pruebas"
L["Performance Export"] = "Exportar Rendimiento"
L["Performance: %s"] = "Rendimiento: %s"
L["API: %s"] = "API: %s"
L["Tools: %s"] = "Herramientas: %s"
L["Inspect: %s"] = "Inspeccionar: %s"
L["API Export"] = "Exportar API"
L["Tools Export"] = "Exportar Herramientas"
L["Inspect Export"] = "Exportar Inspección"

-- Help System
L["Help"] = "Ayuda"

-- Missing Keys
L["Interactivity"] = "Interactividad"
L["Anchors"] = "Anclajes"
L["Regions"] = "Regiones"
L["Regions (Textures/FontStrings)"] = "Regiones (Texturas/FontStrings)"
L["FenUI Details"] = "Detalles FenUI"
L["Attributes"] = "Atributos"
L["Hierarchy"] = "Jerarquía"
L["Safe"] = "Seguro"
L["Safe APIs Only"] = "Solo APIs Seguras"

-- Help: Inspect Tab
L["HELP_INSPECT_TITLE"] = "Pestaña Inspeccionar"
L["HELP_INSPECT_OVERVIEW_HEADING"] = "Resumen"
L["HELP_INSPECT_OVERVIEW_BODY"] =
	"La pestaña Inspeccionar es un potente depurador de marcos para explorar la jerarquía de la IU de WoW. Puedes seleccionar cualquier marco visible, navegar sus relaciones padre/hijo, editar propiedades en tiempo real y vigilar marcos para actualizaciones en vivo."
L["HELP_INSPECT_PICK_HEADING"] = "Modo Selección"
L["HELP_INSPECT_PICK_BODY"] =
	"Haz clic en el botón Seleccionar (icono de mira) para entrar en modo selección. Mueve el ratón sobre cualquier marco en la IU del juego - se resaltará con un borde naranja y etiqueta. Haz clic para seleccionar ese marco para inspección, o presiona ESC para cancelar."
L["HELP_INSPECT_PATH_HEADING"] = "Entrada de Ruta"
L["HELP_INSPECT_PATH_BODY"] =
	"Escribe una ruta de marco directamente en el campo de entrada (ej., PlayerFrame, Minimap.ZoomIn, o UIParent). Presiona Enter para inspeccionar. Las rutas se resuelven usando el espacio de nombres global de WoW y la jerarquía de marcos. Usa puntos para atravesar marcos hijos."
L["HELP_INSPECT_TREE_HEADING"] = "Navegación del Árbol"
L["HELP_INSPECT_TREE_BODY"] =
	"El panel del Árbol a la izquierda muestra la jerarquía de marcos. Haz clic en '>' para expandir nodos padre y ver hijos. Haz clic en cualquier nodo para seleccionar ese marco. El árbol se actualiza cuando seleccionas un nuevo marco. Los iconos de ojo alternan la visibilidad del marco."
L["HELP_INSPECT_PROPERTIES_HEADING"] = "Panel de Propiedades"
L["HELP_INSPECT_PROPERTIES_BODY"] =
	"El panel de Propiedades permite editar en tiempo real atributos de marco como posición, tamaño, alfa, escala, estrato y colores. Los cambios se aplican instantáneamente a la IU en vivo. Cada propiedad tiene un botón de reinicio para revertir cambios individuales. Usa Exportar Cambios para generar código Lua."
L["HELP_INSPECT_DETAILS_HEADING"] = "Panel de Detalles"
L["HELP_INSPECT_DETAILS_BODY"] =
	"El panel de Detalles muestra información de solo lectura incluyendo tipo de marco, cadena de padres, anclajes, regiones (texturas/fontstrings), scripts y atributos. Haz clic en los toggles de colapso (v/>) para mostrar u ocultar secciones."
L["HELP_INSPECT_WATCH_HEADING"] = "Lista de Vigilancia"
L["HELP_INSPECT_WATCH_BODY"] =
	"Fija marcos frecuentemente inspeccionados a la Lista de Vigilancia usando el botón '+ Vigilar'. Los marcos vigilados aparecen en el panel derecho con valores que se actualizan en vivo. Haz clic en una entrada de vigilancia para saltar a ese marco. El botón Limpiar elimina todas las vigilancias."
L["HELP_INSPECT_EXPORT_HEADING"] = "Exportar"
L["HELP_INSPECT_EXPORT_BODY"] =
	"El botón Exportar copia toda la información del marco al portapapeles. Si has hecho ediciones de propiedades, 'Exportar Cambios' genera código Lua listo para usar mostrando valores antes/después. Genial para compartir con otros desarrolladores o agentes de IA."

-- Help: Console Tab
L["HELP_CONSOLE_TITLE"] = "Pestaña Consola"
L["HELP_CONSOLE_OVERVIEW_HEADING"] = "Resumen"
L["HELP_CONSOLE_OVERVIEW_BODY"] =
	"La Consola agrega salida de depuración de todos los addons registrados con MechanicLib en un solo lugar. Captura declaraciones print, logs de depuración y categorías personalizadas con marcas de tiempo. El búfer mantiene las entradas más recientes (configurable en ajustes)."
L["HELP_CONSOLE_SOURCE_HEADING"] = "Filtrado por Origen"
L["HELP_CONSOLE_SOURCE_BODY"] =
	"La navegación izquierda lista todos los addons que han enviado mensajes. Selecciona un addon para mostrar solo sus logs. Selecciona 'Todo' para ver todo. Cada addon muestra un conteo de sus mensajes entre paréntesis."
L["HELP_CONSOLE_SEARCH_HEADING"] = "Búsqueda"
L["HELP_CONSOLE_SEARCH_BODY"] =
	"Escribe en el cuadro de búsqueda para filtrar mensajes por contenido de texto. La búsqueda coincide contra el texto del mensaje, nombre del addon de origen y categoría. Combina con filtrado por origen para resultados precisos."
L["HELP_CONSOLE_DEDUP_HEADING"] = "Modos de Deduplicación"
L["HELP_CONSOLE_DEDUP_BODY"] =
	"Dos modos de deduplicación ayudan a reducir el ruido. 'Deduplicar Todo' elimina todos los mensajes duplicados por completo, manteniendo solo entradas únicas. 'Deduplicar Adyacentes' colapsa solo mensajes repetidos consecutivos, mostrando un conteo como (x5). Los botones están en la barra de herramientas."
L["HELP_CONSOLE_PAUSE_HEADING"] = "Pausar/Reanudar"
L["HELP_CONSOLE_PAUSE_BODY"] =
	"Haz clic en el botón Pausar para congelar la visualización y dejar de capturar nuevos mensajes. Esto te permite leer los logs sin que se desplacen. Haz clic de nuevo para reanudar. El botón muestra un icono de reproducción cuando está pausado."
L["HELP_CONSOLE_CLEAR_HEADING"] = "Limpiar"
L["HELP_CONSOLE_CLEAR_BODY"] =
	"El botón Limpiar (icono de papelera) vacía todo el búfer de la consola. Esto es útil para empezar de cero cuando depuras una acción o escenario específico. Los mensajes limpiados no se pueden recuperar."
L["HELP_CONSOLE_EXPORT_HEADING"] = "Exportar"
L["HELP_CONSOLE_EXPORT_BODY"] =
	"Exportar copia todos los logs filtrados actualmente al portapapeles en un formato compartible. Si está habilitado en los ajustes, incluye una cabecera de entorno con versión de WoW, info del personaje y ubicación para contexto completo de reporte de errores."

-- Help: Errors Tab
L["HELP_ERRORS_TITLE"] = "Pestaña Errores"
L["HELP_ERRORS_OVERVIEW_HEADING"] = "Resumen"
L["HELP_ERRORS_OVERVIEW_BODY"] =
	"La pestaña Errores muestra errores Lua capturados por !BugGrabber. Muestra el mensaje de error, la traza de pila completa y las variables locales en el momento del error. Esencial para depurar addons y rastrear bugs."
L["HELP_ERRORS_SESSION_HEADING"] = "Menú de Sesión"
L["HELP_ERRORS_SESSION_BODY"] =
	"Filtra errores por sesión usando el menú desplegable. 'Sesión Actual' muestra errores desde tu último /reload. 'Sesión Anterior' muestra errores de antes del último reload. 'Todas las Sesiones' muestra el historial completo de errores almacenado por BugGrabber."
L["HELP_ERRORS_SOURCE_HEADING"] = "Filtrado por Origen"
L["HELP_ERRORS_SOURCE_BODY"] =
	"La navegación izquierda agrupa errores por el addon que los causó. Mechanic auto-detecta el origen de la traza de pila. Haz clic en un addon para ver solo sus errores. El conteo muestra cuántos errores tiene ese addon."
L["HELP_ERRORS_NAV_HEADING"] = "Navegación de Errores"
L["HELP_ERRORS_NAV_BODY"] =
	"Usa los botones < y > para recorrer los errores uno a uno. El contador muestra tu posición actual (ej., 3/12). La pantalla principal muestra el error completo con traza de pila coloreada para fácil lectura."
L["HELP_ERRORS_PAUSE_HEADING"] = "Pausar"
L["HELP_ERRORS_PAUSE_BODY"] =
	"Haz clic en Pausar para dejar de capturar nuevos errores. Útil cuando quieres examinar errores existentes sin que se añadan nuevos. El conteo de errores y la visualización se congelan hasta que reanudes."
L["HELP_ERRORS_WIPE_HEADING"] = "Borrar"
L["HELP_ERRORS_WIPE_BODY"] =
	"El botón Borrar (icono de papelera) limpia toda la base de datos de errores de BugGrabber. Úsalo para empezar de cero después de arreglar bugs o cuando la lista de errores se vuelve demasiado larga. Esta acción no se puede deshacer."
L["HELP_ERRORS_EXPORT_HEADING"] = "Exportar"
L["HELP_ERRORS_EXPORT_BODY"] =
	"Exportar copia todos los errores (o el conjunto filtrado actual) al portapapeles con trazas de pila completas. Incluye cabecera de entorno si está habilitada. Perfecto para compartir en reportes de bugs o pegar en asistentes de IA para ayuda con depuración."
L["HELP_ERRORS_BUGGRABBER_HEADING"] = "BugGrabber Requerido"
L["HELP_ERRORS_BUGGRABBER_BODY"] =
	"Este módulo requiere el addon !BugGrabber para capturar errores Lua. Si no está instalado, verás instrucciones para descargarlo de CurseForge o WoWInterface. Después de instalar, escribe /reload."

-- Help: Tests Tab
L["HELP_TESTS_TITLE"] = "Pestaña Pruebas"
L["HELP_TESTS_OVERVIEW_HEADING"] = "Resumen"
L["HELP_TESTS_OVERVIEW_BODY"] =
	"La pestaña Pruebas proporciona un ejecutor de pruebas para diagnósticos de addons. Los addons pueden registrar pruebas via MechanicLib para validar su funcionalidad. Las pruebas están organizadas por addon y categoría en una vista de árbol."
L["HELP_TESTS_TREE_HEADING"] = "Árbol de Pruebas"
L["HELP_TESTS_TREE_BODY"] =
	"Navega las pruebas organizadas jerárquicamente: Addon > Categoría > Prueba. Haz clic para expandir nodos. Cada prueba muestra un icono de estado. Haz clic en una prueba para ver sus detalles en el panel derecho. El árbol se actualiza después de ejecutar pruebas."
L["HELP_TESTS_RUN_HEADING"] = "Ejecutar Seleccionado"
L["HELP_TESTS_RUN_BODY"] =
	"Haz clic en el botón de reproducción para ejecutar la prueba actualmente seleccionada. El resultado aparece en el panel de detalles mostrando estado pasado/fallido, duración de ejecución, mensajes de error y salida de log capturada."
L["HELP_TESTS_AUTO_HEADING"] = "Ejecutar Todo Auto"
L["HELP_TESTS_AUTO_BODY"] =
	"El botón 'Ejecutar Todo Auto' ejecuta todas las pruebas marcadas con autoRun = true en todos los addons registrados. Estas son típicamente pruebas de validación rápida. Un resumen aparece en el chat mostrando total pasadas/fallidas."
L["HELP_TESTS_DETAILS_HEADING"] = "Detalles de Prueba"
L["HELP_TESTS_DETAILS_BODY"] =
	"Cuando una prueba está seleccionada, el panel de detalles muestra: nombre de prueba, categoría, tipo (auto/manual), estado con código de color, duración de ejecución en segundos, mensaje de error, detalles de resultado estructurados y logs capturados."
L["HELP_TESTS_STATUS_HEADING"] = "Iconos de Estado"
L["HELP_TESTS_STATUS_BODY"] =
	"El estado de las pruebas se muestra con iconos coloreados: [+] verde = pasada, [x] rojo = fallida, [?] amarillo = pendiente/ejecutando, [-] gris = aún no ejecutada. Estos aparecen tanto en el árbol como en el panel de detalles."
L["HELP_TESTS_EXPORT_HEADING"] = "Exportar"
L["HELP_TESTS_EXPORT_BODY"] =
	"Exportar copia todos los resultados de pruebas al portapapeles en un formato estructurado. Incluye conteos de pasadas/fallidas, resultados de pruebas individuales y detalles de errores. Útil para reportes de CI o compartir con compañeros de equipo."

-- Help: Performance Tab
L["HELP_PERF_TITLE"] = "Pestaña Rendimiento"
L["HELP_PERF_OVERVIEW_HEADING"] = "Resumen"
L["HELP_PERF_OVERVIEW_BODY"] =
	"La pestaña Rendimiento monitorea el uso de recursos de addons incluyendo memoria y tiempo de CPU. La vista General muestra métricas del sistema (FPS, latencia, memoria Lua). Haz clic en un addon en la navegación izquierda para ver su desglose detallado."
L["HELP_PERF_GENERAL_HEADING"] = "Vista General"
L["HELP_PERF_GENERAL_BODY"] =
	"La vista predeterminada muestra: FPS actual, latencia hogar/mundo, uso total de memoria Lua y una tabla ordenable de todos los addons con estadísticas de memoria y CPU. El pie de página muestra duración de seguimiento y totales."
L["HELP_PERF_ADDONS_HEADING"] = "Lista de Addons"
L["HELP_PERF_ADDONS_BODY"] =
	"La tabla de addons muestra el uso de memoria de cada addon (KB/MB), porcentaje del total, tiempo de CPU (ms/s si el perfilado está habilitado) y porcentaje de CPU. Haz clic en las cabeceras de columna para ordenar. Haz clic en una fila de addon para ver el desglose detallado."
L["HELP_PERF_CPU_HEADING"] = "Perfilado de CPU"
L["HELP_PERF_CPU_BODY"] =
	"Habilita el Perfilado de CPU via la casilla para rastrear el uso de CPU por addon. Esto requiere recargar la IU porque usa el sistema de perfilado incorporado de WoW. Las columnas de CPU muestran milisegundos por segundo y porcentaje del tiempo de frame."
L["HELP_PERF_REFRESH_HEADING"] = "Auto-Actualización"
L["HELP_PERF_REFRESH_BODY"] =
	"Cuando está habilitada, las métricas se actualizan automáticamente cada pocos segundos. Deshabilita esto para análisis de instantánea cuando quieras números estables. La actualización manual ocurre al cambiar vistas o volver a la pestaña."
L["HELP_PERF_SUBMETRICS_HEADING"] = "Sub-Métricas"
L["HELP_PERF_SUBMETRICS_BODY"] =
	"Selecciona un addon en la navegación izquierda para ver el desglose de sus sub-métricas registradas. Los addons pueden registrar métricas personalizadas via MechanicLib mostrando tiempos internos (ej., 'Procesamiento de Eventos: 2.5ms'). No todos los addons proporcionan esto."
L["HELP_PERF_RESET_HEADING"] = "Reiniciar Estadísticas"
L["HELP_PERF_RESET_BODY"] =
	"Haz clic en Reiniciar para limpiar los datos de rendimiento acumulados y empezar a medir desde cero. Útil después de pantallas de carga, eventos importantes o cuando quieres una base de medición fresca para una actividad específica."
L["HELP_PERF_EXPORT_HEADING"] = "Exportar"
L["HELP_PERF_EXPORT_BODY"] =
	"Exportar copia todos los datos de rendimiento al portapapeles en una tabla formateada. Incluye métricas del sistema, todas las estadísticas de memoria/CPU de addons y sub-métricas si estás viendo un addon específico. Genial para reportes de rendimiento."

-- Help: Tools Tab
L["HELP_TOOLS_TITLE"] = "Pestaña Herramientas"
L["HELP_TOOLS_OVERVIEW_HEADING"] = "Resumen"
L["HELP_TOOLS_OVERVIEW_BODY"] =
	"La pestaña Herramientas aloja paneles de diagnóstico personalizados registrados por addons. Cada addon puede proporcionar su propia IU de herramientas para depuración, configuración u operaciones especializadas. Selecciona un addon de la navegación izquierda para ver su panel."
L["HELP_TOOLS_ADDON_HEADING"] = "Selección de Addon"
L["HELP_TOOLS_ADDON_BODY"] =
	"La navegación izquierda lista todos los addons que han registrado herramientas via MechanicLib. Haz clic en el nombre de un addon para cargar su panel personalizado en el área de contenido. El panel es creado por el propio código del addon."
L["HELP_TOOLS_PANEL_HEADING"] = "Paneles de Herramientas"
L["HELP_TOOLS_PANEL_BODY"] =
	"Cada addon define su propio diseño de panel de herramientas. Usos comunes incluyen: ver logs internos, reiniciar estado, configurar opciones de depuración, exportar datos y ejecutar diagnósticos específicos del addon. Consulta la documentación de cada addon."
L["HELP_TOOLS_REGISTER_HEADING"] = "Para Desarrolladores de Addons"
L["HELP_TOOLS_REGISTER_BODY"] =
	"Registra herramientas via MechanicLib:Register(name, { tools = { createPanel = function(parent), destroyPanel = function(panel) } }). Tu función createPanel recibe un marco padre para poblar con elementos de IU."
L["HELP_TOOLS_EXPORT_HEADING"] = "Exportar"
L["HELP_TOOLS_EXPORT_BODY"] =
	"Exportar copia un resumen de proveedores de herramientas registrados al portapapeles. Útil para depurar la integración de MechanicLib o documentar qué addons soportan la interfaz de herramientas."

-- Help: API Tab
L["HELP_API_TITLE"] = "Pestaña API"
L["HELP_API_OVERVIEW_HEADING"] = "Resumen"
L["HELP_API_OVERVIEW_BODY"] =
	"La pestaña API es un banco de pruebas para explorar las APIs Lua de WoW. Navega funciones categorizadas, pruébalas con parámetros, ve valores de retorno y verifica compatibilidad con Midnight 12.0. Esencial para desarrollo de addons y solución de problemas."
L["HELP_API_BROWSER_HEADING"] = "Navegador de APIs"
L["HELP_API_BROWSER_BODY"] =
	"La navegación izquierda organiza las APIs por categoría (Unit, Spell, Item, Frame, etc.). Usa el cuadro de búsqueda para filtrar por nombre. Las cabeceras de categoría están en negrita y no son clickeables. Haz clic en cualquier API para ver sus detalles y parámetros."
L["HELP_API_PARAMS_HEADING"] = "Parámetros"
L["HELP_API_PARAMS_BODY"] =
	"Cada API muestra sus parámetros con campos de entrada. Escribe valores directamente o usa el menú desplegable (v) para seleccionar de ejemplos comunes. Los tipos de parámetros se muestran entre paréntesis. Se indica requerido vs opcional."
L["HELP_API_RUN_HEADING"] = "Botón Ejecutar"
L["HELP_API_RUN_BODY"] =
	"Haz clic en Ejecutar para ejecutar la API con los valores de parámetros actuales. Los resultados aparecen en el cuadro de Resultados abajo mostrando valores de retorno, errores o estado 'protegido'. Útil para probar disponibilidad de APIs."
L["HELP_API_CATEGORY_HEADING"] = "Ejecutar Categoría"
L["HELP_API_CATEGORY_BODY"] =
	"Haz clic en 'Ejecutar Todo' para probar en lote cada API en la categoría actual. Esto identifica rápidamente qué APIs están disponibles, protegidas o faltantes en tu versión de WoW. Aparece un resumen de resultados con conteos."
L["HELP_API_MIDNIGHT_HEADING"] = "Impacto Midnight"
L["HELP_API_MIDNIGHT_BODY"] =
	"Cada API muestra su estado de compatibilidad con Midnight 12.0. VERDE = sin cambios y segura. AMARILLO = condicional (el comportamiento puede diferir). ROJO = rompe (protegida o eliminada). Revisa la Nota Midnight para guía específica."
L["HELP_API_NOTES_HEADING"] = "Notas Personales"
L["HELP_API_NOTES_BODY"] =
	"El campo de Notas en la parte inferior te permite guardar anotaciones personales para cada API. Las notas se almacenan en tu perfil de Mechanic y persisten entre sesiones. Úsalas para recordatorios, soluciones alternativas o documentación."
L["HELP_API_EXPORT_HEADING"] = "Copiar Informe"
L["HELP_API_EXPORT_BODY"] =
	"El botón Copiar exporta los detalles de la API actual incluyendo nombre, categoría, parámetros, estado Midnight, últimos resultados de ejecución y tus notas. Perfecto para documentación o compartir en discusiones."
