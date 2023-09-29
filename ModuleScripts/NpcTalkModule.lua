local HttpService = game:GetService("HttpService")

local NpcJson = [[{
	"Game": {
		"Speech": "대충 게임 설명",
		"AnswerA": "게임을 시작한다.",
		"AnswerB": "게임에 대한 정보를 얻는다."
	},
	"Club": {
		"Speech": " 동아리 부스에 온 걸 환영합니다. 동아리 설명을 들어 보시겠어요?",
		"Answer": "동아리 정보를 얻는다."
	},
	"Hotdog": {
		"Speech": "안녕하세요! 어떤 핫도그 드릴까요?",
		"AnswerA": "칠리 핫도그 주세요.",
		"AnswerB": "머스타드 핫도그 주세요."
	},
	"IceCream": {
		"Speech": "안녕하세요! 어떤 맛 아이스크림으로 드릴까요?",
		"AnswerA": "바닐라맛 주세요.",
		"AnswerB": "초코맛 주세요.",
		"AnswerC": "딸기맛 주세요."
	}
}]]

local NpcTalk = {}
NpcTalk.NpcTalkTable = HttpService:JSONDecode(NpcJson)
return NpcTalk
