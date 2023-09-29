local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character:WaitForChild("Humanoid")

local MainGuiScreen = script.Parent
local Run = MainGuiScreen:WaitForChild("Run")
local RunButton = Run:WaitForChild("Run")

function CantMove()
	local humanoid = workspace:WaitForChild(Player.Name):WaitForChild("Humanoid")
	humanoid.WalkSpeed=0
	humanoid.JumpHeight=0
end

-- 달리기
RunButton.Activated:Connect(function()
	if Humanoid then
		Humanoid.WalkSpeed = 25
	end
end)

-- 팝업 띄우기
local PlayerGui = MainGuiScreen.Parent
local PopUpScreen = PlayerGui:WaitForChild("PopUpScreen")
local TabletPopup = PopUpScreen:WaitForChild("TabletPopup")
local TabletFrame = TabletPopup:WaitForChild("Tablet")
local MobileFrame = TabletFrame:WaitForChild("Mobile")

local Mobile = MainGuiScreen:WaitForChild("Mobile")
local MobileButton = Mobile:WaitForChild("Mobile")

MobileButton.MouseButton1Click:Connect(function()
	TabletPopup.Visible=true
	MobileFrame.Visible=true
	CantMove()
end)
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character:WaitForChild("Humanoid")

local MainGuiScreen = script.Parent
local Run = MainGuiScreen:WaitForChild("Run")
local RunButton = Run:WaitForChild("Run")

function CantMove()
	local humanoid = workspace:WaitForChild(Player.Name):WaitForChild("Humanoid")
	humanoid.WalkSpeed=0
	humanoid.JumpHeight=0
end

-- 달리기
RunButton.Activated:Connect(function()
	if Humanoid then
		Humanoid.WalkSpeed = 25
	end
end)

-- 팝업 띄우기
local PlayerGui = MainGuiScreen.Parent
local PopUpScreen = PlayerGui:WaitForChild("PopUpScreen")
local TabletPopup = PopUpScreen:WaitForChild("TabletPopup")
local TabletFrame = TabletPopup:WaitForChild("Tablet")
local MobileFrame = TabletFrame:WaitForChild("Mobile")

local Mobile = MainGuiScreen:WaitForChild("Mobile")
local MobileButton = Mobile:WaitForChild("Mobile")

MobileButton.MouseButton1Click:Connect(function()
	TabletPopup.Visible=true
	MobileFrame.Visible=true
	CantMove()
end)
