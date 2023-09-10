-- 다른 팝업
local StartGui = game:GetService("StarterGui")
local PopUpScreen = script.Parent

local CalenderPopup = PopUpScreen:WaitForChild("CalenderPopup")
local ProfilePopUp = PopUpScreen:WaitForChild("Profile")
local ClubPopup = PopUpScreen:WaitForChild("ClubPopup")
local NpcChatWindow = PopUpScreen:WaitForChild("NpcChatWindow")

-- 메인 메뉴 화면
local MobilePopUp = PopUpScreen:WaitForChild("MobilePopUp")
local PopUpScreenCenter = MobilePopUp:WaitForChild("Center")
local MobileMenu = PopUpScreenCenter:WaitForChild("MobileMenu")
local FriendsButton = MobileMenu:WaitForChild("Friends")
local MapButton = MobileMenu:WaitForChild("Map")
local MenuButton = MobileMenu:WaitForChild("Menu")
local ProfileButton = MobileMenu:WaitForChild("Profile")
local RoleChangeButton = MobileMenu:WaitForChild("RoleChange")
local ScheduleButton = MobileMenu:WaitForChild("Schedule")
local ExitButton = PopUpScreenCenter:WaitForChild("Exit")

ScheduleButton.Activated:Connect(function()
	CalenderPopup.Visible=true
	MobilePopUp.Visible=false
end)

ProfileButton.Activated:Connect(function()
	ProfilePopUp.Visible=true
	MobilePopUp.Visible=false
end)

ExitButton.Activated:Connect(function()
	MobilePopUp.Visible=false
end)

-- 캘린더
local CalenderCenter = CalenderPopup:WaitForChild("Center")
local ExitButton = CalenderCenter:WaitForChild("Exit")
local BackButton = CalenderCenter:WaitForChild("Back")

BackButton.Activated:Connect(function()
	MobilePopUp.Visible=true
	CalenderPopup.Visible=false
end)

ExitButton.Activated:Connect(function()
	CalenderPopup.Visible=false
end)

-- 프로필
local ProfileCenter = ProfilePopUp:WaitForChild("Center")
local BackButton = ProfileCenter:WaitForChild("Back")
local ExitButton = ProfileCenter:WaitForChild("Exit")

BackButton.Activated:Connect(function()
	MobilePopUp.Visible=true
	ProfilePopUp.Visible=false
end)

ExitButton.Activated:Connect(function()
	ProfilePopUp.Visible-=false
end)