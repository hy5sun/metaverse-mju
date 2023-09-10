local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EventFolder = ReplicatedStorage:WaitForChild("Events")
local ServerToClient = EventFolder:WaitForChild("ServerToClient")
local ActiveNpcTalk = ServerToClient:WaitForChild("ActiveNpcTalk")
local NpcTalkGui = script.Parent
local NpcTalkFrame = NpcTalkGui:WaitForChild("NpcTalkFrame")
local DescriptionFrame = NpcTalkFrame:WaitForChild("DescriptionFrame")
local TextButton = DescriptionFrame:WaitForChild("TextButton")
local CurrentIndex = 0
local TextTable = {
[1] = "대사1",
[2] = "대사2",
[3] = "대사3",
[4] = "대사4"
}

ActiveNpcTalk.OnClientEvent:Connect(function(ProximityPrompt)
print("Proximity Prompt Event in", script.Name)
CurrentIndex = 1
TextButton.Text = TextTable[CurrentIndex]
NpcTalkGui.Enabled = true
end)

TextButton.MouseButton1Click:Connect(function()
if CurrentIndex < #TextTable then
CurrentIndex += 1
TextButton.Text = TextTable[CurrentIndex]
else
NpcTalkGui.Enabled = false
end
end)
