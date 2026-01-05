-- Portuguese (Brazil) locale for Mechanic
local L = LibStub("AceLocale-3.0"):NewLocale("Mechanic", "ptBR")
if not L then return end

-- Core
L["Mechanic"] = "Mechanic"
L["Unknown command: %s"] = "Comando desconhecido: %s"
L["Commands: console, errors, tests, perf, reload, gc, pause, copy, clear"] = "Comandos: console, errors, tests, perf, reload, gc, pause, copy, clear"
L["GC: %.1f KB freed (%.1f MB -> %.1f MB)"] = "GC: %.1f KB liberados (%.1f MB -> %.1f MB)"
L["GC executed: %s freed"] = "GC executado: %s liberados"

-- Tabs
L["Console"] = "Console"
L["Errors"] = "Erros"
L["Tests"] = "Testes"
L["Performance"] = "Desempenho"
L["Tools"] = "Ferramentas"
L["API"] = "API"
L["Inspect"] = "Inspecionar"

-- Console
L["Source"] = "Origem"
L["Category"] = "Categoria"
L["Search"] = "Buscar"
L["Clear"] = "Limpar"
L["Dedup All"] = "Deduplicar Tudo"
L["Dedup Adj"] = "Dedup. Adj."
L["Dedup Adjacent"] = "Deduplicar Adjacentes"
L["Pause"] = "Pausar"
L["Resume"] = "Continuar"
L["Reset Button"] = "Redefinir"
L["All"] = "Tudo"
L["System"] = "Sistema"
L["Lines: %d"] = "Linhas: %d"
L["Lines: 0"] = "Linhas: 0"
L["Reload UI"] = "Recarregar IU"

-- Errors
L["Session"] = "Sessão"
L["Current Session"] = "Sessão Atual"
L["Previous Session"] = "Sessão Anterior"
L["All Sessions"] = "Todas as Sessões"
L["None"] = "Nenhum"
L["Copy Error"] = "Copiar Erro"
L["Wipe"] = "Limpar"
L["Wipe Session"] = "Limpar Sessão"
L["!BugGrabber Required"] = "!BugGrabber Necessário"
L["No errors in this session."] = "Sem erros nesta sessão."
L["0/0"] = "0/0"
L["%d/%d"] = "%d/%d"
L["<"] = "<"
L[">"] = ">"
L["Error database wiped."] = "Banco de dados de erros limpo."
L["[Error]"] = "[Erro]"
L["Session: %s | Error: %d/%d"] = "Sessão: %s | Erro: %d/%d"
L["The Errors module requires !BugGrabber to capture Lua errors."] = "O módulo de Erros requer !BugGrabber para capturar erros Lua."
L["Download from:"] = "Baixar de:"
L["After installing, type /reload"] = "Após instalar, digite /reload"

-- Tests
L["Run Selected"] = "Executar Selecionado"
L["Run All Auto"] = "Executar Tudo Auto"
L["Validate"] = "Validar"
L["Total"] = "Total"
L["Passed"] = "Passou"
L["Failed"] = "Falhou"
L["Pending"] = "Pendente"
L["PASSED"] = "PASSOU"
L["FAILED"] = "FALHOU"
L["PENDING"] = "PENDENTE"
L["Status: %s%s|r"] = "Status: %s%s|r"
L["Status: |cff888888Not run|r"] = "Status: |cff888888Não executado|r"
L["Category: %s"] = "Categoria: %s"
L["Select a test"] = "Selecionar teste"
L["Tree View"] = "Visualização em Árvore"
L["Export"] = "Exportar"
L["Export Button"] = "Exportar"
L["Duration: %.3fs"] = "Duração: %.3fs"
L["Message: %s"] = "Mensagem: %s"
L["Details:"] = "Detalhes:"
L["  %s %s: %s%s|r"] = "  %s %s: %s%s|r"
L["Captured Logs:"] = "Logs Capturados:"
L["  %s"] = "  %s"
L["No test selected."] = "Nenhum teste selecionado."
L["Tests complete: %d/%d passed"] = "Testes completos: %d/%d passaram"
L["Result: %d/%d passed, %d failed, %d pending"] = "Resultado: %d/%d passaram, %d falharam, %d pendentes"
L["%s > %s"] = "%s > %s"
L["Total: %d | Passed: %d | Failed: %d | Pending: %d"] = "Total: %d | Passaram: %d | Falharam: %d | Pendentes: %d"
L["No addons have registered diagnostic tools.\n\nAddons can register tools via:\nMechanicLib:Register(name, { tools = { ... } })"] =
	"Nenhum addon registrou ferramentas de diagnóstico.\n\nAddons podem registrar ferramentas via:\nMechanicLib:Register(name, { tools = { ... } })"

-- Performance
L["Auto-Refresh"] = "Atualização Automática"
L["Reset Stats"] = "Redefinir Estatísticas"
L["CPU Profiling"] = "Perfil de CPU"
L["FPS"] = "FPS"
L["Latency"] = "Latência"
L["Memory"] = "Memória"
L["Addon"] = "Addon"
L["Tracking"] = "Rastreamento"
L["Total Memory"] = "Memória Total"
L["Reset"] = "Redefinir"
L["FPS: --"] = "FPS: --"
L["FPS: %.0f"] = "FPS: %.0f"
L["Latency: --ms / --ms"] = "Latência: --ms / --ms"
L["Latency: %dms / %dms"] = "Latência: %dms / %dms"
L["Lua Memory: -- MB"] = "Memória Lua: -- MB"
L["Lua Memory: %s"] = "Memória Lua: %s"
L["Tracking: %s | Total Memory: %s"] = "Rastreamento: %s | Memória Total: %s"
L["Tracking: %s | Total Memory: %s | CPU Profiling: %s"] = "Rastreamento: %s | Memória Total: %s | Perfil CPU: %s"
L["Total:"] = "Total:"
L["Total: %.2f ms/s"] = "Total: %.2f ms/s"
L["Table View"] = "Visualização em Tabela"
L["Performance stats reset."] = "Estatísticas de desempenho redefinidas."
L["General"] = "Geral"
L["General Tab"] = "Geral"
L["Addons Tab"] = "Addons"
L["%"] = "%"
L["CPU ms/s"] = "CPU ms/s"
L["-"] = "-"
L["ON"] = "LIGADO"
L["OFF"] = "DESLIGADO"
L["%s - Performance Breakdown"] = "%s - Detalhamento de Desempenho"
L["CPU profiling requires a UI reload. Continue?"] = "Perfil de CPU requer recarregar a IU. Continuar?"
L["Reload"] = "Recarregar"
L["Cancel"] = "Cancelar"
L["No sub-metrics available for this addon."] = "Sem sub-métricas disponíveis para este addon."
L["Addon performance tracking not available."] = "Rastreamento de desempenho de addon não disponível."
L["!Mechanic is initializing..."] = "!Mechanic está inicializando..."
L["Addon does not provide sub-metrics."] = "Addon não fornece sub-métricas."
L["Refresh"] = "Atualizar"

-- Settings
L["Copy Options"] = "Opções de Cópia"
L["Registered Addons"] = "Addons Registrados"
L["Console Buffer Size"] = "Tamanho do Buffer do Console"
L["Show Timestamps"] = "Mostrar Carimbos de Data/Hora"
L["Include Environment Header"] = "Incluir Cabeçalho de Ambiente"
L["Include Character Info"] = "Incluir Info do Personagem"
L["Include Timestamp"] = "Incluir Carimbo de Data/Hora"
L["Refresh Interval"] = "Intervalo de Atualização"
L["Track Event Frequency"] = "Rastrear Frequência de Eventos"
L["Show Minimap Icon"] = "Mostrar Ícone do Minimapa"

-- API
L["Run"] = "Executar"
L["Run Category"] = "Executar Categoria"
L["Run Namespace"] = "Executar Namespace"
L["Copy Report"] = "Copiar Relatório"
L["Results:"] = "Resultados:"
L["Not yet run"] = "Ainda não executado"
L["Notes:"] = "Notas:"
L["Parameters:"] = "Parâmetros:"
L["Midnight Impact: %s%s|r"] = "Impacto Midnight: %s%s|r"
L["Midnight Note:"] = "Nota Midnight:"
L["Select an API"] = "Selecionar API"
L["Select a category"] = "Selecionar categoria"
L["Search APIs..."] = "Buscar APIs..."
L["▼"] = "▼"
L["PROTECTED"] = "PROTEGIDO"
L["MISSING"] = "AUSENTE"
L["Function not found"] = "Função não encontrada"
L["Cannot call from addon code"] = "Não pode chamar do código do addon"
L["No API selected."] = "Nenhuma API selecionada."

-- Shared Export
L["Metric"] = "Métrica"
L["ms/s"] = "ms/s"
L["Description"] = "Descrição"
L["Press Ctrl+C to copy the text below."] = "Pressione Ctrl+C para copiar o texto."
L["Close"] = "Fechar"
L["Inspecting: %s"] = "Inspecionando: %s"
L["No object selected for inspection."] = "Nenhum objeto selecionado para inspeção."
L["--- Members ---"] = "--- Membros ---"
L["... (truncated)"] = "... (truncado)"

-- Inspect
L["Pick"] = "Escolher"
L["Picking..."] = "Escolhendo..."
L["Watch"] = "Observar"
L["+ Watch"] = "+ Observar"
L["Frame path or global table..."] = "Caminho do frame ou tabela global..."
L["Select a frame"] = "Selecionar frame"
L["Geometry"] = "Geometria"
L["Visibility"] = "Visibilidade"
L["Texture"] = "Textura"
L["FontString"] = "FontString"
L["Common Properties"] = "Propriedades Comuns"
L["Properties"] = "Propriedades"
L["Export Changes"] = "Exportar Alterações"
L["Reset All Changes"] = "Redefinir Todas Alterações"
L["Shown"] = "Visível"
L["Alpha"] = "Alpha"
L["Layering"] = "Camadas"
L["Level"] = "Nível"
L["Strata"] = "Estrato"
L["Width"] = "Largura"
L["Height"] = "Altura"
L["Frame Level"] = "Nível do Frame"
L["Frame Strata"] = "Estrato do Frame"
L["Scale"] = "Escala"
L["Text"] = "Texto"
L["Color"] = "Cor"
L["Text Color"] = "Cor do Texto"
L["Vertex Color"] = "Cor do Vértice"
L["No changes to export."] = "Sem alterações para exportar."
L["Scripts"] = "Scripts"
L["Watch List"] = "Lista de Observação"
L["+ Watch Current"] = "+ Observar Atual"
L["Remove from Watch List"] = "Remover da Lista"
L["Clear Watch List"] = "Limpar Lista"
L["Export All"] = "Exportar Tudo"
L["Session: %s | Errors: %d"] = "Sessão: %s | Erros: %d"
L["Test Item"] = "Item de Teste"
L["Player"] = "Jogador"

-- Self-Registration
L["Register Mechanic"] = "Registrar Mechanic"
L["View Health Log"] = "Ver Log de Saúde"
L["Clear Health Log"] = "Limpar Log de Saúde"
L["Reset UI Position"] = "Redefinir Posição da IU"
L["Mechanic: Developer tools for World of Warcraft"] = "Mechanic: Ferramentas de desenvolvimento para World of Warcraft"
L["Health log cleared."] = "Log de saúde limpo."
L["UI position reset."] = "Posição da IU redefinida."

-- Export Dialog Titles
L["Console Export"] = "Exportar Console"
L["Errors Export"] = "Exportar Erros"
L["Tests Export"] = "Exportar Testes"
L["Performance Export"] = "Exportar Desempenho"
L["Performance: %s"] = "Desempenho: %s"
L["API: %s"] = "API: %s"
L["Tools: %s"] = "Ferramentas: %s"
L["Inspect: %s"] = "Inspecionar: %s"
L["API Export"] = "Exportar API"
L["Tools Export"] = "Exportar Ferramentas"
L["Inspect Export"] = "Exportar Inspeção"
L["Help"] = "Ajuda"

-- Missing Keys
L["Interactivity"] = "Interatividade"
L["Anchors"] = "Âncoras"
L["Regions"] = "Regiões"
L["Regions (Textures/FontStrings)"] = "Regiões (Texturas/FontStrings)"
L["FenUI Details"] = "Detalhes FenUI"
L["Attributes"] = "Atributos"
L["Hierarchy"] = "Hierarquia"
L["Safe"] = "Seguro"
L["Safe APIs Only"] = "Apenas APIs Seguras"

-- Help: Inspect Tab
L["HELP_INSPECT_TITLE"] = "Aba Inspecionar"
L["HELP_INSPECT_OVERVIEW_HEADING"] = "Visão Geral"
L["HELP_INSPECT_OVERVIEW_BODY"] =
	"A aba Inspecionar é um poderoso depurador de frames para explorar a hierarquia da UI do WoW. Você pode selecionar qualquer frame visível, navegar relacionamentos pai/filho, editar propriedades em tempo real e monitorar frames para atualizações ao vivo."
L["HELP_INSPECT_PICK_HEADING"] = "Modo de Seleção"
L["HELP_INSPECT_PICK_BODY"] =
	"Clique no botão Escolher (ícone de mira) para entrar no modo de seleção. Mova o mouse sobre qualquer frame na UI do jogo - ele será destacado com uma borda laranja e rótulo. Clique para selecionar esse frame para inspeção, ou pressione ESC para cancelar."
L["HELP_INSPECT_PATH_HEADING"] = "Entrada de Caminho"
L["HELP_INSPECT_PATH_BODY"] =
	"Digite um caminho de frame diretamente no campo de entrada (ex., PlayerFrame, Minimap.ZoomIn, ou UIParent). Pressione Enter para inspecionar. Caminhos são resolvidos usando o namespace global do WoW e hierarquia de frames. Use pontos para navegar frames filhos."
L["HELP_INSPECT_TREE_HEADING"] = "Navegação em Árvore"
L["HELP_INSPECT_TREE_BODY"] =
	"O painel de Árvore à esquerda mostra a hierarquia de frames. Clique '>' para expandir nós pais e ver filhos. Clique em qualquer nó para selecionar esse frame. A árvore atualiza quando você seleciona um novo frame. Ícones de olho alternam a visibilidade do frame."
L["HELP_INSPECT_PROPERTIES_HEADING"] = "Painel de Propriedades"
L["HELP_INSPECT_PROPERTIES_BODY"] =
	"O painel de Propriedades permite edição em tempo real de atributos de frame como posição, tamanho, alpha, escala, estrato e cores. Alterações são aplicadas instantaneamente à UI ao vivo. Cada propriedade tem um botão de reset para reverter alterações individuais. Use Exportar Alterações para gerar código Lua."
L["HELP_INSPECT_DETAILS_HEADING"] = "Painel de Detalhes"
L["HELP_INSPECT_DETAILS_BODY"] =
	"O painel de Detalhes mostra informações somente leitura incluindo tipo de frame, cadeia de pais, âncoras, regiões (texturas/fontstrings), scripts e atributos. Clique nos toggles de colapso (v/>) para mostrar ou ocultar seções."
L["HELP_INSPECT_WATCH_HEADING"] = "Lista de Observação"
L["HELP_INSPECT_WATCH_BODY"] =
	"Fixe frames frequentemente inspecionados na Lista de Observação usando o botão '+ Observar'. Frames observados aparecem no painel direito com valores atualizando ao vivo. Clique em uma entrada observada para pular para esse frame. O botão Limpar remove todas as observações."
L["HELP_INSPECT_EXPORT_HEADING"] = "Exportar"
L["HELP_INSPECT_EXPORT_BODY"] =
	"O botão Exportar copia todas as informações do frame para a área de transferência. Se você fez edições de propriedades, 'Exportar Alterações' gera código Lua pronto para uso mostrando valores antes/depois. Ótimo para compartilhar com outros desenvolvedores ou agentes de IA."

-- Help: Console Tab
L["HELP_CONSOLE_TITLE"] = "Aba Console"
L["HELP_CONSOLE_OVERVIEW_HEADING"] = "Visão Geral"
L["HELP_CONSOLE_OVERVIEW_BODY"] =
	"O Console agrega saída de depuração de todos os addons registrados com MechanicLib em um só lugar. Captura instruções print, logs de depuração e categorias personalizadas com timestamps. O buffer mantém as entradas mais recentes (configurável nas opções)."
L["HELP_CONSOLE_SOURCE_HEADING"] = "Filtro de Origem"
L["HELP_CONSOLE_SOURCE_BODY"] =
	"A navegação esquerda lista todos os addons que enviaram mensagens. Selecione um addon para mostrar apenas seus logs. Selecione 'Tudo' para ver tudo. Cada addon mostra uma contagem de suas mensagens entre parênteses."
L["HELP_CONSOLE_SEARCH_HEADING"] = "Busca"
L["HELP_CONSOLE_SEARCH_BODY"] =
	"Digite na caixa de busca para filtrar mensagens por conteúdo de texto. A busca compara o texto da mensagem, nome do addon de origem e categoria. Combine com filtro de origem para resultados precisos."
L["HELP_CONSOLE_DEDUP_HEADING"] = "Modos de Deduplicação"
L["HELP_CONSOLE_DEDUP_BODY"] =
	"Dois modos de deduplicação ajudam a reduzir o ruído. 'Deduplicar Tudo' remove todas as mensagens duplicadas completamente, mantendo apenas entradas únicas. 'Deduplicar Adjacentes' comprime apenas mensagens repetidas consecutivas, mostrando uma contagem como (x5). Botões estão na barra de ferramentas."
L["HELP_CONSOLE_PAUSE_HEADING"] = "Pausar/Continuar"
L["HELP_CONSOLE_PAUSE_BODY"] =
	"Clique no botão Pausar para congelar a exibição e parar de capturar novas mensagens. Isso permite ler os logs sem que eles rolem. Clique novamente para continuar. O botão mostra um ícone de play quando pausado."
L["HELP_CONSOLE_CLEAR_HEADING"] = "Limpar"
L["HELP_CONSOLE_CLEAR_BODY"] =
	"O botão Limpar (ícone de lixeira) esvazia todo o buffer do console. Isso é útil para começar do zero ao depurar uma ação ou cenário específico. Mensagens limpas não podem ser recuperadas."
L["HELP_CONSOLE_EXPORT_HEADING"] = "Exportar"
L["HELP_CONSOLE_EXPORT_BODY"] =
	"Exportar copia todos os logs atualmente filtrados para a área de transferência em formato compartilhável. Se habilitado nas opções, inclui um cabeçalho de ambiente com versão do WoW, info do personagem e localização para contexto completo de relatório de bug."

-- Help: Errors Tab
L["HELP_ERRORS_TITLE"] = "Aba Erros"
L["HELP_ERRORS_OVERVIEW_HEADING"] = "Visão Geral"
L["HELP_ERRORS_OVERVIEW_BODY"] =
	"A aba Erros exibe erros Lua capturados pelo !BugGrabber. Mostra a mensagem de erro, stack trace completo e variáveis locais no momento do erro. Essencial para depurar addons e rastrear bugs."
L["HELP_ERRORS_SESSION_HEADING"] = "Menu de Sessão"
L["HELP_ERRORS_SESSION_BODY"] =
	"Filtre erros por sessão usando o menu dropdown. 'Sessão Atual' mostra erros desde seu último /reload. 'Sessão Anterior' mostra erros de antes do último reload. 'Todas as Sessões' mostra o histórico completo de erros armazenado pelo BugGrabber."
L["HELP_ERRORS_SOURCE_HEADING"] = "Filtro de Origem"
L["HELP_ERRORS_SOURCE_BODY"] =
	"A navegação esquerda agrupa erros pelo addon que os causou. Mechanic detecta automaticamente a origem do stack trace. Clique em um addon para ver apenas seus erros. A contagem mostra quantos erros esse addon tem."
L["HELP_ERRORS_NAV_HEADING"] = "Navegação de Erros"
L["HELP_ERRORS_NAV_BODY"] =
	"Use os botões < e > para percorrer os erros um de cada vez. O contador mostra sua posição atual (ex., 3/12). A exibição principal mostra o erro completo com stack trace colorido para fácil leitura."
L["HELP_ERRORS_PAUSE_HEADING"] = "Pausar"
L["HELP_ERRORS_PAUSE_BODY"] =
	"Clique em Pausar para parar de capturar novos erros. Útil quando você quer examinar erros existentes sem novos sendo adicionados. A contagem de erros e exibição congelam até você continuar."
L["HELP_ERRORS_WIPE_HEADING"] = "Limpar"
L["HELP_ERRORS_WIPE_BODY"] =
	"O botão Limpar (ícone de lixeira) apaga todo o banco de dados de erros do BugGrabber. Use isso para começar do zero após corrigir bugs ou quando a lista de erros fica muito longa. Esta ação não pode ser desfeita."
L["HELP_ERRORS_EXPORT_HEADING"] = "Exportar"
L["HELP_ERRORS_EXPORT_BODY"] =
	"Exportar copia todos os erros (ou conjunto filtrado atual) para a área de transferência com stack traces completos. Inclui cabeçalho de ambiente se habilitado. Perfeito para compartilhar em relatórios de bug ou colar em assistentes de IA para ajuda na depuração."
L["HELP_ERRORS_BUGGRABBER_HEADING"] = "BugGrabber Necessário"
L["HELP_ERRORS_BUGGRABBER_BODY"] =
	"Este módulo requer o addon !BugGrabber para capturar erros Lua. Se não instalado, você verá instruções para baixá-lo do CurseForge ou WoWInterface. Após instalar, digite /reload."

-- Help: Tests Tab
L["HELP_TESTS_TITLE"] = "Aba Testes"
L["HELP_TESTS_OVERVIEW_HEADING"] = "Visão Geral"
L["HELP_TESTS_OVERVIEW_BODY"] =
	"A aba Testes fornece um executor de testes para diagnósticos de addon. Addons podem registrar testes via MechanicLib para validar sua funcionalidade. Testes são organizados por addon e categoria em uma visualização em árvore."
L["HELP_TESTS_TREE_HEADING"] = "Árvore de Testes"
L["HELP_TESTS_TREE_BODY"] =
	"Navegue pelos testes organizados hierarquicamente: Addon > Categoria > Teste. Clique para expandir nós. Cada teste mostra um ícone de status. Clique em um teste para ver seus detalhes no painel direito. A árvore atualiza após executar testes."
L["HELP_TESTS_RUN_HEADING"] = "Executar Selecionado"
L["HELP_TESTS_RUN_BODY"] =
	"Clique no botão play para executar o teste atualmente selecionado. O resultado aparece no painel de detalhes mostrando status de passou/falhou, duração da execução, mensagens de erro e saída de log capturada."
L["HELP_TESTS_AUTO_HEADING"] = "Executar Tudo Auto"
L["HELP_TESTS_AUTO_BODY"] =
	"O botão 'Executar Tudo Auto' executa todos os testes marcados com autoRun = true em todos os addons registrados. Estes são tipicamente testes de validação rápida. Um resumo aparece no chat mostrando total passou/falhou."
L["HELP_TESTS_DETAILS_HEADING"] = "Detalhes do Teste"
L["HELP_TESTS_DETAILS_BODY"] =
	"Quando um teste é selecionado, o painel de detalhes mostra: nome do teste, categoria, tipo (auto/manual), status com código de cor, duração da execução em segundos, mensagem de erro, detalhes de resultado estruturados e logs capturados."
L["HELP_TESTS_STATUS_HEADING"] = "Ícones de Status"
L["HELP_TESTS_STATUS_BODY"] =
	"Status do teste é mostrado com ícones coloridos: [+] verde = passou, [x] vermelho = falhou, [?] amarelo = pendente/executando, [-] cinza = ainda não executado. Estes aparecem tanto na árvore quanto no painel de detalhes."
L["HELP_TESTS_EXPORT_HEADING"] = "Exportar"
L["HELP_TESTS_EXPORT_BODY"] =
	"Exportar copia todos os resultados de teste para a área de transferência em formato estruturado. Inclui contagens de passou/falhou, resultados de testes individuais e detalhes de erros. Útil para relatórios de CI ou compartilhar com membros da equipe."

-- Help: Performance Tab
L["HELP_PERF_TITLE"] = "Aba Desempenho"
L["HELP_PERF_OVERVIEW_HEADING"] = "Visão Geral"
L["HELP_PERF_OVERVIEW_BODY"] =
	"A aba Desempenho monitora o uso de recursos de addon incluindo memória e tempo de CPU. A visualização Geral mostra métricas do sistema (FPS, latência, memória Lua). Clique em um addon na navegação esquerda para ver seu detalhamento."
L["HELP_PERF_GENERAL_HEADING"] = "Visualização Geral"
L["HELP_PERF_GENERAL_BODY"] =
	"A visualização padrão mostra: FPS atual, latência home/world, uso total de memória Lua e uma tabela ordenável de todos os addons com estatísticas de memória e CPU. O rodapé mostra duração do rastreamento e totais."
L["HELP_PERF_ADDONS_HEADING"] = "Lista de Addons"
L["HELP_PERF_ADDONS_BODY"] =
	"A tabela de addons mostra o uso de memória de cada addon (KB/MB), porcentagem do total, tempo de CPU (ms/s se perfil habilitado) e porcentagem de CPU. Clique nos cabeçalhos de coluna para ordenar. Clique em uma linha de addon para detalhamento."
L["HELP_PERF_CPU_HEADING"] = "Perfil de CPU"
L["HELP_PERF_CPU_BODY"] =
	"Habilite Perfil de CPU via checkbox para rastrear uso de CPU por addon. Requer recarregar a UI porque usa o sistema de perfil integrado do WoW. Colunas de CPU mostram milissegundos por segundo e porcentagem do tempo de frame."
L["HELP_PERF_REFRESH_HEADING"] = "Atualização Automática"
L["HELP_PERF_REFRESH_BODY"] =
	"Quando habilitado, métricas atualizam automaticamente a cada poucos segundos. Desabilite para análise de snapshot quando quiser números estáveis. Atualização manual acontece ao trocar visualizações ou retornar à aba."
L["HELP_PERF_SUBMETRICS_HEADING"] = "Sub-Métricas"
L["HELP_PERF_SUBMETRICS_BODY"] =
	"Selecione um addon na navegação esquerda para ver o detalhamento de suas sub-métricas registradas. Addons podem registrar métricas personalizadas via MechanicLib mostrando tempos internos (ex., 'Processamento de Eventos: 2.5ms'). Nem todos os addons fornecem isso."
L["HELP_PERF_RESET_HEADING"] = "Redefinir Estatísticas"
L["HELP_PERF_RESET_BODY"] =
	"Clique em Redefinir para limpar dados de desempenho acumulados e começar a medir do zero. Útil após telas de carregamento, eventos importantes ou quando você quer uma base de medição fresca para uma atividade específica."
L["HELP_PERF_EXPORT_HEADING"] = "Exportar"
L["HELP_PERF_EXPORT_BODY"] =
	"Exportar copia todos os dados de desempenho para a área de transferência em tabela formatada. Inclui métricas do sistema, todas as estatísticas de memória/CPU de addon e sub-métricas se visualizando um addon específico. Ótimo para relatórios de desempenho."

-- Help: Tools Tab
L["HELP_TOOLS_TITLE"] = "Aba Ferramentas"
L["HELP_TOOLS_OVERVIEW_HEADING"] = "Visão Geral"
L["HELP_TOOLS_OVERVIEW_BODY"] =
	"A aba Ferramentas hospeda painéis de diagnóstico personalizados registrados por addons. Cada addon pode fornecer sua própria UI de ferramentas para depuração, configuração ou operações especializadas. Selecione um addon da navegação esquerda para ver seu painel."
L["HELP_TOOLS_ADDON_HEADING"] = "Seleção de Addon"
L["HELP_TOOLS_ADDON_BODY"] =
	"A navegação esquerda lista todos os addons que registraram ferramentas via MechanicLib. Clique no nome de um addon para carregar seu painel personalizado na área de conteúdo. O painel é criado pelo próprio código do addon."
L["HELP_TOOLS_PANEL_HEADING"] = "Painéis de Ferramentas"
L["HELP_TOOLS_PANEL_BODY"] =
	"Cada addon define seu próprio layout de painel de ferramentas. Usos comuns incluem: visualizar logs internos, redefinir estado, configurar opções de depuração, exportar dados e executar diagnósticos específicos do addon. Consulte a documentação de cada addon."
L["HELP_TOOLS_REGISTER_HEADING"] = "Para Desenvolvedores de Addon"
L["HELP_TOOLS_REGISTER_BODY"] =
	"Registre ferramentas via MechanicLib:Register(name, { tools = { createPanel = function(parent), destroyPanel = function(panel) } }). Sua função createPanel recebe um frame pai para popular com elementos de UI."
L["HELP_TOOLS_EXPORT_HEADING"] = "Exportar"
L["HELP_TOOLS_EXPORT_BODY"] =
	"Exportar copia um resumo dos provedores de ferramentas registrados para a área de transferência. Útil para depurar integração com MechanicLib ou documentar quais addons suportam a interface de ferramentas."

-- Help: API Tab
L["HELP_API_TITLE"] = "Aba API"
L["HELP_API_OVERVIEW_HEADING"] = "Visão Geral"
L["HELP_API_OVERVIEW_BODY"] =
	"A aba API é um banco de testes para explorar as APIs Lua do WoW. Navegue funções categorizadas, teste-as com parâmetros, veja valores de retorno e verifique compatibilidade com Midnight 12.0. Essencial para desenvolvimento de addon e solução de problemas."
L["HELP_API_BROWSER_HEADING"] = "Navegador de APIs"
L["HELP_API_BROWSER_BODY"] =
	"A navegação esquerda organiza APIs por categoria (Unit, Spell, Item, Frame, etc.). Use a caixa de busca para filtrar por nome. Cabeçalhos de categoria são em negrito e não clicáveis. Clique em qualquer API para ver seus detalhes e parâmetros."
L["HELP_API_PARAMS_HEADING"] = "Parâmetros"
L["HELP_API_PARAMS_BODY"] =
	"Cada API mostra seus parâmetros com campos de entrada. Digite valores diretamente ou use o dropdown (v) para selecionar de exemplos comuns. Tipos de parâmetros são mostrados entre parênteses. Obrigatório vs opcional é indicado."
L["HELP_API_RUN_HEADING"] = "Botão Executar"
L["HELP_API_RUN_BODY"] =
	"Clique em Executar para executar a API com os valores de parâmetros atuais. Resultados aparecem na caixa de Resultados abaixo mostrando valores de retorno, erros ou status 'protegido'. Útil para testar disponibilidade de API."
L["HELP_API_CATEGORY_HEADING"] = "Executar Categoria"
L["HELP_API_CATEGORY_BODY"] =
	"Clique em 'Executar Tudo' para testar em lote cada API na categoria atual. Isso identifica rapidamente quais APIs estão disponíveis, protegidas ou ausentes na sua versão do WoW. Resumo de resultados aparece com contagens."
L["HELP_API_MIDNIGHT_HEADING"] = "Impacto Midnight"
L["HELP_API_MIDNIGHT_BODY"] =
	"Cada API mostra seu status de compatibilidade com Midnight 12.0. VERDE = inalterado e seguro. AMARELO = condicional (comportamento pode diferir). VERMELHO = quebra (protegido ou removido). Verifique a Nota Midnight para orientação específica."
L["HELP_API_NOTES_HEADING"] = "Notas Pessoais"
L["HELP_API_NOTES_BODY"] =
	"O campo de Notas na parte inferior permite salvar anotações pessoais para cada API. Notas são armazenadas no seu perfil Mechanic e persistem entre sessões. Use para lembretes, soluções alternativas ou documentação."
L["HELP_API_EXPORT_HEADING"] = "Copiar Relatório"
L["HELP_API_EXPORT_BODY"] =
	"O botão Copiar exporta os detalhes da API atual incluindo nome, categoria, parâmetros, status Midnight, últimos resultados de execução e suas notas. Perfeito para documentação ou compartilhar em discussões."
