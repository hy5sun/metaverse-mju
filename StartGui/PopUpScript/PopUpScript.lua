local TabletPopup = script.Parent
local TabletFrame = TabletPopup:WaitForChild("Tablet")
local CalendarFrame = TabletFrame:WaitForChild("Calender")
local MobileFrame = TabletFrame:WaitForChild("Mobile")

local MobileMenu = MobileFrame:WaitForChild("MobileMenu")
local ScheduleButton = MobileMenu:WaitForChild("Schedule")

local ExitButton = TabletFrame:WaitForChild("Exit")
local BackButton = TabletFrame:WaitForChild("Back")

local Players = game:GetService("Players")
local Player = Players:FindFirstChildOfClass("Player")

function Move()
	local humanoid = workspace:WaitForChild(Player.Name):WaitForChild("Humanoid")
	humanoid.WalkSpeed=50
	humanoid.JumpHeight=7.2
end

if MobileMenu.Visible == true then
	BackButton.Visible = false
end

ScheduleButton.MouseButton1Click:Connect(function()
	CalendarFrame.Visible=true
	MobileFrame.Visible=false
	BackButton.Visible = true
end)

ExitButton.MouseButton1Click:Connect(function()
	TabletPopup.Visible=false
	CalendarFrame.Visible=false
	Move()
end)

BackButton.MouseButton1Click:Connect(function()
	if CalendarFrame.Visible == true then
		CalendarFrame.Visible=false
		MobileFrame.Visible=true
		BackButton.Visible = false
	end

end)