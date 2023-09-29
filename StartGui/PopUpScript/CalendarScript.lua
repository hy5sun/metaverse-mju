local TabletPopUp = script.Parent
local Tablet = TabletPopUp:WaitForChild("Tablet")
local CalendarFrame = Tablet:WaitForChild("Calender")
local Calendar = CalendarFrame:WaitForChild("Calender")

local DetailSchedule = CalendarFrame:WaitForChild("DetailSchedule")
local SchduleTemp = DetailSchedule:WaitForChild("ScheduleTemp")
local Date = SchduleTemp:WaitForChild("Date")
local Schdule = SchduleTemp:WaitForChild("Schedule")
local DateText = Date:WaitForChild("TextLabel")
local ContentText = Schdule:WaitForChild("TextLabel")

local Month = Calendar:WaitForChild("Month")
local NextMonthButton = Month:WaitForChild("NextMonth")
local LastMonthButton = Month:WaitForChild("LastMonth")
local MonthText = Month:WaitForChild("Month")
local YearText = Month:WaitForChild("Year")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ModuleScripts = ReplicatedStorage:WaitForChild("ModuleScripts")
local ScheduleModule = require(ModuleScripts:WaitForChild("ScheduleModule"))

local Nov = Calendar:WaitForChild("Nov")
local Oct = Calendar:WaitForChild("Oct")
local Sep = Calendar:WaitForChild("Sep")
local Dec = Calendar:WaitForChild("Dec")

ScheduleData= ScheduleModule.ScheduleTable

local MonthStr = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}

-- 데이터 저장
function saveScheduleData()
	local Data = {}
	local MonthIdx = tonumber(string.sub(MonthText.Text, 1, 2))

	for k, v in pairs(ScheduleData) do
		local FirstLetter = string.sub(k, 1, 3)
		if FirstLetter == MonthStr[MonthIdx] then
			table.insert(Data, {k, v})
		end
	end

	local Picuture = Calendar:WaitForChild(MonthStr[MonthIdx])
	Picuture.Visible=true
	
	return Data
end

-- 데이터 조회
function getScheduleData(Data)
	-- 정렬
	table.sort(Data, function(a, b)
		return a[1] < b[1]
	end)

	DateText.Text = Data[1][2]["Date"]
	ContentText.Text = Data[1][2]["Content"]

	for i = 2, #Data do
		local CopyTempDate = Date:Clone()
		local CopyTempSch = Schdule:Clone()
		CopyTempDate.Parent = SchduleTemp
		CopyTempSch.Parent = SchduleTemp
		CopyTempDate.Name = "CopiedTempDate"
		CopyTempSch.Name = "CopiedTempSch"
		CopyTempDate.LayoutOrder = i * 2 + 1
		CopyTempSch.LayoutOrder = (i+1) * 2
		
		if Data[i][1] == "Sep1" then
			CopyTempSch.Size = UDim2.new(CopyTempSch.Size.X.Scale, CopyTempSch.Size.X.Offset, 0.08, CopyTempSch.Size.Y.Offset)
		end
		
		local DateText = CopyTempDate:WaitForChild("TextLabel")
		local ContentText = CopyTempSch:WaitForChild("TextLabel")

		DateText.Text = Data[i][2]["Date"]
		ContentText.Text = Data[i][2]["Content"]
	end
end

-- 9월 스케줄 저장 및 조회
Data = saveScheduleData()
getScheduleData(Data)

-- 다음 달 선택 (.은 따로 빼달라고 요청할 예정)
NextMonthButton.MouseButton1Click:Connect(function()
	Nov.Visible=false
	Oct.Visible=false
	Sep.Visible=false
	Dec.Visible=false

	local Year = tonumber(YearText.Text)
	local Month = tonumber(MonthText.Text)
	if Month == 12 then
		NextMonthButton.Selectable=false
		--end
		--if Month == 12 then
		--	YearText.Text = tostring(Year+1)

		--	MonthText.Text = "1"
	else
		NextMonthButton.Selectable=true
		if string.len(tostring(Month+1)) == 1 then
			MonthText.Text = "0" + tostring(Month+1)
		else
			MonthText.Text = tostring(Month+1)
		end
	end

	-- Clone한 일정표 삭제
	local TempChildren = SchduleTemp:GetChildren()
	for k, v in pairs(TempChildren) do
		if v.Name == "CopiedTempDate" or v.Name == "CopiedTempSch" then
			print(v)
			v:Destroy()
		end
	end

	-- 다음 달 데이터 저장 및 조회
	local Data = saveScheduleData()
	getScheduleData(Data)
end)

-- 이전 달 선택
LastMonthButton.MouseButton1Click:Connect(function()
	Nov.Visible=false
	Oct.Visible=false
	Sep.Visible=false
	Dec.Visible=false

	local Year = tonumber(YearText.Text)
	local Month = tonumber(MonthText.Text)
	if Month == 9 then
		NextMonthButton.Selectable=false
	elseif Month == 1 then
		YearText.Text = tostring(Year-1)
		MonthText.Text = "12"
	else
		NextMonthButton.Selectable=true
		if string.len(tostring(Month-1)) == 1 then
			MonthText.Text = string.format("0%s",tostring(Month-1))
		else
			MonthText.Text = tostring(Month-1)
		end
	end

	-- Clone한 일정표 삭제
	local TempChildren = SchduleTemp:GetChildren()
	for k, v in pairs(TempChildren) do
		if v.Name == "CopiedTempDate" or v.Name == "CopiedTempSch" then
			print(v)
			v:Destroy()
		end
	end

	-- 이전 달 데이터 저장 및 조회
	Data = saveScheduleData()
	getScheduleData(Data)
end)
