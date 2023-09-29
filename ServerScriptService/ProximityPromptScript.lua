local ProximityPromptService = game:GetService("ProximityPromptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ModuleScripts = ReplicatedStorage:WaitForChild("ModuleScripts")
local EventFolder = ReplicatedStorage.Events
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

function GiveAndGetTool(Player, Tool)
	DestroyExitedItem(Player, Tool)
	
	local CloneTool = Tool:Clone()
	local Backpack = Player:FindFirstChildOfClass("Backpack")
	if Backpack then
		CloneTool.Parent = Backpack
	end
	
	GetTool(Player, CloneTool)
end

function GetTool(Player, Tool)
	if Player and Player.Character then
		local Backpack = Player:FindFirstChildOfClass("Backpack")
		local Item = Backpack:FindFirstChild(Tool.Name)
		local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
		if Humanoid then
			if Item then
				Humanoid:UnequipTools()
				Humanoid:EquipTool(Item)
			end
		end
	end
end

function DestroyExitedItem(Player, Tool)
	local Backpack = Player:FindFirstChildOfClass("Backpack")
	local Items = Backpack:GetChildren()
	for k, v in pairs(Items) do
		if v.Name == Tool.Name then
			v:Destroy()
		end
	end
end

ActiveHotdogNpcTalk.OnServerEvent:Connect(GiveAndGetTool)
ActiveIceCreamNpcTalk.OnServerEvent:Connect(GiveAndGetTool)

ProximityPromptService.PromptTriggered:Connect(function(ProximityPrompt, player)
	if ProximityPrompt.Name == "ClubProximityPrompt" then
		ActiveClubNpcTalk:FireClient(player, ProximityPrompt)
		
	elseif ProximityPrompt.Name == "GameProximityPrompt" then
		ActiveGameNpcTalk:FireClient(player, ProximityPrompt)
	elseif ProximityPrompt.Name == "HotdogProximityPrompt" then
		ActiveHotdogNpcTalk:FireClient(player, player, ProximityPrompt)
	elseif ProximityPrompt.Name == "IceCreamProximityPrompt" then
		ActiveIceCreamNpcTalk:FireClient(player, ProximityPrompt)
	end
end)
