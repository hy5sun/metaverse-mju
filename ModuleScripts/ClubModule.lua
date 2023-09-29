local HttpService = game:GetService("HttpService")

local ClubInfoJson = [[{
	"Religion1": {
		"name": "CAM",
		"id": "rbxassetid://14748066911",
		"description": "23학번 새내기 여러분! 주님의 사랑으로 환영합니다^^ 명지대학교에 하나님의 나라를 이루어 가는 공동체입니다!\n전국 40여 대학에서 활동하는 연합 동아리이며 학원복음화협의회에 가입된 안전한 기독교 동아리입니다!"
	},
	"Religion2": {
		"name": "C.C,C",
		"id": "rbxassetid://14748430368",
		"description": "ccc는 전국 연합 동아리로, 약 2만여명의 대학생이 활동하는 기독교 동아리 입니다! 버스 복음화를 꿈꾸며 신앙적인 활동들과 서로 사랑하며 교제하는 활동을 주로 합니다."
	},
	"Religion3": {
		"name": "실로암",
		"id": "rbxassetid://14748168321",
		"description": "명지대학교 복음화를 위해 사역하는 명지대 자생 기독교 동아리 실로암입니다!\n매주 목요일 오후 6시에 정기예배로 모이고 있습니다.\n가입도 방문도 모두 환영해요 :D"
	},
	"Religion4": {
		"name": "CFM",
		"id": "rbxassetid://14748065805",
		"description": "겨울에는 따뜻하게, 여름에는 시원하게 누울 동방 有\n삼시 세 끼 챙겨줄 선배 있음!\n기타 / 피아노 있음! \n\n사계절 꿀잼 MT와 소풍 Go Go!!\n인하대, 경기대, 명지대(인문/자연), 인천대 등 타 대학 CFM 학생들과의 연합 수어공연, MT, 캠프 등 진행"
	},
	"Volunteer1": {
		"name": "LAMU",
		"id": "rbxassetid://14748351522",
		"description": "라뮤는 해비타트(CCYP)에 소속된 봉사동아리로써 많은 대학들과 연합 봉사 활동 진행하고 있어요!\n대표적인 봉사로 건축, 벽화, 교육 봉사가 구성되어 있어요.\n뿐만 아니라 창립제, 연합 체육 대회, 연말 파티와 같은다양한 행사도 진행한답니다.\n23학번 신입생 그리고 재학생 여러분! 마음껏 지원해주세요."
	},
	"Volunteer2": {
		"name": "KUSA",
		"id": "rbxassetid://14748103866",
		"description": "월 0회 봉사활동 (강요x)\nUNESCO 관련활동 - 명지대 외 전국 60여개 학교마다 KUSA 연합 활동 등등 많은 경험의 봉사활동과 친목도모 등 편하게 가입바랍니다!"
	},
	"Volunteer3": {
		"name": "아이사랑",
		"id": "rbxassetid://14748104327",
		"description": "명지대학교 봉사 동아리 아이사랑은 자연캠퍼스 내 유일한 탁아봉사 동아리입니다.\n다양한 봉사활동들을 진행하고 있으니 함께 알찬 대학생활 만들어 보아요!"
	},
	"Volunteer4": {
		"name": "MUV",
		"id": "rbxassetid://14748118252",
		"description": "- 일년에 4번 전국 연합 봉사!\n- 일년에 한번 MT 봉사!\n- 한달에 한번 정기 봉사!\n- 희망브릿지와 용인시청의 후원을 받는 동아리!\n무브로 오셔서 봉사도 하고 기술도 배우세요! (어렵지 않아요)"
	},
	"Volunteer5": {
		"name": "스카우트",
		"id": "rbxassetid://14748117112",
		"description": "명지대학교 유일 봉사 캠핑동아리!\n색 다르고 다양한 경험을 할 수 있는 봉사, 캠핑 동아리\n언제든 편하게 오세요!"
	},
	"Humanities And Society": {
		"name": "TIME",
		"id": "rbxassetid://14738293022",
		"description": "1979년부터 활동을 시작한 유서깊은 영자신문/잡지 동아리 TIME 입니다. 부담없이 연락주세요!"
	},
	"Science1": {
		"name": "M.C.C",
		"id": "rbxassetid://14748103360",
		"description": "1. 코딩 인강 제공\n2. 스터디 및 공모전 진행\n3. 친목 모임"
	},
	"Science2": {
		"name": "슬기터",
		"id": "rbxassetid://14748116902",
		"description": "명지대 발명 창업 동아리 슬기터!\n다양한 전공 사람드로가 발명 공모전을 하고 싶다면 슬기터로 놀러오세요!"
	},
	"Science3": {
		"name": "RATS",
		"id": "rbxassetid://14748430269",
		"description": "하드웨어, 소프트웨어 개발에 관심있는 사람이라면 누구나 가입 가능!\n개발을 처음 접하는 사람들을 위해 프로그래밍, CAD, 회로 등 다양한 교육 진행중!\n다양한 공모전 참여, 스터디 및 세미나가 활발히 이루어지는 동아리입니다!"
	},
	"Two Dimensional Art1": {
		"name": "포토랩",
		"id": "rbxassetid://14748117700",
		"description": "사진을 즐기고 다 같이 노는 것을 좋아하는 포토랩입니다!\n여러 학과 친구들과 친해질 수 있고 다양한 활동을 통해 좋은 추억을 남길 수 있습니다."
	},
	"Two Dimensional Art2": {
		"name": "A&P",
		"id": "rbxassetid://14748327865",
		"description": "안녕하세요! 천문 사진 동아리 A&P 입니다.\n수도권 일대로 출사를 나가 다같이 찍고 찍히면서 친목을 도모하고 좋은 추억을 남기는 동아리입니다."
	},
	"Two Dimensional Art3": {
		"name": "필름아트",
		"id": "rbxassetid://14748104643",
		"description": "안녕하세요! 영화 감상 동아리 필름아트입니다.\n필름아트는 자유롭게 영화를 감상하고 생각을 나눌 수 있는 공간입니다 :)\n영화를 좋아하는 여러분, 모두모두 환영합니다!"
	},
	"Two Dimensional Art4": {
		"name": "표현의 자유",
		"id": "rbxassetid://14748117497",
		"description": "글과 그림을 하나로 모으는 표현의 자유입니다. 여러분의 상상을 표현해 주세요."
	},
	"Performing Art1": {
		"name": "소울메이트",
		"id": "rbxassetid://14748327363",
		"description": "흑인음악 동아리 소울메이트입니다! 랩, 보컬, 프로듀싱 등 힙합문화를 기반으로 하는 예술활동을 하는 동아리입니다.\n곡 작업과 공연을 하며 같이 즐거운 대학생활을 할, 당신을 기다리고 있습니다. :)"
	},
	"Performing Art2": {
		"name": "울림소리",
		"id": "rbxassetid://14748327198",
		"description": "울림소리 37기 신입생 모집\n모집 세션 : 보컬, 건반, 기타, 베이스, 드럼\n동방 위치 : 학관 지하 1층 019호"
	},
	"Performing Art3": {
		"name": "페가수스",
		"id": "rbxassetid://14748118052",
		"description": "넓고 쾌적한 합주실과 선배들의 탄탄한 지원으로 밴드 활동하기 완벽한 환경을 가진 동아리입니다.\n외부 공 기회도 많아서 다양한 경험과 추억을 쌓을 수 있습니다. 많은 지원 부탁드립니다!"
	},
	"Performing Art4": {
		"name": "CEMO",
		"id": "rbxassetid://14748066088",
		"description": "자연캠퍼스 유일한 연극동아리 'CEMO'\n한번쯤 배우들의 대사를 따라해봤다!\n나는 내성적이지만 주목받아보고 싶다!\n나는 연극을 잘 모르지만 경험해보고 싶다!\n대학생활에 인상 깊은 추억을 남기고 싶다!"
	},
	"Performing Art5": {
		"name": "이따위",
		"id": "rbxassetid://14748104108",
		"description": "명지대학교 밴드동아리 이따위 입니다.\n악기 다루는 것을 좋아하거나 배우고 싶으신 분들은 언제나 환영입니다!"
	},
	"Performing Art6": {
		"name": "마라톤",
		"id": "rbxassetid://14748103569",
		"description": "장르를 가리지 않는 밴드 동아리\n도레미파솔라시도만 알면 누구든 환영합니다."
	},
	"Performing Art7": {
		"name": "예현회",
		"id": "rbxassetid://14748326941",
		"description": "클래식 기타 동아리 예현회입니다.\n클래식 기타 외에 통기타 등 기타 전반을 다루고 기타를 처음 치시는 분들은 기타를 배워가실 수 있습니다.\n마음 맞는 분들과 함께 합주도 하며, 즐거운 추억을 만드실 분들을 찾고 있습니다."
	},
	"Performing Art8": {
		"name": "우리또래",
		"id": "rbxassetid://14738291166",
		"description": "우리의 젊음,낭만, 축제 '우리또래'입니다!\n자유롭고 열정적인 밴드동아리인 우리또래에서 여러분의 꿈을 실현해보세요!"
	},
	"Performing Art9": {
		"name": "CDC",
		"id": "rbxassetid://14748066333",
		"description": "실력 상관없이 재미있는 동아리 활동을 하고 싶은 분!\n자연캠퍼스 유일한 댄스동아리 CDC에 많은 지원 부탁드립니다!"
	},
	"Sports1": {
		"name": "M.T.C",
		"id": "rbxassetid://14748118465",
		"description": "테니스를 재밌게 즐기는 동아리 MTC입니다!\n운동과 친목을 한번에!"
	},
	"Sports2": {
		"name": "퍼펙트",
		"id": "rbxassetid://14748117889",
		"description": "2019년 횡성배 KUBA 주최 대회 8강\n2020년 KUSF 클럽 챔피언쉽 8강\n2021년 AUBL 으뜸 리그 8강\n야구동아리 퍼펙트입니다!"
	},
	"Sports3": {
		"name": "배드신",
		"id": "rbxassetid://14748067420",
		"description": "매주 운동일을 정하여 정기적으로 배드민턴 모임을 갖습니다."
	},
	"Sports4": {
		"name": "SUAVE",
		"id": "rbxassetid://14748168058",
		"description": "클라이밍이 처음인 분도 환영!\n안 해본 사람은 있어도 한번만 한 사람은 없다죠??\n즐클합시당"
	},
	"Sports5": {
		"name": "유니콘스",
		"id": "rbxassetid://14748765832",
		"description": "축구를 즐기며 할 수 있으신 분,\n축구를 보거나 사진 촬영에 관심이 있으신 분,\n서로 친해지며 재밌게 운동하실 분,\n명지대 학운분들이라면 누구나 환영입니다!"
	},
	"Sports6": {
		"name": "SWHISH",
		"id": "rbxassetid://14738293477",
		"description": "- 실력에 상관없이 즐겁게 농구하고자 하는 분\n- 평소부터 농구를 좋아하고 관심이 많으신 분\n- 농구 좋아하는 여학우(매니저)도 모집 중 입니다."
	},
	"Sports7": {
		"name": "MEGA",
		"id": "rbxassetid://14748103088",
		"description": "단순히, 다같이 게임을 즐기고 싶다면?\n직접 E-sports 분야를 체험하고 싶다면?\n게임을 하고 각종 상품을 따고 싶다면?"
	},
	"Sports8": {
		"name": "검심",
		"id": "rbxassetid://14748104464",
		"description": "명지대 자연캠퍼스 검도 동아리 검심입니다!\n초보자분들과 유경험자분들 모두 환영합니다 :D!!\n학교 안에서 일주일에 2번 6~7시 정규 운동 진행하고 있으며, 서로 간의 모임도 자주 있습니다!"
	},
	"Sports9": {
		"name": "AIM-SPOT",
		"id": "rbxassetid://14748056075",
		"description": "누구나 가볍게 즐길 수 있는 실내 스포츠 볼링\n매주 학교 앞 볼링장에 모여 볼링 정기전 한판\n오늘따라 볼링이 치고 싶은 사람끼리 한 판 볼링을 배울 수 있는 절호의 기회\n볼링을 좋아하시는 분 모두 환영입니다!"
	},
	"Sports10": {
		"name": "밸런스",
		"id": "rbxassetid://14748067124",
		"description": "안녕하십니까! 명지대학교 배구동아리 BALANCE(밸런스)입니다.\n우리 밸런스는 9인제 경기를 바탕으로 남녀 모두 배구를 즐겁고 재밌게 배우고 있습니다.\n배구에 관심이 있으신 분들은 편하게 와 주시면 감사하겠습니다!"
	}
}]]

local ClubInfo = {}
ClubInfo.ClubInfoTable = HttpService:JSONDecode(ClubInfoJson)
return ClubInfo
