local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ModuleScripts = ReplicatedStorage:WaitForChild("ModuleScripts")
local NpcTalkModule = require(ModuleScripts:WaitForChild("NpcTalkModule"))

local MjuFestival = ReplicatedStorage:WaitForChild("MjuFestival")
local AnswerButton = MjuFestival:WaitForChild("Answer")

NpcTalkData = NpcTalkModule.NpcTalkTable

local EventFolder = ReplicatedStorage:WaitForChild("Events")
local ServerToClient = EventFolder:WaitForChild("ServerToClient")
local ActiveClubNpcTalk = ServerToClient:WaitForChild("ActiveClubNpcTalk")
local ActiveGameNpcTalk = ServerToClient:WaitForChild("ActiveGameNpcTalk")
local ActiveHotdogNpcTalk = ServerToClient:WaitForChild("ActiveHotdogNpcTalk")
local ActiveIceCreamNpcTalk = ServerToClient:WaitForChild("ActiveIceCreamNpcTalk")

local Tools = ReplicatedStorage:WaitForChild("Tools")
local ChiliHotdogTool = Tools:WaitForChild("ChiliHotdogTool")
local MustardHotdogTool = Tools:WaitForChild("MustardHotdogTool")
local VanillaIceCreamTool = Tools:WaitForChild("VanillaIceCreamTool")
local ChocoIceCreamTool = Tools:WaitForChild("ChocoIceCreamTool")
local BerryIceCreamTool = Tools:WaitForChild("BerryIceCreamTool")

local NpcChatWindow = script.Parent
local Center = NpcChatWindow:WaitForChild("Center")
local NpcDescription = Center:WaitForChild("NpcDescription"):WaitForChild("TextLabel")
local NpcName = Center:WaitForChild("NpcName"):WaitForChild("TextLabel")
local Answers = Center:WaitForChild("Answer")
local Quit = Answers:WaitForChild("QuitChat")

local PopUpScreen = NpcChatWindow.Parent
local ClubPopUp = PopUpScreen:WaitForChild("ClubPopup")

local PlayerGui = PopUpScreen.Parent
local MainGuiScreen = PlayerGui:WaitForChild("MainGuiScreen")
local RhythmGame = PlayerGui:WaitForChild("RhythmGame")
local GameTutorial = PlayerGui:WaitForChild("GameTutorial")
local Tutorial = GameTutorial:WaitForChild("Tutorial")

local Players = game:GetService("Players")
local Player = Players:FindFirstChildOfClass("Player")

local StartGui = game:GetService("StarterGui")
StartGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

function CantMove()
	local Humanoid = workspace:WaitForChild(Player.Name):WaitForChild("Humanoid")
	Humanoid.WalkSpeed=0
	Humanoid.JumpHeight=0
end

function Move()
	local Humanoid = workspace:WaitForChild(Player.Name):WaitForChild("Humanoid")
	Humanoid.WalkSpeed=50
	Humanoid.JumpHeight=7.2
end

function Exit()
	MainGuiScreen.Enabled = true
	NpcChatWindow.Visible = false
	Move()
end

function DestroyCopied()
	local AnswerChildren = Answers:GetChildren()
	for k, v in pairs(AnswerChildren) do
		if v.Name == "AnswerA" or v.Name == "AnswerB" or v.Name == "AnswerC" then
			print(v)
			v:Destroy()
		end
	end
end

ActiveClubNpcTalk.OnClientEvent:Connect(function(ClubProximityPrompt)
	DestroyCopied()
	CantMove()
	
	NpcChatWindow.Visible = true
	MainGuiScreen.Enabled = false
	
	local Npc = ClubProximityPrompt.Parent
	local NpcNameText = Npc:WaitForChild("Head"):WaitForChild("BillboardGui"):WaitForChild("Frame"):WaitForChild("TextLabel")
	NpcName.Text = NpcNameText.Text
	NpcDescription.Text = string.split(NpcNameText.Text, " ")[1] .. NpcTalkData.Club.Speech
	
	local AnswerA = AnswerButton:Clone()
	AnswerA.Parent = Answers
	AnswerA.Name = "AnswerA"
	local AnswerAText = AnswerA:WaitForChild("TextLabel")
	AnswerAText.Text = NpcTalkData.Club.Answer
	
	Center.Position = UDim2.new(0.5, 0, 0.83, 0)
	Quit.LayoutOrder = 1
	
	AnswerA.MouseButton1Click:Connect(function()
		NpcChatWindow.Visible = false
		ClubPopUp.Visible = true
	end)
end)

ActiveGameNpcTalk.OnClientEvent:Connect(function(GameProximityPrompt)
	DestroyCopied()
	CantMove()
	
	local AnswerA = AnswerButton:Clone()
	AnswerA.Parent = Answers
	AnswerA.Name = "AnswerA"
	local AnswerAText = AnswerA:WaitForChild("TextLabel")
	
	local AnswerB = AnswerButton:Clone()
	AnswerB.Parent=Answers
	AnswerB.Name = "AnswerB"
	AnswerB.LayoutOrder = 2
	Quit.LayoutOrder = 3
	local AnswerBText = AnswerB:WaitForChild("TextLabel")
	
	local Npc = GameProximityPrompt.Parent
	local NpcNameText = Npc:WaitForChild("Head"):WaitForChild("BillboardGui"):WaitForChild("Frame"):WaitForChild("TextLabel")
	NpcName.Text = NpcNameText.Text
	NpcDescription.Text = NpcTalkData.Game.Speech
	AnswerAText.Text = NpcTalkData.Game.AnswerA -- 게임 시작
	AnswerBText.Text = NpcTalkData.Game.AnswerB -- 게임 정보
	NpcChatWindow.Visible = true
	MainGuiScreen.Enabled = false
	
	Center.Position = UDim2.new(0.5, 0, 0.76, 0)
	Quit.LayoutOrder = 3
	
	AnswerA.MouseButton1Click:Connect(function()
		NpcChatWindow.Visible = false
		RhythmGame.Enabled = true
	end)
	
	AnswerB.MouseButton1Click:Connect(function()
		Tutorial.Visible = true
		NpcChatWindow.Visible = false
	end)
end)

ActiveHotdogNpcTalk.OnClientEvent:Connect(function(Player, HotdogProximityPrompt)
	DestroyCopied()
	CantMove()
	
	local AnswerA = AnswerButton:Clone()
	AnswerA.Parent = Answers
	AnswerA.Name = "AnswerA"
	local AnswerAText = AnswerA:WaitForChild("TextLabel")
	
	local AnswerB = AnswerButton:Clone()
	AnswerB.Parent=Answers
	AnswerB.Name = "AnswerB"
	AnswerB.LayoutOrder = 2
	Quit.LayoutOrder = 3
	local AnswerBText = AnswerB:WaitForChild("TextLabel")

	local Npc = HotdogProximityPrompt.Parent
	local NpcNameText = Npc:WaitForChild("Head"):WaitForChild("BillboardGui"):WaitForChild("Frame"):WaitForChild("TextLabel")
	NpcName.Text = NpcNameText.Text
	NpcDescription.Text = NpcTalkData.Hotdog.Speech
	AnswerAText.Text = NpcTalkData.Hotdog.AnswerA
	AnswerBText.Text = NpcTalkData.Hotdog.AnswerB
	NpcChatWindow.Visible = true
	MainGuiScreen.Enabled = false
	
	Center.Position = UDim2.new(0.5, 0, 0.76, 0)
	Quit.LayoutOrder = 3
	
	AnswerA.MouseButton1Click:Connect(function()
		ActiveHotdogNpcTalk:FireServer(ChiliHotdogTool)
		print("칠리 핫도그")
		Exit()
	end)

	AnswerB.MouseButton1Click:Connect(function()
		ActiveHotdogNpcTalk:FireServer(MustardHotdogTool)
		print("머스타드 핫도그")
		Exit()
	end)
end)

ActiveIceCreamNpcTalk.OnClientEvent:Connect(function(IceCreamProximityPrompt)
	DestroyCopied()
	CantMove()
	
	local AnswerA = AnswerButton:Clone()
	AnswerA.Parent = Answers
	AnswerA.Name = "AnswerA"
	local AnswerAText = AnswerA:WaitForChild("TextLabel")
	AnswerAText.Text = NpcTalkData.IceCream.AnswerA
	
	local AnswerB = AnswerButton:Clone()
	AnswerB.Parent=Answers
	AnswerB.Name = "AnswerB"
	local AnswerBText = AnswerB:WaitForChild("TextLabel")
	AnswerBText.Text = NpcTalkData.IceCream.AnswerB
	
	local AnswerC = AnswerButton:Clone()
	AnswerC.Parent=Answers
	AnswerC.Name = "AnswerC"
	local AnswerCText = AnswerC:WaitForChild("TextLabel")
	AnswerCText.Text = NpcTalkData.IceCream.AnswerC
	
	AnswerB.LayoutOrder = 2
	AnswerC.LayoutOrder = 3
	Quit.LayoutOrder = 4
	
	local Npc = IceCreamProximityPrompt.Parent
	local NpcNameText = Npc:WaitForChild("Head"):WaitForChild("BillboardGui"):WaitForChild("Frame"):WaitForChild("TextLabel")
	NpcName.Text = NpcNameText.Text
	NpcDescription.Text = NpcTalkData.IceCream.Speech
	
	NpcChatWindow.Visible = true
	MainGuiScreen.Enabled = false
	
	Center.Position = UDim2.new(0.5, 0, 0.76, 0)
	Quit.LayoutOrder = 3
	
	AnswerA.MouseButton1Click:Connect(function()
		ActiveIceCreamNpcTalk:FireServer(VanillaIceCreamTool)
		print("바닐라 아이스크림")
		Exit()
	end)

	AnswerB.MouseButton1Click:Connect(function()
		ActiveIceCreamNpcTalk:FireServer(ChocoIceCreamTool)
		print("초코 아이스크림")
		Exit()
	end)
	
	AnswerC.MouseButton1Click:Connect(function()
		ActiveIceCreamNpcTalk:FireServer(BerryIceCreamTool)
		print("딸기 아이스크림")
		Exit()
	end)
end)

Quit.MouseButton1Click:Connect(function()
	Exit()
end)
