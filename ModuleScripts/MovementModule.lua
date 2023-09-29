local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character:WaitForChild("Humanoid")

local MovementModule = {}

function MovementModule.ActivateMovement(Param)
	print("ModuleScript Function", Param)
	if Param then
		Humanoid.WalkSpeed = 14
		Humanoid.JumpHeight = 7.2
	else
		Humanoid.WalkSpeed = 0
		Humanoid.JumpHeight = 0
	end
end

return MovementModule