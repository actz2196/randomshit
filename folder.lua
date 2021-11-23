local lib = {
    FolderFrameVal = 0
}

function lib:increaseFolder()
    self.FolderFrameVal = self.FolderFrameVal + 20
end

function lib.Window()
    local ActzLib = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    ActzLib.Name = "ActzLib"
    ActzLib.Parent = game:GetService("CoreGui")
    ActzLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Frame.Parent = ActzLib
    Frame.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    Frame.Position = UDim2.new(0.00841750856, 0, 0.0380368084, 0)
    Frame.Size = UDim2.new(0, 136, 0, 237)
    local UIGridLayout = Instance.new("UIGridLayout")
    UIGridLayout.Parent = Frame
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
    UIGridLayout.CellSize = UDim2.new(1, 0, 0, 20)
    return {
        Button = function(textz, callback)
                local TextButton = Instance.new("TextButton")
                TextButton.Parent = Frame
                TextButton.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
                TextButton.Size = UDim2.new(0, 200, 0, 50)
                TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.TextSize = 14.000
                TextButton.Text = textz
                TextButton.MouseButton1Click:Connect(function()
                    pcall(callback)
                end)
        end,
        Folder = function(text)
            local Folder = Instance.new("TextButton")
            local FolderFrame = Instance.new("Frame")
            local UIGridLayout = Instance.new("UIGridLayout")
            local FolderFrameVal = Instance.new("IntValue")
            Folder.Name = "Folder"
            Folder.Parent = Frame
            Folder.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
            Folder.Size = UDim2.new(0, 200, 0, 50)
            Folder.Font = Enum.Font.SourceSans
            Folder.Text = text
            Folder.TextColor3 = Color3.fromRGB(255, 255, 255)
            Folder.TextSize = 14.000
            FolderFrameVal = 25
            local FolderFrameOpen = false
            FolderFrame.Name = "FolderFrame"
            FolderFrame.Parent = Folder
            FolderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            FolderFrame.BorderSizePixel = 0
            FolderFrame.Position = UDim2.new(0, 0, 1, 0)
            FolderFrame.Size = UDim2.new(0, 136, 0, 0)
            UIGridLayout.Parent = FolderFrame
            UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
            UIGridLayout.CellSize = UDim2.new(1, 0, 0, 20)
            Folder.MouseButton1Click:Connect(function()
                    FolderFrameOpen = not FolderFrameOpen
                    if FolderFrameOpen then
                        FolderFrame.Size = UDim2.new(0,136,0,FolderFrameVal)
                        for i,v in pairs(FolderFrame:GetChildren()) do
                            if v.ClassName ~= "UIGridLayout" then
                                v.Visible = true
                            end
                        end
                    else
                        FolderFrame.Size = UDim2.new(0,136,0,0)                        
                        for i,v in pairs(FolderFrame:GetChildren()) do
                            if v.ClassName ~= "UIGridLayout" then
                                v.Visible = false
                            end
                        end
                    end
            end)
            return {
                Button = function(textz,callback)
                     local TextButton = Instance.new("TextButton")
                    TextButton.Parent = FolderFrame
                    lib:increaseFolder()
                    TextButton.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
                    TextButton.Size = UDim2.new(0, 200, 0, 50)
                    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton.TextSize = 14.000
                    TextButton.Visible = false
                    TextButton.Text = textz
                    TextButton.MouseButton1Click:Connect(function()
                        pcall(callback)
                    end)
                end
            }
        end
    }
end

return lib
