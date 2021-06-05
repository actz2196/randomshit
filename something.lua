local lib = {}

function lib:IncreaseSize(what,pixelsize)
	what.Size = what.Size + UDim2.new(0,0,0,pixelsize)
end

function lib:CreateWindow()
	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.Position = UDim2.new(0.0159010608, 0, 0.0190703217, 0)
	Frame.Size = UDim2.new(0, 211,0, 0)
	local UIGridLayout = Instance.new("UIGridLayout")
	UIGridLayout.Parent = Frame
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
	UIGridLayout.CellSize = UDim2.new(1, 0, 0, 30)
	return Frame
end

function lib:CreateFolder(window)
	lib:IncreaseSize(window,30)
	local TextButton = Instance.new("TextButton")
	local Frame = Instance.new("Frame")
	TextButton.Parent = window
	TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.Size = UDim2.new(0, 200, 0, 50)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.TextSize = 14.000
	Frame.Parent = TextButton
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0, 0, 1, 0)
	Frame.Size = UDim2.new(0, 211, 0, 0)
	local open = false
	TextButton.MouseButton1Click:Connect(function()
		open = not open
		if open == true then
			for i,v in pairs(Frame:GetChildren()) do
				if v.ClassName ~= "UIGridLayout" then
					lib:IncreaseSize(window,30)
					v.Visible = true
				end
			end
		else
			Frame.Size = UDim2.new(0, 211, 0, 0)
			for i,v in pairs(Frame:GetChildren()) do
				if v.ClassName ~= "UIGridLayout" then
					v.Visible = false
				end
			end
		end
	end)
	local UIGridLayout = Instance.new("UIGridLayout")
	UIGridLayout.Parent = Frame
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
	UIGridLayout.CellSize = UDim2.new(1, 0, 0, 30)
	return Frame
end

function lib:CreateButton(window,func)
	lib:IncreaseSize(window,30)
	local TextButton = Instance.new("TextButton")
	TextButton.Parent = window
	TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.Size = UDim2.new(0, 200, 0, 50)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.TextSize = 14.000
	TextButton.MouseButton1Click:Connect(func)
end

return lib
