local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ModuleScripts = ReplicatedStorage:WaitForChild("ModuleScripts")
local ClubModule = require(ModuleScripts:WaitForChild("ClubModule"))

ClubData = ClubModule.ClubInfoTable

local ClubPopUp = script.Parent
local Center = ClubPopUp:WaitForChild("Center")
local ClubDescription = Center:WaitForChild("ClubDescription")
local DescriptionText = ClubDescription:WaitForChild("TextLabel")
local DescriptionImg = ClubDescription:WaitForChild("ImageLabel")

local ScrollingFrame = Center:WaitForChild("ScrollingFrame")
local Club = ScrollingFrame:WaitForChild("Club1")
local ClubText = Club:WaitForChild("TextButton")

local ClubTitle = Center:WaitForChild("SportsClub"):WaitForChild("TextLabel")

local ExitButton = Center:WaitForChild("Exit")

local ClubType = {["종교분과"]="Religion", ["봉사분과"]="Volunteer", ["인문사회분과"]="Humanities And Society", ["과학분과"]="Science", ["평면예술분과"]="Two Dimensional Art", ["연행예술분과"]="Performing Art", ["스포츠레저분과"]="Sports"}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EventFolder = ReplicatedStorage:WaitForChild("Events")
local ServerToClient = EventFolder:WaitForChild("ServerToClient")
local ActiveClubNpcTalk = ServerToClient:WaitForChild("ActiveClubNpcTalk")
local Clubs = {}

local Players = game:GetService("Players")
local Player = Players:FindFirstChildOfClass("Player")
local PlayerGui = Player:WaitForChild("PlayerGui")
local MainGuiScreen = PlayerGui:WaitForChild("MainGuiScreen")

ActiveClubNpcTalk.OnClientEvent:Connect(function(ClubProximityPrompt)
	DestroyCopied()
	Clubs = {}
	
	local Npc = ClubProximityPrompt.Parent
	local NpcNameText = Npc:WaitForChild("Head"):WaitForChild("BillboardGui"):WaitForChild("Frame"):WaitForChild("TextLabel")
	local type = string.split(NpcNameText.Text, " ")[1]
	
	for k, v in pairs(ClubData) do
		if string.find(k, ClubType[type]) then
			table.insert(Clubs, {k, v})
			ClubTitle.Text = ClubType[type] .. " Club"
		end
	end
	
	table.sort(Clubs, function(a, b)
		return a[1] < b[1]
	end)
	
	ClubText.Text = Clubs[1][2].name
	DescriptionText.Text = Clubs[1][2].description
	DescriptionImg.Image = Clubs[1][2].id
	
	ClubText.MouseButton1Click:Connect(function()
		DescriptionText.Text = Clubs[1][2].description
		DescriptionImg.Image = Clubs[1][2].id
	end)
	
	for i = 2, #Clubs do	
		local CopyTitle = Club:Clone()
		CopyTitle.Parent = ScrollingFrame
		CopyTitle.Name = "CopyTitle"
		local ClubNameTextButton = CopyTitle:WaitForChild("TextButton")
		ClubNameTextButton.Text = Clubs[i][2].name
		
		ClubNameTextButton.MouseButton1Click:Connect(function()
			DescriptionText.Text = Clubs[i][2].description
			DescriptionImg.Image = Clubs[i][2].id
		end)
	end
end)

ExitButton.MouseButton1Click:Connect(function()
	MainGuiScreen.Enabled = true
	ClubPopUp.Visible = false
	local Humanoid = workspace:WaitForChild(Player.Name):WaitForChild("Humanoid")
	Humanoid.WalkSpeed=50
	Humanoid.JumpHeight=7.2
end)

function DestroyCopied()
	local ScrollingFrameChildren = ScrollingFrame:GetChildren()
	for k, v in pairs(ScrollingFrameChildren) do
		if v.Name == "CopyTitle" then
			v:Destroy()
		end
	end
end
