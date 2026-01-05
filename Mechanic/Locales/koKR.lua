-- Korean locale for Mechanic
local L = LibStub("AceLocale-3.0"):NewLocale("Mechanic", "koKR")
if not L then return end

-- Core
L["Mechanic"] = "Mechanic"
L["Unknown command: %s"] = "알 수 없는 명령어: %s"
L["Commands: console, errors, tests, perf, reload, gc, pause, copy, clear"] = "명령어: console, errors, tests, perf, reload, gc, pause, copy, clear"
L["GC: %.1f KB freed (%.1f MB -> %.1f MB)"] = "GC: %.1f KB 해제됨 (%.1f MB -> %.1f MB)"
L["GC executed: %s freed"] = "GC 실행됨: %s 해제"

-- Tabs
L["Console"] = "콘솔"
L["Errors"] = "오류"
L["Tests"] = "테스트"
L["Performance"] = "성능"
L["Tools"] = "도구"
L["API"] = "API"
L["Inspect"] = "검사"

-- Console
L["Source"] = "소스"
L["Category"] = "카테고리"
L["Search"] = "검색"
L["Clear"] = "지우기"
L["Dedup All"] = "모두 중복 제거"
L["Dedup Adj"] = "인접 중복 제거"
L["Dedup Adjacent"] = "인접 중복 제거"
L["Pause"] = "일시정지"
L["Resume"] = "재개"
L["Reset Button"] = "초기화"
L["All"] = "전체"
L["System"] = "시스템"
L["Lines: %d"] = "줄: %d"
L["Lines: 0"] = "줄: 0"
L["Reload UI"] = "UI 새로고침"

-- Errors
L["Session"] = "세션"
L["Current Session"] = "현재 세션"
L["Previous Session"] = "이전 세션"
L["All Sessions"] = "모든 세션"
L["None"] = "없음"
L["Copy Error"] = "오류 복사"
L["Wipe"] = "삭제"
L["Wipe Session"] = "세션 삭제"
L["!BugGrabber Required"] = "!BugGrabber 필요"
L["No errors in this session."] = "이 세션에 오류가 없습니다."
L["0/0"] = "0/0"
L["%d/%d"] = "%d/%d"
L["<"] = "<"
L[">"] = ">"
L["Error database wiped."] = "오류 데이터베이스가 삭제되었습니다."
L["[Error]"] = "[오류]"
L["Session: %s | Error: %d/%d"] = "세션: %s | 오류: %d/%d"
L["The Errors module requires !BugGrabber to capture Lua errors."] = "오류 모듈은 Lua 오류를 캡처하려면 !BugGrabber가 필요합니다."
L["Download from:"] = "다운로드:"
L["After installing, type /reload"] = "설치 후 /reload 입력"

-- Tests
L["Run Selected"] = "선택 항목 실행"
L["Run All Auto"] = "자동 전체 실행"
L["Validate"] = "검증"
L["Total"] = "총계"
L["Passed"] = "통과"
L["Failed"] = "실패"
L["Pending"] = "대기 중"
L["PASSED"] = "통과"
L["FAILED"] = "실패"
L["PENDING"] = "대기"
L["Status: %s%s|r"] = "상태: %s%s|r"
L["Status: |cff888888Not run|r"] = "상태: |cff888888실행되지 않음|r"
L["Category: %s"] = "카테고리: %s"
L["Select a test"] = "테스트 선택"
L["Tree View"] = "트리 뷰"
L["Export"] = "내보내기"
L["Export Button"] = "내보내기"
L["Duration: %.3fs"] = "지속 시간: %.3f초"
L["Message: %s"] = "메시지: %s"
L["Details:"] = "세부 정보:"
L["  %s %s: %s%s|r"] = "  %s %s: %s%s|r"
L["Captured Logs:"] = "캡처된 로그:"
L["  %s"] = "  %s"
L["No test selected."] = "선택된 테스트가 없습니다."
L["Tests complete: %d/%d passed"] = "테스트 완료: %d/%d 통과"
L["Result: %d/%d passed, %d failed, %d pending"] = "결과: %d/%d 통과, %d 실패, %d 대기"
L["%s > %s"] = "%s > %s"
L["Total: %d | Passed: %d | Failed: %d | Pending: %d"] = "총계: %d | 통과: %d | 실패: %d | 대기: %d"
L["No addons have registered diagnostic tools.\n\nAddons can register tools via:\nMechanicLib:Register(name, { tools = { ... } })"] =
	"진단 도구를 등록한 애드온이 없습니다.\n\n애드온은 다음을 통해 도구를 등록할 수 있습니다:\nMechanicLib:Register(name, { tools = { ... } })"

-- Performance
L["Auto-Refresh"] = "자동 새로고침"
L["Reset Stats"] = "통계 초기화"
L["CPU Profiling"] = "CPU 프로파일링"
L["FPS"] = "FPS"
L["Latency"] = "지연 시간"
L["Memory"] = "메모리"
L["Addon"] = "애드온"
L["Tracking"] = "추적"
L["Total Memory"] = "총 메모리"
L["Reset"] = "초기화"
L["FPS: --"] = "FPS: --"
L["FPS: %.0f"] = "FPS: %.0f"
L["Latency: --ms / --ms"] = "지연 시간: --ms / --ms"
L["Latency: %dms / %dms"] = "지연 시간: %dms / %dms"
L["Lua Memory: -- MB"] = "Lua 메모리: -- MB"
L["Lua Memory: %s"] = "Lua 메모리: %s"
L["Tracking: %s | Total Memory: %s"] = "추적: %s | 총 메모리: %s"
L["Tracking: %s | Total Memory: %s | CPU Profiling: %s"] = "추적: %s | 총 메모리: %s | CPU 프로파일링: %s"
L["Total:"] = "총계:"
L["Total: %.2f ms/s"] = "총계: %.2f ms/s"
L["Table View"] = "테이블 뷰"
L["Performance stats reset."] = "성능 통계가 초기화되었습니다."
L["General"] = "일반"
L["General Tab"] = "일반"
L["Addons Tab"] = "애드온"
L["%"] = "%"
L["CPU ms/s"] = "CPU ms/s"
L["-"] = "-"
L["ON"] = "켜짐"
L["OFF"] = "꺼짐"
L["%s - Performance Breakdown"] = "%s - 성능 분석"
L["CPU profiling requires a UI reload. Continue?"] = "CPU 프로파일링은 UI 새로고침이 필요합니다. 계속하시겠습니까?"
L["Reload"] = "새로고침"
L["Cancel"] = "취소"
L["No sub-metrics available for this addon."] = "이 애드온에 사용 가능한 하위 메트릭이 없습니다."
L["Addon performance tracking not available."] = "애드온 성능 추적을 사용할 수 없습니다."
L["!Mechanic is initializing..."] = "!Mechanic 초기화 중..."
L["Addon does not provide sub-metrics."] = "애드온이 하위 메트릭을 제공하지 않습니다."
L["Refresh"] = "새로고침"

-- Settings
L["Copy Options"] = "복사 옵션"
L["Registered Addons"] = "등록된 애드온"
L["Console Buffer Size"] = "콘솔 버퍼 크기"
L["Show Timestamps"] = "타임스탬프 표시"
L["Include Environment Header"] = "환경 헤더 포함"
L["Include Character Info"] = "캐릭터 정보 포함"
L["Include Timestamp"] = "타임스탬프 포함"
L["Refresh Interval"] = "새로고침 간격"
L["Track Event Frequency"] = "이벤트 빈도 추적"
L["Show Minimap Icon"] = "미니맵 아이콘 표시"

-- API
L["Run"] = "실행"
L["Run Category"] = "카테고리 실행"
L["Run Namespace"] = "네임스페이스 실행"
L["Copy Report"] = "보고서 복사"
L["Results:"] = "결과:"
L["Not yet run"] = "아직 실행되지 않음"
L["Notes:"] = "메모:"
L["Parameters:"] = "매개변수:"
L["Midnight Impact: %s%s|r"] = "미드나이트 영향: %s%s|r"
L["Midnight Note:"] = "미드나이트 참고:"
L["Select an API"] = "API 선택"
L["Select a category"] = "카테고리 선택"
L["Search APIs..."] = "API 검색..."
L["▼"] = "▼"
L["PROTECTED"] = "보호됨"
L["MISSING"] = "없음"
L["Function not found"] = "함수를 찾을 수 없음"
L["Cannot call from addon code"] = "애드온 코드에서 호출할 수 없음"
L["No API selected."] = "선택된 API가 없습니다."

-- Shared Export
L["Metric"] = "메트릭"
L["ms/s"] = "ms/s"
L["Description"] = "설명"
L["Press Ctrl+C to copy the text below."] = "Ctrl+C를 눌러 아래 텍스트를 복사하세요."
L["Close"] = "닫기"
L["Inspecting: %s"] = "검사 중: %s"
L["No object selected for inspection."] = "검사할 개체가 선택되지 않았습니다."
L["--- Members ---"] = "--- 멤버 ---"
L["... (truncated)"] = "... (생략됨)"

-- Inspect
L["Pick"] = "선택"
L["Picking..."] = "선택 중..."
L["Watch"] = "감시"
L["+ Watch"] = "+ 감시"
L["Frame path or global table..."] = "프레임 경로 또는 전역 테이블..."
L["Select a frame"] = "프레임 선택"
L["Geometry"] = "형상"
L["Visibility"] = "가시성"
L["Texture"] = "텍스처"
L["FontString"] = "폰트문자열"
L["Common Properties"] = "공통 속성"
L["Properties"] = "속성"
L["Export Changes"] = "변경 사항 내보내기"
L["Reset All Changes"] = "모든 변경 사항 초기화"
L["Shown"] = "표시됨"
L["Alpha"] = "알파"
L["Layering"] = "레이어"
L["Level"] = "레벨"
L["Strata"] = "스트라타"
L["Width"] = "너비"
L["Height"] = "높이"
L["Frame Level"] = "프레임 레벨"
L["Frame Strata"] = "프레임 스트라타"
L["Scale"] = "크기"
L["Text"] = "텍스트"
L["Color"] = "색상"
L["Text Color"] = "텍스트 색상"
L["Vertex Color"] = "버텍스 색상"
L["No changes to export."] = "내보낼 변경 사항이 없습니다."
L["Scripts"] = "스크립트"
L["Watch List"] = "감시 목록"
L["+ Watch Current"] = "+ 현재 감시"
L["Remove from Watch List"] = "감시 목록에서 제거"
L["Clear Watch List"] = "감시 목록 지우기"
L["Export All"] = "모두 내보내기"
L["Session: %s | Errors: %d"] = "세션: %s | 오류: %d"
L["Test Item"] = "테스트 항목"
L["Player"] = "플레이어"

-- Self-Registration
L["Register Mechanic"] = "Mechanic 등록"
L["View Health Log"] = "상태 로그 보기"
L["Clear Health Log"] = "상태 로그 지우기"
L["Reset UI Position"] = "UI 위치 초기화"
L["Mechanic: Developer tools for World of Warcraft"] = "Mechanic: 월드 오브 워크래프트 개발 도구"
L["Health log cleared."] = "상태 로그가 지워졌습니다."
L["UI position reset."] = "UI 위치가 초기화되었습니다."

-- Export Dialog Titles
L["Console Export"] = "콘솔 내보내기"
L["Errors Export"] = "오류 내보내기"
L["Tests Export"] = "테스트 내보내기"
L["Performance Export"] = "성능 내보내기"
L["Performance: %s"] = "성능: %s"
L["API: %s"] = "API: %s"
L["Tools: %s"] = "도구: %s"
L["Inspect: %s"] = "검사: %s"
L["API Export"] = "API 내보내기"
L["Tools Export"] = "도구 내보내기"
L["Inspect Export"] = "검사 내보내기"
L["Help"] = "도움말"

-- Missing Keys
L["Interactivity"] = "상호작용"
L["Anchors"] = "앵커"
L["Regions"] = "영역"
L["Regions (Textures/FontStrings)"] = "영역 (텍스처/폰트문자열)"
L["FenUI Details"] = "FenUI 세부정보"
L["Attributes"] = "속성"
L["Hierarchy"] = "계층"
L["Safe"] = "안전"
L["Safe APIs Only"] = "안전한 API만"

-- Help: Inspect Tab
L["HELP_INSPECT_TITLE"] = "검사 탭"
L["HELP_INSPECT_OVERVIEW_HEADING"] = "개요"
L["HELP_INSPECT_OVERVIEW_BODY"] =
	"검사 탭은 WoW UI 계층을 탐색하기 위한 강력한 프레임 디버거입니다. 보이는 모든 프레임을 선택하고, 부모/자식 관계를 탐색하며, 실시간으로 속성을 편집하고, 프레임의 실시간 업데이트를 감시할 수 있습니다."
L["HELP_INSPECT_PICK_HEADING"] = "선택 모드"
L["HELP_INSPECT_PICK_BODY"] =
	"선택 버튼(조준경 아이콘)을 클릭하여 선택 모드로 들어갑니다. 게임 UI의 아무 프레임 위로 마우스를 이동하면 주황색 테두리와 라벨로 강조됩니다. 해당 프레임을 검사하려면 클릭하고, 취소하려면 ESC를 누르세요."
L["HELP_INSPECT_PATH_HEADING"] = "경로 입력"
L["HELP_INSPECT_PATH_BODY"] =
	"입력 필드에 프레임 경로를 직접 입력하세요 (예: PlayerFrame, Minimap.ZoomIn, UIParent). Enter를 눌러 검사합니다. 경로는 WoW의 전역 네임스페이스와 프레임 계층을 사용하여 해석됩니다. 점을 사용하여 자식 프레임을 탐색하세요."
L["HELP_INSPECT_TREE_HEADING"] = "트리 탐색"
L["HELP_INSPECT_TREE_BODY"] =
	"왼쪽의 트리 패널은 프레임 계층을 보여줍니다. '>'를 클릭하여 부모 노드를 확장하고 자식을 볼 수 있습니다. 아무 노드나 클릭하여 해당 프레임을 선택하세요. 새 프레임을 선택하면 트리가 업데이트됩니다. 눈 아이콘은 프레임 가시성을 전환합니다."
L["HELP_INSPECT_PROPERTIES_HEADING"] = "속성 패널"
L["HELP_INSPECT_PROPERTIES_BODY"] =
	"속성 패널에서 위치, 크기, 알파, 스케일, 스트라타, 색상 등의 프레임 속성을 실시간으로 편집할 수 있습니다. 변경 사항은 즉시 라이브 UI에 적용됩니다. 각 속성에는 개별 변경 사항을 되돌리는 리셋 버튼이 있습니다. 변경 내보내기를 사용하여 Lua 코드를 생성하세요."
L["HELP_INSPECT_DETAILS_HEADING"] = "세부정보 패널"
L["HELP_INSPECT_DETAILS_BODY"] =
	"세부정보 패널은 프레임 유형, 부모 체인, 앵커, 영역(텍스처/폰트문자열), 스크립트, 속성 등 읽기 전용 정보를 표시합니다. 접기 토글(v/>)을 클릭하여 섹션을 표시하거나 숨기세요."
L["HELP_INSPECT_WATCH_HEADING"] = "감시 목록"
L["HELP_INSPECT_WATCH_BODY"] =
	"'+ 감시' 버튼을 사용하여 자주 검사하는 프레임을 감시 목록에 고정하세요. 감시 중인 프레임은 오른쪽 패널에 실시간 업데이트 값과 함께 나타납니다. 감시 항목을 클릭하여 해당 프레임으로 이동하세요. 지우기 버튼은 모든 감시를 제거합니다."
L["HELP_INSPECT_EXPORT_HEADING"] = "내보내기"
L["HELP_INSPECT_EXPORT_BODY"] =
	"내보내기 버튼은 모든 프레임 정보를 클립보드에 복사합니다. 속성을 편집한 경우 '변경 내보내기'는 전/후 값을 보여주는 사용 가능한 Lua 코드를 생성합니다. 다른 개발자나 AI 에이전트와 공유하기에 좋습니다."

-- Help: Console Tab
L["HELP_CONSOLE_TITLE"] = "콘솔 탭"
L["HELP_CONSOLE_OVERVIEW_HEADING"] = "개요"
L["HELP_CONSOLE_OVERVIEW_BODY"] =
	"콘솔은 MechanicLib에 등록된 모든 애드온의 디버그 출력을 한 곳에 모읍니다. print 문, 디버그 로그, 타임스탬프가 있는 사용자 정의 카테고리를 캡처합니다. 버퍼는 가장 최근 항목을 유지합니다 (설정에서 구성 가능)."
L["HELP_CONSOLE_SOURCE_HEADING"] = "소스 필터링"
L["HELP_CONSOLE_SOURCE_BODY"] =
	"왼쪽 탐색은 메시지를 보낸 모든 애드온을 나열합니다. 애드온을 선택하면 해당 로그만 표시됩니다. '전체'를 선택하면 모든 것을 볼 수 있습니다. 각 애드온은 괄호 안에 메시지 수를 표시합니다."
L["HELP_CONSOLE_SEARCH_HEADING"] = "검색"
L["HELP_CONSOLE_SEARCH_BODY"] =
	"검색 상자에 입력하여 텍스트 내용으로 메시지를 필터링하세요. 검색은 메시지 텍스트, 소스 애드온 이름, 카테고리와 일치합니다. 소스 필터링과 결합하여 정확한 결과를 얻으세요."
L["HELP_CONSOLE_DEDUP_HEADING"] = "중복 제거 모드"
L["HELP_CONSOLE_DEDUP_BODY"] =
	"두 가지 중복 제거 모드가 노이즈를 줄이는 데 도움이 됩니다. '모두 중복 제거'는 모든 중복 메시지를 완전히 제거하고 고유한 항목만 유지합니다. '인접 중복 제거'는 연속된 반복 메시지만 축소하여 (x5)와 같은 수를 표시합니다. 토글 버튼은 도구 모음에 있습니다."
L["HELP_CONSOLE_PAUSE_HEADING"] = "일시정지/재개"
L["HELP_CONSOLE_PAUSE_BODY"] =
	"일시정지 버튼을 클릭하여 디스플레이를 고정하고 새 메시지 캡처를 중지하세요. 로그가 스크롤되지 않고 읽을 수 있습니다. 다시 클릭하여 재개하세요. 일시정지 시 버튼에 재생 아이콘이 표시됩니다."
L["HELP_CONSOLE_CLEAR_HEADING"] = "지우기"
L["HELP_CONSOLE_CLEAR_BODY"] =
	"지우기 버튼(휴지통 아이콘)은 전체 콘솔 버퍼를 비웁니다. 특정 작업이나 시나리오를 디버깅할 때 새로 시작하는 데 유용합니다. 지워진 메시지는 복구할 수 없습니다."
L["HELP_CONSOLE_EXPORT_HEADING"] = "내보내기"
L["HELP_CONSOLE_EXPORT_BODY"] =
	"내보내기는 현재 필터링된 모든 로그를 공유 가능한 형식으로 클립보드에 복사합니다. 설정에서 활성화된 경우 전체 버그 리포트 컨텍스트를 위해 WoW 버전, 캐릭터 정보, 위치가 포함된 환경 헤더를 포함합니다."

-- Help: Errors Tab
L["HELP_ERRORS_TITLE"] = "오류 탭"
L["HELP_ERRORS_OVERVIEW_HEADING"] = "개요"
L["HELP_ERRORS_OVERVIEW_BODY"] =
	"오류 탭은 !BugGrabber가 캡처한 Lua 오류를 표시합니다. 오류 메시지, 전체 스택 트레이스, 오류 발생 시점의 로컬 변수를 보여줍니다. 애드온 디버깅과 버그 추적에 필수적입니다."
L["HELP_ERRORS_SESSION_HEADING"] = "세션 드롭다운"
L["HELP_ERRORS_SESSION_BODY"] =
	"드롭다운을 사용하여 세션별로 오류를 필터링하세요. '현재 세션'은 마지막 /reload 이후의 오류를 표시합니다. '이전 세션'은 마지막 reload 이전의 오류를 표시합니다. '모든 세션'은 BugGrabber에 저장된 전체 오류 기록을 표시합니다."
L["HELP_ERRORS_SOURCE_HEADING"] = "소스 필터링"
L["HELP_ERRORS_SOURCE_BODY"] =
	"왼쪽 탐색은 오류를 일으킨 애드온별로 오류를 그룹화합니다. Mechanic은 스택 트레이스에서 소스를 자동 감지합니다. 애드온을 클릭하면 해당 오류만 표시됩니다. 카운트는 해당 애드온의 오류 수를 보여줍니다."
L["HELP_ERRORS_NAV_HEADING"] = "오류 탐색"
L["HELP_ERRORS_NAV_BODY"] =
	"< 및 > 버튼을 사용하여 오류를 하나씩 살펴보세요. 카운터는 현재 위치를 표시합니다 (예: 3/12). 메인 디스플레이는 쉽게 읽을 수 있도록 색상이 지정된 스택 트레이스와 함께 전체 오류를 보여줍니다."
L["HELP_ERRORS_PAUSE_HEADING"] = "일시정지"
L["HELP_ERRORS_PAUSE_BODY"] =
	"일시정지를 클릭하여 새 오류 캡처를 중지하세요. 새 오류가 추가되지 않고 기존 오류를 검토할 때 유용합니다. 재개할 때까지 오류 수와 디스플레이가 고정됩니다."
L["HELP_ERRORS_WIPE_HEADING"] = "삭제"
L["HELP_ERRORS_WIPE_BODY"] =
	"삭제 버튼(휴지통 아이콘)은 전체 BugGrabber 오류 데이터베이스를 지웁니다. 버그 수정 후 새로 시작하거나 오류 목록이 너무 길어질 때 사용하세요. 이 작업은 취소할 수 없습니다."
L["HELP_ERRORS_EXPORT_HEADING"] = "내보내기"
L["HELP_ERRORS_EXPORT_BODY"] =
	"내보내기는 모든 오류(또는 현재 필터링된 세트)를 전체 스택 트레이스와 함께 클립보드에 복사합니다. 활성화된 경우 환경 헤더를 포함합니다. 버그 리포트에서 공유하거나 디버깅 도움을 위해 AI 어시스턴트에 붙여넣기에 적합합니다."
L["HELP_ERRORS_BUGGRABBER_HEADING"] = "BugGrabber 필요"
L["HELP_ERRORS_BUGGRABBER_BODY"] =
	"이 모듈은 Lua 오류를 캡처하려면 !BugGrabber 애드온이 필요합니다. 설치되지 않은 경우 CurseForge 또는 WoWInterface에서 다운로드하라는 안내가 표시됩니다. 설치 후 /reload를 입력하세요."

-- Help: Tests Tab
L["HELP_TESTS_TITLE"] = "테스트 탭"
L["HELP_TESTS_OVERVIEW_HEADING"] = "개요"
L["HELP_TESTS_OVERVIEW_BODY"] =
	"테스트 탭은 애드온 진단을 위한 테스트 러너를 제공합니다. 애드온은 MechanicLib를 통해 테스트를 등록하여 기능을 검증할 수 있습니다. 테스트는 트리 뷰에서 애드온과 카테고리별로 구성됩니다."
L["HELP_TESTS_TREE_HEADING"] = "테스트 트리"
L["HELP_TESTS_TREE_BODY"] =
	"계층적으로 구성된 테스트를 탐색하세요: 애드온 > 카테고리 > 테스트. 클릭하여 노드를 확장하세요. 각 테스트는 상태 아이콘을 표시합니다. 테스트를 클릭하여 오른쪽 패널에서 세부정보를 확인하세요. 테스트 실행 후 트리가 업데이트됩니다."
L["HELP_TESTS_RUN_HEADING"] = "선택 항목 실행"
L["HELP_TESTS_RUN_BODY"] =
	"재생 버튼을 클릭하여 현재 선택한 테스트를 실행하세요. 결과가 세부정보 패널에 나타나며 통과/실패 상태, 실행 시간, 오류 메시지, 캡처된 로그 출력을 보여줍니다."
L["HELP_TESTS_AUTO_HEADING"] = "자동 전체 실행"
L["HELP_TESTS_AUTO_BODY"] =
	"'자동 전체 실행' 버튼은 모든 등록된 애드온에서 autoRun = true로 표시된 모든 테스트를 실행합니다. 이것은 일반적으로 빠른 검증 테스트입니다. 채팅에 총 통과/실패 수를 보여주는 요약이 나타납니다."
L["HELP_TESTS_DETAILS_HEADING"] = "테스트 세부정보"
L["HELP_TESTS_DETAILS_BODY"] =
	"테스트를 선택하면 세부정보 패널에 테스트 이름, 카테고리, 유형(자동/수동), 색상 코드 상태, 초 단위 실행 시간, 오류 메시지, 구조화된 결과 세부정보, 캡처된 로그가 표시됩니다."
L["HELP_TESTS_STATUS_HEADING"] = "상태 아이콘"
L["HELP_TESTS_STATUS_BODY"] =
	"테스트 상태는 색상 아이콘으로 표시됩니다: [+] 녹색 = 통과, [x] 빨간색 = 실패, [?] 노란색 = 대기/실행 중, [-] 회색 = 아직 실행되지 않음. 이것은 트리와 세부정보 패널 모두에 나타납니다."
L["HELP_TESTS_EXPORT_HEADING"] = "내보내기"
L["HELP_TESTS_EXPORT_BODY"] =
	"내보내기는 모든 테스트 결과를 구조화된 형식으로 클립보드에 복사합니다. 통과/실패 수, 개별 테스트 결과, 오류 세부정보를 포함합니다. CI 리포트 또는 팀원과 공유에 유용합니다."

-- Help: Performance Tab
L["HELP_PERF_TITLE"] = "성능 탭"
L["HELP_PERF_OVERVIEW_HEADING"] = "개요"
L["HELP_PERF_OVERVIEW_BODY"] =
	"성능 탭은 메모리와 CPU 시간을 포함한 애드온 리소스 사용량을 모니터링합니다. 일반 뷰는 시스템 메트릭(FPS, 지연 시간, Lua 메모리)을 표시합니다. 왼쪽 탐색에서 애드온을 클릭하여 자세한 분석을 확인하세요."
L["HELP_PERF_GENERAL_HEADING"] = "일반 뷰"
L["HELP_PERF_GENERAL_BODY"] =
	"기본 뷰는 현재 FPS, 홈/월드 지연 시간, 총 Lua 메모리 사용량, 메모리 및 CPU 통계가 있는 모든 애드온의 정렬 가능한 테이블을 표시합니다. 푸터는 추적 기간과 합계를 보여줍니다."
L["HELP_PERF_ADDONS_HEADING"] = "애드온 목록"
L["HELP_PERF_ADDONS_BODY"] =
	"애드온 테이블은 각 애드온의 메모리 사용량(KB/MB), 총 비율, CPU 시간(프로파일링 활성화 시 ms/s), CPU 비율을 표시합니다. 열 헤더를 클릭하여 정렬하세요. 애드온 행을 클릭하여 자세한 분석을 확인하세요."
L["HELP_PERF_CPU_HEADING"] = "CPU 프로파일링"
L["HELP_PERF_CPU_BODY"] =
	"체크박스를 통해 CPU 프로파일링을 활성화하여 애드온별 CPU 사용량을 추적하세요. WoW의 내장 프로파일링 시스템을 사용하므로 UI 새로고침이 필요합니다. CPU 열은 초당 밀리초와 프레임 시간 비율을 보여줍니다."
L["HELP_PERF_REFRESH_HEADING"] = "자동 새로고침"
L["HELP_PERF_REFRESH_BODY"] =
	"활성화되면 메트릭이 몇 초마다 자동으로 업데이트됩니다. 안정적인 숫자를 원할 때 스냅샷 분석을 위해 비활성화하세요. 뷰를 전환하거나 탭으로 돌아올 때 수동 새로고침이 발생합니다."
L["HELP_PERF_SUBMETRICS_HEADING"] = "하위 메트릭"
L["HELP_PERF_SUBMETRICS_BODY"] =
	"왼쪽 탐색에서 애드온을 선택하여 등록된 하위 메트릭 분석을 확인하세요. 애드온은 MechanicLib를 통해 내부 타이밍을 보여주는 사용자 정의 메트릭을 등록할 수 있습니다 (예: '이벤트 처리: 2.5ms'). 모든 애드온이 이것을 제공하는 것은 아닙니다."
L["HELP_PERF_RESET_HEADING"] = "통계 초기화"
L["HELP_PERF_RESET_BODY"] =
	"초기화를 클릭하여 누적된 성능 데이터를 지우고 처음부터 측정을 시작하세요. 로딩 화면 후, 주요 이벤트 후, 또는 특정 활동에 대한 새로운 측정 기준을 원할 때 유용합니다."
L["HELP_PERF_EXPORT_HEADING"] = "내보내기"
L["HELP_PERF_EXPORT_BODY"] =
	"내보내기는 모든 성능 데이터를 서식이 지정된 테이블로 클립보드에 복사합니다. 시스템 메트릭, 모든 애드온 메모리/CPU 통계, 특정 애드온을 보는 경우 하위 메트릭을 포함합니다. 성능 리포트에 유용합니다."

-- Help: Tools Tab
L["HELP_TOOLS_TITLE"] = "도구 탭"
L["HELP_TOOLS_OVERVIEW_HEADING"] = "개요"
L["HELP_TOOLS_OVERVIEW_BODY"] =
	"도구 탭은 애드온이 등록한 사용자 정의 진단 패널을 호스팅합니다. 각 애드온은 디버깅, 구성 또는 전문 작업을 위한 자체 도구 UI를 제공할 수 있습니다. 왼쪽 탐색에서 애드온을 선택하여 해당 패널을 확인하세요."
L["HELP_TOOLS_ADDON_HEADING"] = "애드온 선택"
L["HELP_TOOLS_ADDON_BODY"] =
	"왼쪽 탐색은 MechanicLib를 통해 도구를 등록한 모든 애드온을 나열합니다. 애드온 이름을 클릭하여 콘텐츠 영역에 사용자 정의 패널을 로드하세요. 패널은 애드온 자체 코드에 의해 생성됩니다."
L["HELP_TOOLS_PANEL_HEADING"] = "도구 패널"
L["HELP_TOOLS_PANEL_BODY"] =
	"각 애드온은 자체 도구 패널 레이아웃을 정의합니다. 일반적인 용도는 내부 로그 보기, 상태 초기화, 디버그 옵션 구성, 데이터 내보내기, 애드온별 진단 실행 등입니다. 각 애드온의 문서를 참조하세요."
L["HELP_TOOLS_REGISTER_HEADING"] = "애드온 개발자용"
L["HELP_TOOLS_REGISTER_BODY"] =
	"MechanicLib:Register(name, { tools = { createPanel = function(parent), destroyPanel = function(panel) } })를 통해 도구를 등록하세요. createPanel 함수는 UI 요소로 채울 부모 프레임을 받습니다."
L["HELP_TOOLS_EXPORT_HEADING"] = "내보내기"
L["HELP_TOOLS_EXPORT_BODY"] =
	"내보내기는 등록된 도구 제공자의 요약을 클립보드에 복사합니다. MechanicLib 통합 디버깅 또는 도구 인터페이스를 지원하는 애드온 문서화에 유용합니다."

-- Help: API Tab
L["HELP_API_TITLE"] = "API 탭"
L["HELP_API_OVERVIEW_HEADING"] = "개요"
L["HELP_API_OVERVIEW_BODY"] =
	"API 탭은 WoW의 Lua API를 탐색하기 위한 테스트 벤치입니다. 분류된 함수를 찾아보고, 매개변수로 테스트하고, 반환 값을 확인하고, Midnight 12.0 호환성을 검사하세요. 애드온 개발과 문제 해결에 필수적입니다."
L["HELP_API_BROWSER_HEADING"] = "API 브라우저"
L["HELP_API_BROWSER_BODY"] =
	"왼쪽 탐색은 API를 카테고리별로 구성합니다 (Unit, Spell, Item, Frame 등). 검색 상자를 사용하여 이름으로 필터링하세요. 카테고리 헤더는 굵게 표시되며 클릭할 수 없습니다. 아무 API나 클릭하여 세부정보와 매개변수를 확인하세요."
L["HELP_API_PARAMS_HEADING"] = "매개변수"
L["HELP_API_PARAMS_BODY"] =
	"각 API는 입력 필드와 함께 매개변수를 표시합니다. 값을 직접 입력하거나 드롭다운(v)을 사용하여 일반적인 예제에서 선택하세요. 매개변수 유형은 괄호 안에 표시됩니다. 필수 vs 선택은 표시됩니다."
L["HELP_API_RUN_HEADING"] = "실행 버튼"
L["HELP_API_RUN_BODY"] =
	"실행을 클릭하여 현재 매개변수 값으로 API를 실행하세요. 결과가 아래 결과 상자에 나타나며 반환 값, 오류 또는 '보호됨' 상태를 보여줍니다. API 가용성 테스트에 유용합니다."
L["HELP_API_CATEGORY_HEADING"] = "카테고리 실행"
L["HELP_API_CATEGORY_BODY"] =
	"'전체 실행'을 클릭하여 현재 카테고리의 모든 API를 일괄 테스트하세요. WoW 버전에서 어떤 API가 사용 가능하고 보호되거나 누락되었는지 빠르게 식별합니다. 카운트와 함께 결과 요약이 나타납니다."
L["HELP_API_MIDNIGHT_HEADING"] = "미드나이트 영향"
L["HELP_API_MIDNIGHT_BODY"] =
	"각 API는 Midnight 12.0 호환성 상태를 표시합니다. 녹색 = 변경 없음 및 안전. 노란색 = 조건부 (동작이 다를 수 있음). 빨간색 = 중단 (보호되거나 제거됨). 특정 안내는 미드나이트 참고를 확인하세요."
L["HELP_API_NOTES_HEADING"] = "개인 메모"
L["HELP_API_NOTES_BODY"] =
	"하단의 메모 필드에서 각 API에 대한 개인 주석을 저장할 수 있습니다. 메모는 Mechanic 프로필에 저장되며 세션 간에 유지됩니다. 알림, 해결 방법 또는 문서화에 사용하세요."
L["HELP_API_EXPORT_HEADING"] = "보고서 복사"
L["HELP_API_EXPORT_BODY"] =
	"복사 버튼은 이름, 카테고리, 매개변수, 미드나이트 상태, 마지막 실행 결과, 메모를 포함한 현재 API의 세부정보를 내보냅니다. 문서화 또는 토론에서 공유하기에 적합합니다."
