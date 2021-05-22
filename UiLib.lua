repeat wait() until game:IsLoaded()

local library = {}
do
	if game:GetService("CoreGui"):FindFirstChild("Krnl Hub") then
		game:GetService("CoreGui"):FindFirstChild("Krnl Hub"):Destroy()
	end
	getgenv().hideOpts = false

	local uis = game:GetService("UserInputService")

	local uiShit = {
		initialized = false;
		toggle = true;
	}

	local function create (obj, properties)
		obj = Instance.new(obj)
		for i, v in pairs(properties) do
			if i ~= "Parent" then
				obj[i] = v
			end
		end
		obj.Parent = properties["Parent"]
		return obj
	end

	library.uis = {}
	local initialized = false

	function library:KRNL_0bebcb447a7726(hideOptions)
		local data = {
			["count"] = 1,
			["debounce"] = false,
			["shown"] = nil,
			["cats"] = {},
			["catbttns"] = {},
		}
		local ui = create("ScreenGui",{
			["Name"] = "Krnl Hub",
			["Parent"] = pcall(function()return game:GetService('CoreGui'):FindFirstChildOfClass('ScreenGui')end) and game:GetService("CoreGui") or game:GetService('Players').LocalPlayer.PlayerGui,
		})
		table.insert(library.uis, data)
		if hideOptions then
			initialized = true
			getgenv().hideOpts = true
		elseif not initialized then
			intialized = true
			spawn(function()
				local count = #library.uis
				wait(1)
				while count ~= #library.uis do
					wait(1)
					count = #library.uis
				end
				-- _G.library = library
				-- loadstring(game:HttpGet('https://raw.githubusercontent.com/LaziestBoy/Krnl-Hub/master/Krnl-Hub-Utilities.lua', true))()
			end)
		end
		spawn(function()
			local toggleController = false
			if not uiShit.initialized then
				uiShit.initialized = true
				toggleController = true
				game:GetService('StarterGui'):SetCore('SendNotification', {
					Title = 'Krnl Hub Loaded!';
					Text = 'Press Right Shift to toggle UI'
				})
			end
			uis.InputBegan:connect(function(key, processed)
				if not processed then
					if key.KeyCode == Enum.KeyCode.RightShift then
						if toggleController then
							uiShit.toggle = not uiShit.toggle
						end
						ui.Enabled = uiShit.toggle
					end
				end
			end)
		end)
		local main = create("Frame",{
			["Name"] = "Main",
			["Parent"] = ui,
			["BackgroundTransparency"] = 1,
			["Position"] = UDim2.new(0,10,0,10),
			["Size"] = UDim2.new(0,200,0,355),
		})
		local top = create("Frame",{
			["Name"] = "Top",
			["Parent"] = main,
			["BackgroundColor3"] = Color3.new(.0980392,.0980392,.0980392),
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0,200,0,30),
		})
		local title = create("TextLabel",{
			["Name"] = "Title",
			["Parent"] = top,
			["BackgroundTransparency"] = 1,
			["Position"] = UDim2.new(0,7,0,0),
			["Size"] = UDim2.new(.800000012,0,1,0),
			["Font"] = Enum.Font.GothamSemibold,
			["Text"] = "Krnl Hub",
			["TextColor3"] = Color3.new(1,1,1),
			["TextSize"] = 20,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
		})
		local size = create("TextButton",{
			["Name"] = "Size",
			["Parent"] = top,
			["BackgroundColor3"] = Color3.new(1,1,1),
			["BackgroundTransparency"] = 1,
			["Position"] = UDim2.new(.800000012,0,0,0),
			["Size"] = UDim2.new(0,40,0,30),
			["Font"] = Enum.Font.GothamBold,
			["Text"] = "-",
			["TextColor3"] = Color3.new(1,1,1),
			["TextSize"] = 25,
		})
		local boreder = create("TextLabel",{
			["Name"] = "Border",
			["Parent"] = top,
			["BackgroundColor3"] = Color3.new(1,0,.0156863),
			["BorderSizePixel"] = 0,
			["Position"] = UDim2.new(0,0,1,-2),
			["Size"] = UDim2.new(0,200,0,2),
			["Text"] = "",
		})
		local mainhitbox = create("Frame",{
			["Name"] = "Hitbox",
			["Parent"] = top,
			["BackgroundTransparency"] = 1,
			["ClipsDescendants"] = true,
			["Position"] = UDim2.new(0,0,1,0),
			["Size"] = UDim2.new(0,200,0,0),
		})
		local catergories = create("Frame",{
			["Name"] = "Catergories",
			["Parent"] = mainhitbox,
			["BackgroundColor3"] = Color3.new(.0980392,.0980392,.0980392),
			["BorderColor3"] = Color3.new(.105882,.164706,.207843),
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0,200,0,0),
	})
		function data:KRNL_iliIiI11111Il1l(title, defaultcolor, callback)
			local background = create("Frame",{
				["Name"] = "Color Picker",
				["Parent"] = ui,
				["BackgroundColor3"] = Color3.new(.0980392,.0980392,.0980392),
				["BorderSizePixel"] = 0,
				["Position"] = UDim2.new(.5,0,.5,0),
				["Size"] = UDim2.new(0,420,0,197),
				["AnchorPoint"] = Vector2.new(.5,.5)
			})
			local colors = create("ImageLabel",{
				["Name"] = "Colors",
				["Parent"] = background,
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(0,15,0,35),
				["Size"] = UDim2.new(0,300,0,150),
				["Image"] = "rbxassetid://328298876",
			})
			local picker = create("ImageLabel",{
				["Name"] = "Picker",
				["Parent"] = colors,
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(0,295,0,145),
				["Size"] = UDim2.new(0,10,0,10),
				["Image"] = "rbxassetid://244221613",
				["ImageColor3"] = Color3.new(0,0,0),
			})
			local output = create("Frame",{
				["Name"] = "Output",
				["Parent"] = background,
				["BackgroundColor3"] = Color3.new(1,1,1),
				["BorderSizePixel"] = 0,
				["Position"] = UDim2.new(0,345,0,35),
				["Size"] = UDim2.new(0,60,0,60),
			})
			local value = create("ImageLabel",{
				["Name"] = "Value",
				["Parent"] = background,
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(0,326,0,35),
				["Size"] = UDim2.new(0,8,0,150),
				["Image"] = "rbxassetid://245854775",
			})
			local picker2 = create("ImageLabel",{
				["Name"] = "Picker",
				["Parent"] = value,
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(0,-1,0,-5),
				["Size"] = UDim2.new(0,10,0,10),
				["Image"] = "rbxassetid://244221613",
				["ImageColor3"] = Color3.new(0,0,0),
			})
			local r = create("TextBox",{
				["Name"] = "R",
				["Parent"] = background,
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(0,371,0,105),
				["Size"] = UDim2.new(0,25,0,25),
				["Font"] = Enum.Font.GothamSemibold,
				["PlaceholderText"] = "R",
				["Text"] = "255",
				["TextColor3"] = Color3.new(1,1,1),
				["TextSize"] = 14,
			})
			local rdescription = create("TextLabel",{
				["Name"] = "Description",
				["Parent"] = r,
				["BackgroundColor3"] = Color3.new(1, 1, 1),
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(-1, 0, 0, 0),
				["Size"] = UDim2.new(0, 25, 0, 25),
				["Font"] = Enum.Font.GothamBold,
				["Text"] = "R:",
				["TextColor3"] = Color3.new(1, 1, 1),
				["TextSize"] = 14,
			})
			local g = create("TextBox",{
				["Name"] = "G",
				["Parent"] = background,
				["BackgroundColor3"] = Color3.new(1, 1, 1),
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(0, 371, 0, 135),
				["Size"] = UDim2.new(0, 25, 0, 25),
				["Font"] = Enum.Font.GothamSemibold,
				["PlaceholderText"] = "G",
				["Text"] = "255",
				["TextColor3"] = Color3.new(1, 1, 1),
				["TextSize"] = 14,
			})
			local gdescription = create("TextLabel",{
				["Name"] = "Description",
				["Parent"] = g,
				["BackgroundColor3"] = Color3.new(1, 1, 1),
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(-1, 0, 0, 0),
				["Size"] = UDim2.new(0, 25, 0, 25),
				["Font"] = Enum.Font.GothamBold,
				["Text"] = "G:",
				["TextColor3"] = Color3.new(1, 1, 1),
				["TextSize"] = 14,
			})
			local b = create("TextBox",{
				["Name"] = "B",
				["Parent"] = background,
				["BackgroundColor3"] = Color3.new(1, 1, 1),
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(0, 371, 0, 165),
				["Size"] = UDim2.new(0, 25, 0, 25),
				["Font"] = Enum.Font.GothamSemibold,
				["PlaceholderText"] = "B",
				["Text"] = "255",
				["TextColor3"] = Color3.new(1, 1, 1),
				["TextSize"] = 14,
			})
			local bdescription = create("TextLabel",{
				["Name"] = "Description",
				["Parent"] = b,
				["BackgroundColor3"] = Color3.new(1, 1, 1),
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(-1, 0, 0, 0),
				["Size"] = UDim2.new(0, 25, 0, 25),
				["Font"] = Enum.Font.GothamBold,
				["Text"] = "B:",
				["TextColor3"] = Color3.new(1, 1, 1),
				["TextSize"] = 14,
			})
			local title = create("TextLabel",{
				["Name"] = "Title",
				["Parent"] = background,
				["BackgroundColor3"] = Color3.new(1, 1, 1),
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(0.0190476198, 0, 0, 0),
				["Size"] = UDim2.new(0, 410, 0, 25),
				["Font"] = Enum.Font.GothamSemibold,
				["Text"] = title,
				["TextColor3"] = Color3.new(1, 1, 1),
				["TextSize"] = 14,
				["TextXAlignment"] = Enum.TextXAlignment.Left,
			})
			local border = create("Frame",{
				["Parent"] = title,
				["BackgroundColor3"] = Color3.new(1, 0, 0),
				["BorderSizePixel"] = 0,
				["Position"] = UDim2.new(0, -8, 0, 23),
				["Size"] = UDim2.new(0, 420, 0, 2),
			})
			local done = create("TextButton",{
				["Name"] = "Done",
				["Parent"] = background,
				["BackgroundColor3"] = Color3.new(0.137255, 0.137255, 0.137255),
				["BorderSizePixel"] = 0,
				["Position"] = UDim2.new(0.823809505, 0, 0.0253807101, 0),
				["Size"] = UDim2.new(0, 59, 0, 15),
				["Font"] = Enum.Font.GothamSemibold,
				["Text"] = "Done",
				["TextColor3"] = Color3.new(1, 1, 1),
				["TextSize"] = 14,
			})
			if defaultcolor == nil then
				defaultcolor = Color3.new(1,1,1)
			end
			local h,s,v = Color3.toHSV(defaultcolor)
			local h2,s2,v2
			output.BackgroundColor3 = defaultcolor
			wait(1)
			local dragging,dragging2
			do
				local origin,origin2,delta
				picker.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
						origin = picker.Position
						origin2 = input.Position
					end
				end)
				
				uis.InputEnded:Connect(function(input)
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
				
				uis.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
						delta = input.Position - origin2
						picker.Position = UDim2.new(0,math.clamp(origin.X.Offset+delta.X, -5, 295),0,math.clamp(origin.Y.Offset+delta.Y, -5, 145))
						
						h = (295-picker.Position.X.Offset)/295
						s = (145-picker.Position.Y.Offset)/145
						
						output.BackgroundColor3 = Color3.fromHSV(h,s,v)
						background.R.Text = math.clamp(math.floor(output.BackgroundColor3.R*255),0,255)
						background.G.Text = math.clamp(math.floor(output.BackgroundColor3.G*255),0,255)
						background.B.Text = math.clamp(math.floor(output.BackgroundColor3.B*255),0,255)
					end
				end)
			end
			do
				local origin,origin2,delta
				picker2.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging2 = true
						origin = picker2.Position
						origin2 = input.Position
					end
				end)
				
				uis.InputEnded:Connect(function(input)
					if input.UserInputState == Enum.UserInputState.End then
						dragging2 = false
					end
				end)
				
				uis.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement and dragging2 then
						delta = input.Position - origin2
						picker2.Position = UDim2.new(0,-1,0,math.clamp(origin.Y.Offset+delta.Y, -5, 145))
						
						v = (145-picker2.Position.Y.Offset)/145
						
						output.BackgroundColor3 = Color3.fromHSV(h,s,v)
						background.R.Text = math.clamp(math.floor(output.BackgroundColor3.R*255),0,255)
						background.G.Text = math.clamp(math.floor(output.BackgroundColor3.G*255),0,255)
						background.B.Text = math.clamp(math.floor(output.BackgroundColor3.B*255),0,255)
					end
				end)
			end
			do
				r.FocusLost:Connect(function()
					r.Text = math.floor(math.clamp(tonumber(r.Text),0,255)+.49)
					h,s,v = Color3.toHSV(Color3.fromRGB(r.Text,g.Text,b.Text))
					output.BackgroundColor3 = Color3.fromHSV(h,s,v)
					h2,s2,v2 = Color3.toHSV(output.BackgroundColor3)
					picker.Position = UDim2.new(0,(h2*-300)+295,0,(s2*-140)+145)
					picker2.Position = UDim2.new(0,-1,0,(v2*-150)+145)
				end)
				g.FocusLost:Connect(function()
					g.Text = math.floor(math.clamp(tonumber(g.Text),0,255)+.49)
					h,s,v = Color3.toHSV(Color3.fromRGB(r.Text,g.Text,b.Text))
					output.BackgroundColor3 = Color3.fromHSV(h,s,v)
					h2,s2,v2 = Color3.toHSV(output.BackgroundColor3)
					picker.Position = UDim2.new(0,(h2*-300)+295,0,(s2*-140)+145)
					picker2.Position = UDim2.new(0,-1,0,(v2*-150)+145)
				end)
				b.FocusLost:Connect(function()
					b.Text = math.floor(math.clamp(tonumber(b.Text),0,255)+.49)
					h,s,v = Color3.toHSV(Color3.fromRGB(r.Text,g.Text,b.Text))
					output.BackgroundColor3 = Color3.fromHSV(h,s,v)
					h2,s2,v2 = Color3.toHSV(output.BackgroundColor3)
					picker.Position = UDim2.new(0,(h2*-300)+295,0,(s2*-140)+145)
					picker2.Position = UDim2.new(0,-1,0,(v2*-150)+145)
				end)
			end
			colors.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					picker.Position = UDim2.new(0,mouse.X-553,0,mouse.Y-370)
					dragging = true
					h = (295-picker.Position.X.Offset)/295
					s = (145-picker.Position.Y.Offset)/145
					
					output.BackgroundColor3 = Color3.fromHSV(h,s,v)
					background.R.Text = math.clamp(math.floor(output.BackgroundColor3.R*255),0,255)
					background.G.Text = math.clamp(math.floor(output.BackgroundColor3.G*255),0,255)
					background.B.Text = math.clamp(math.floor(output.BackgroundColor3.B*255),0,255)
				end
			end)
			value.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					picker2.Position = UDim2.new(0,-1,0,mouse.Y-370)
					dragging2 = true
					v = (145-picker2.Position.Y.Offset)/145
					
					output.BackgroundColor3 = Color3.fromHSV(h,s,v)
					background.R.Text = math.clamp(math.floor(output.BackgroundColor3.R*255),0,255)
					background.G.Text = math.clamp(math.floor(output.BackgroundColor3.G*255),0,255)
					background.B.Text = math.clamp(math.floor(output.BackgroundColor3.B*255),0,255)
				end
			end)
			done.MouseButton1Click:Connect(function()
				local color = output.BackgroundColor3
				callback(math.ceil(255*color.r-.49),math.ceil(255*color.g-.49),math.ceil(255*color.b-.49))
				background.Visible = false
				background:Destroy()
			end)
		end
		local shareddata = {}
		do
			top.InputBegan:connect(function(key)
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				local mb1 = Enum.UserInputType.MouseButton1
				local m = {
					x = 0;
					y = 0;
				}
				if key.UserInputType == mb1 then
					local as = main.AbsolutePosition
					local pos = Vector2.new(mouse.X-as.X,mouse.Y-as.Y)
					while game:GetService("RunService").Heartbeat:wait() and game:GetService("UserInputService"):IsMouseButtonPressed(mb1) do
						local obj = {
							mouse.X-pos.X,
							main.Size.X.Offset*main.AnchorPoint.X,
							mouse.Y-pos.Y,
							main.Size.Y.Offset*main.AnchorPoint.Y
						}
						if m.X ~= mouse.X or m.Y ~= mouse.Y then
							main:TweenPosition(UDim2.new(0,obj[1]+obj[2],0,obj[3]+obj[4]),"Out","Quad",.2,true)
						end
						m.X = mouse.X
						m.Y = mouse.Y
					end
				end
			end)
			
			local toggled,debounce = false,false
			size.MouseButton1Click:Connect(function()
				if not debounce then
					if toggled then
						debounce = true
						toggled = false
						if data.shown then
							for i, v in pairs(top:GetChildren()) do
								if v.Name == data.shown.Parent.Name then
									for j, k in pairs(v.Functions:GetChildren()) do
										if k.Name == "Dropdown" then
											if k.Hitbox.List.Visible then
												shareddata:ClearDrop()
												k.Display.Font = Enum.Font.GothamSemibold
												k.Display.Text = "+"
												k.Hitbox.List:TweenPosition(UDim2.new(0,0,-1,0))
												wait(1)
												k.Hitbox.List.Visible = false
											end
										end
									end
								end
							end
							data.catbttns[data.shown.Title.Text]["Catergory Description"].Font = Enum.Font.GothamSemibold
							data.catbttns[data.shown.Title.Text]["Catergory Description"].Text = "+"
							data.shown.Parent:TweenSize(UDim2.new(0,210,0,29),nil,nil,.5)
							wait(.5)
							data.shown:TweenPosition(UDim2.new(0,-200,0,0),nil,nil,.5)
							wait(.5)
							data.shown.Visible = false
							data.shown = nil
						end
						size.Font = Enum.Font.GothamSemibold
						size.Text = "+"
						catergories:TweenPosition(UDim2.new(0,0,-1,0),nil,nil,.5)
						wait(.5)
						catergories.Visible = false
						debounce = false
					else
						debounce = true
						toggled = true
						catergories.Visible = true
						size.Font = Enum.Font.GothamBold
						size.Text = "-"
						catergories:TweenPosition(UDim2.new(0,0,0,0),nil,nil,.5)
						wait(.5)
						debounce = false
					end
				end
			end)
		end
		
		local functions = {}
		local f = {}
		function data:KRNL_1d7cf31a6a3640(name)
			local categorybutton = create("TextButton",{
				["Name"] = name,
				["Parent"] = catergories,
				["BackgroundColor3"] = Color3.new(.176471,.176471,.176471),
				["BorderSizePixel"] = 0,
				["Position"] = UDim2.new(0,10,0,(data.count-1)*35+10),
				["Size"] = UDim2.new(0, 180, 0, 30),
				["Font"] = Enum.Font.GothamSemibold,
				["TextSize"] = 14,
				["Text"] = "  " .. name,
				["TextColor3"]= Color3.new(1, 1, 1),
				["TextXAlignment"] = Enum.TextXAlignment.Left,
			})
			local catdesc = create("TextLabel",{
				["Name"] = "Catergory Description",
				["Parent"] = categorybutton,
				["BackgroundColor3"] = Color3.new(1,1,1),
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(0.833333313,0,0,0),
				["Size"] = UDim2.new(0,30,0,30),
				["Font"] = Enum.Font.GothamSemibold,
				["Text"] = "+",
				["TextColor3"] = Color3.new(1,1,1),
				["TextSize"] = 25,
			})
			local cathitbox = create("Frame",{
				["Name"] = name,
				["Parent"] = top,
				["BackgroundColor3"] = Color3.new(1,1,1),
				["BackgroundTransparency"] = 1,
				["ClipsDescendants"] = true,
				["Position"] = UDim2.new(.949999988,10,1,0),
				["Size"] = UDim2.new(0,210,0,29),
			})
			local category = create("Frame",{
				["Name"] = "Functions",
				["Parent"] = cathitbox,
				["BackgroundColor3"] = Color3.new(.0980392,.0980392,.0980392),
				["BorderSizePixel"] = 0,
				["Position"] = UDim2.new(0,-200,0,0),
				["Size"] = UDim2.new(0,200,0,29),
				["Visible"] = false
			})
			local title = create("TextLabel",{
				["Name"] = "Title",
				["Parent"] = category,
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(0,5,0,0),
				["Size"] = UDim2.new(0,195,0,29),
				["Font"] = Enum.Font.GothamSemibold,
				["Text"] = name,
				["TextColor3"] = Color3.new(1,1,1),
				["TextSize"] = 20,
				["TextXAlignment"] = Enum.TextXAlignment.Left,
			})
			local border = create("TextLabel",{
				["Name"] = "Border",
				["Parent"] = title,
				["BackgroundColor3"] = Color3.new(1,0,.0156863),
				["BorderSizePixel"] = 0,
				["Position"] = UDim2.new(-.026,0,1,-2),
				["Size"] = UDim2.new(0,200,0,2),
				["Text"] = "",
				["TextColor3"] = Color3.new(0,0,0),
			})

			local functions = {['count']=4,['showndrop']=nil}
			table.insert(f, functions)

			data.catbttns[name] = categorybutton
			categorybutton.MouseButton1Click:Connect(function()
				if not data.debounce then
					category.ClipsDescendants = true
					if data.shown == category then
						data.debounce = true
						data.shown = nil
						if functions.showndrop then
							functions.showndrop.Display.Font = Enum.Font.GothamSemibold
							functions.showndrop.Display.Text = "+"
							functions.showndrop.Hitbox.List:TweenPosition(UDim2.new(0,0,-1,0))
							wait(1)
							functions.showndrop.Hitbox.List.Visible = false
							functions.showndrop = nil
						end
						catdesc.Font = Enum.Font.GothamSemibold
						catdesc.Text = "+"
						category.Parent.Size = UDim2.new(0,210,0,category.Size.Y.Offset)
						category.Parent:TweenSize(UDim2.new(0,210,0,29),nil,nil,.2)
						category:TweenSize(UDim2.new(0,200,0,29),nil,nil,.2)
						wait(.2)
						category:TweenPosition(UDim2.new(0,-200,0,0),nil,nil,.2)
						wait(.2)
						category.Visible = false
						data.debounce = false
					else
						data.debounce = true
						if data.shown then
							data.catbttns[data.shown.Title.Text]["Catergory Description"].Font = Enum.Font.GothamSemibold
							data.catbttns[data.shown.Title.Text]["Catergory Description"].Text = "+"
							data.shown.Parent.Size = UDim2.new(0,210,0,data.shown.Size.Y.Offset)
							data.shown.Parent:TweenSize(UDim2.new(0,210,0,29),nil,nil,.2)
							wait(.2)
							data.shown:TweenPosition(UDim2.new(0,-200,0,0),nil,nil,.2)
							wait(.2)
							data.shown.Visible = false
						end
						data.shown = category
						category.Visible = true
						catdesc.Font = Enum.Font.GothamBold
						catdesc.Text = "-"
						category:TweenPosition(UDim2.new(0,10,0,0),nil,nil,.2)
						wait(.2)
						category.Parent:TweenSize(UDim2.new(0,210,0,1000),nil,nil,.2)
						category:TweenSize(UDim2.new(0,200,0,functions.count+40),nil,nil,.2)
						wait(.2)
						category.Parent.Size = UDim2.new(0,210,0,1000)
						data.debounce = false
					end
					category.ClipsDescendants = false
				end
			end)
			
			mainhitbox.Size = UDim2.new(0,200,0,data.count*35+16)
			catergories.Size = UDim2.new(0,200,0,data.count*35+16)
			data.count = data.count + 1
			
			function functions:KRNL_cbb5ee2a24cf34(text,toggled,callback)
				local button
				if toggled then
					button = create("TextButton",{
						["Name"] = text,
						["Parent"] = category,
						["BackgroundColor3"] = Color3.new(1,1,1),
						["BackgroundTransparency"] = 1,
						["Position"] = UDim2.new(0,147,0,functions.count+30),
						["Size"] = UDim2.new(0,40,0,30),
						["Font"] = Enum.Font.GothamSemibold,
						["Text"] = "ON",
						["TextColor3"] = Color3.new(0,1,0),
						["TextSize"] = 14,
					})
				else
					button = create("TextButton",{
						["Name"] = text,
						["Parent"] = category,
						["BackgroundColor3"] = Color3.new(1,1,1),
						["BackgroundTransparency"] = 1,
						["Position"] = UDim2.new(0,147,0,functions.count+30),
						["Size"] = UDim2.new(0,40,0,30),
						["Font"] = Enum.Font.GothamSemibold,
						["Text"] = "OFF",
						["TextColor3"] = Color3.new(1,0,0),
						["TextSize"] = 14,
					})
				end
				local description = create("TextLabel",{
					["Name"] = "Description",
					["Parent"] = button,
					["BackgroundColor3"] = Color3.new(1,1,1),
					["BackgroundTransparency"] = 1,
					["Position"] = UDim2.new(-3.375,0,0,0),
					["Size"] = UDim2.new(0,135,0,30),
					["Font"] = Enum.Font.GothamSemibold,
					["Text"] = text,
					["TextColor3"] = Color3.new(1,1,1),
					["TextSize"] = 14,
					["TextXAlignment"] = Enum.TextXAlignment.Left,
				})
				button.MouseButton1Click:Connect(function()
					if toggled then
						toggled = false
						button.Text = "OFF"
						button.TextColor3 = Color3.new(1,0,0)
						callback(false)
					else
						toggled = true
						button.Text = "ON"
						button.TextColor3 = Color3.new(0,1,0)
						callback(true)
					end
				end)
				
				category.Size = UDim2.new(0,200,0,functions.count+70)
				functions.count = functions.count + 30
				return button
			end
			
			function functions:KRNL_0234a044e17801(text, callback)
				local button = create("TextButton",{
					["Name"] = text,
					["Parent"] = category,
					["BackgroundColor3"] = Color3.new(.137255,.137255,.137255),
					["BorderSizePixel"] = 0,
					["Position"] = UDim2.new(0,12.5,0,functions.count+35),
					["Size"] = UDim2.new(0,175,0,30),
					["Font"] = Enum.Font.GothamSemibold,
					["Text"] = text,
					["TextColor3"] = Color3.new(1,1,1),
					["TextSize"] = 14,
				})
				
				button.MouseButton1Click:Connect(callback)
				category.Size = UDim2.new(0,200,0,functions.count+75)
				functions.count = functions.count + 35
				return button
			end
			
			function functions:KRNL_2478d3ef4c426a(text, color)
				if color == nil then
					color = Color3.new(1,1,1)
				end
				local label = create("TextLabel",{
					["Parent"] = category,
					["BackgroundColor3"] = Color3.new(1,1,1),
					["BackgroundTransparency"] = 1,
					["Position"] = UDim2.new(.0599999987,0,0,functions.count+30),
					["Size"] = UDim2.new(0,175,0,30),
					["Font"] = Enum.Font.GothamSemibold,
					["Text"] = text,
					["TextColor3"] = color,
					["TextSize"] = 15,
				})
				
				category.Size = UDim2.new(0,200,0,functions.count+70)
				functions.count = functions.count + 30
				return label
			end
			
			function functions:KRNL_f32f6694ca8f88(text, min, max, callback)
				if not min then min = 0 end
				if not max then max = 100 end
				local slider = create("Frame",{
					["Name"] = "Slider",
					["Parent"] = category,
					["BackgroundTransparency"] = 1,
					["Position"] = UDim2.new(0.0610982701,0,0,functions.count+35),
					["Size"] = UDim2.new(0, 175, 0, 37),
				})
				local description = create("TextLabel",{
					["Name"] = "Description",
					["Parent"] = slider,
					["BackgroundColor3"] = Color3.new(1,1,1),
					["BackgroundTransparency"] = 1,
					["Position"] = UDim2.new(0, 3, 0.189189196, 0),
					["Size"] = UDim2.new(0, 135, 0, 15),
					["Font"] = Enum.Font.GothamSemibold,
					["Text"] = text .. ": " .. min,
					["TextColor3"] = Color3.new(1,1,1),
					["TextSize"] = 14,
					["TextXAlignment"] = Enum.TextXAlignment.Left,
				})
				-- for fixing other shit
				local secretBar = create("Frame",{
					["Name"] = "Bar",
					["Parent"] = slider,
					["BackgroundColor3"] = Color3.new(.176471,.176471,.176471),
					["BorderSizePixel"] = 0,
					["Position"] = UDim2.new(0,0,0,25),
					-- ["Size"] = UDim2.new(0,175,0,5),
					["Size"] = UDim2.new(1.005,0,0,5),
					-- ['ZIndex'] = bar.ZIndex
				})
				local bar = create("Frame",{
					["Name"] = "Bar",
					["Parent"] = slider,
					["BackgroundColor3"] = Color3.new(.176471,.176471,.176471),
					["BorderSizePixel"] = 0,
					["Position"] = UDim2.new(0,0,0,25),
					-- ["Size"] = UDim2.new(0,175,0,5),
					["Size"] = UDim2.new(.95,0,0,5)
				})
				local picker = create("ImageLabel",{
					["Name"] = "Picker",
					["Parent"] = bar,
					["BackgroundTransparency"] = 1,
					["Position"] = UDim2.new(0,0,-0.5,0),
					["Size"] = UDim2.new(0,10,0,10),
					["Image"] = "rbxassetid://344616690",
					ZIndex = 1
				})
				
				do
					local dragging,origin,origin2,delta
					picker.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							origin = picker.Position
							origin2 = input.Position
						end
					end)
					
					uis.InputEnded:Connect(function(input)
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
					
					uis.InputChanged:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
							delta = input.Position - origin2
							picker.Position = UDim2.new(math.clamp((input.Position.X - bar.AbsolutePosition.X - 5) / bar.AbsoluteSize.X, 0, 1), 0, -.5, 0)
							local curValue = ((picker.Position.X.Scale * max) / max) * (max - min) + min
							if string.find(text, 'Sensitivity') then
								curValue = tonumber(string.sub(tostring(curValue),0, 4))
							else
								curValue = math.floor(curValue)
							end
							description.Text = text .. ': ' .. tostring(curValue)
							callback(curValue)
						end
					end)
				end
				
				category.Size = UDim2.new(0,200,0,functions.count+75)
				functions.count = functions.count + 35
				return slider
            end
            
			function functions:NewSlider(text, min, max, default, callback)
				if not min then min = 0 end
                if not max then max = 100 end
                if not default then default = min end
				local slider = create("Frame",{
					["Name"] = "Slider",
					["Parent"] = category,
					["BackgroundTransparency"] = 1,
					["Position"] = UDim2.new(0.0610982701,0,0,functions.count+35),
					["Size"] = UDim2.new(0, 175, 0, 37),
				})
				local description = create("TextLabel",{
					["Name"] = "Description",
					["Parent"] = slider,
					["BackgroundColor3"] = Color3.new(1,1,1),
					["BackgroundTransparency"] = 1,
					["Position"] = UDim2.new(0, 3, 0.189189196, 0),
					["Size"] = UDim2.new(0, 135, 0, 15),
					["Font"] = Enum.Font.GothamSemibold,
					["Text"] = text .. ": " .. min,
					["TextColor3"] = Color3.new(1,1,1),
					["TextSize"] = 14,
					["TextXAlignment"] = Enum.TextXAlignment.Left,
				})
				-- for fixing other shit
				local secretBar = create("Frame",{
					["Name"] = "Bar",
					["Parent"] = slider,
					["BackgroundColor3"] = Color3.new(.176471,.176471,.176471),
					["BorderSizePixel"] = 0,
					["Position"] = UDim2.new(0,0,0,25),
					-- ["Size"] = UDim2.new(0,175,0,5),
					["Size"] = UDim2.new(1.005,0,0,5),
					-- ['ZIndex'] = bar.ZIndex
				})
				local bar = create("Frame",{
					["Name"] = "Bar",
					["Parent"] = slider,
					["BackgroundColor3"] = Color3.new(.176471,.176471,.176471),
					["BorderSizePixel"] = 0,
					["Position"] = UDim2.new(0,0,0,25),
					-- ["Size"] = UDim2.new(0,175,0,5),
					["Size"] = UDim2.new(.95,0,0,5)
				})
				local picker = create("ImageLabel",{
					["Name"] = "Picker",
					["Parent"] = bar,
					["BackgroundTransparency"] = 1,
					["Position"] = UDim2.new(0,0,-0.5,0),
					["Size"] = UDim2.new(0,10,0,10),
					["Image"] = "rbxassetid://344616690",
					ZIndex = 1
                })
                
				spawn(function()
				-- 	local d
				-- 	for i=0,max,1 do
				-- 		d = UDim2.new(math.clamp((i - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1),0,-.5,0)
				-- 		local shet = math.clamp(math.ceil(((d.X.Scale * max) / max) * (max - min) + min), min, max)
				-- 		if default <= min then break end
				-- 		if shet == default or i == max then
				-- 			break
				-- 		end

				-- 		if shet-1 == default then
				-- 			d = UDim2.new(math.clamp(((i-1) - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1),0,-.5,0)
				-- 			break
				-- 		end

				-- 		if shet+1 == default then
				-- 			d = UDim2.new(math.clamp(((i+1) - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1),0,-.5,0)
				-- 			break
				-- 		end
    --                 end
                    local done = false
					picker:TweenPosition(
						UDim2.new(1,0,-.5,0),
                    nil, nil, 1, true, function()
                        done = true
                    end)
                    local last = nil
                    picker:GetPropertyChangedSignal('Position'):connect(function()
                        if not done then
                            last = picker.Position
                            local num = math.clamp(math.ceil(((picker.Position.X.Scale * max) / max) * (max - min) + min), min, max)
                            if num-1 == default then
                                done = true
                                picker:TweenPosition(last,nil,nil,.5,true)
                                return
                            end
                            -- done = true
                            description.Text = text .. ': ' .. math.clamp(math.ceil(((picker.Position.X.Scale * max) / max) * (max - min) + min), min, max)
                        end
					end)
				end)
				
				do
					local dragging,origin,origin2,delta
					picker.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							origin = picker.Position
							origin2 = input.Position
						end
					end)
					
					uis.InputEnded:Connect(function(input)
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
					
					uis.InputChanged:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
							delta = input.Position - origin2
							picker.Position = UDim2.new(math.clamp((input.Position.X - bar.AbsolutePosition.X - 5) / bar.AbsoluteSize.X, 0, 1), 0, -.5, 0)
							local curValue = math.clamp(math.ceil(((picker.Position.X.Scale * max) / max) * (max - min) + min), min, max)
							description.Text = text .. ': ' .. tostring(curValue)
							callback(curValue)
						end
					end)
				end
				
				category.Size = UDim2.new(0,200,0,functions.count+75)
				functions.count = functions.count + 35
				return slider
			end
			
			function functions:KRNL_0784ecf211b327(text, options, multiple, default, callback)
				local dropdown = create("TextButton",{
					["Name"] = "Dropdown",
					["Parent"] = category,
					["BackgroundColor3"] = Color3.new(.176471,.176471,.176471),
					["BorderSizePixel"] = 0,
					["Position"] = UDim2.new(0,12,0,functions.count+(text and 60 or 35)),
					["Size"] = UDim2.new(0,175,0,30),
					["Font"] = Enum.Font.GothamSemibold,
					["Text"] = default,
					["TextColor3"] = Color3.new(1,1,1),
					["TextSize"] = 14,
				})
				local description = create("TextLabel",{
					["Name"] = "Description",
					["Parent"] = dropdown,
					["BackgroundTransparency"] = 1,
					["Position"] = UDim2.new(0,0,-1,0),
					["Size"] = UDim2.new(0,135,0,30),
					["Font"] = Enum.Font.GothamSemibold,
					["Text"] = text and text .. ":" or '',
					["TextColor3"] = Color3.new(1,1,1),
					["TextSize"] = 14,
					["TextXAlignment"] = Enum.TextXAlignment.Left,
				})
				local display = create("TextLabel",{
					["Name"] = "Display",
					["Parent"] = dropdown,
					["BackgroundTransparency"] = 1,
					["Position"] = UDim2.new(.845714271,0,0,0),
					["Size"] = UDim2.new(0,27,0,30),
					["Font"] = Enum.Font.GothamSemibold,
					["Text"] = "+",
					["TextColor3"] = Color3.new(1,1,1),
					["TextSize"] = 20,
				})
				local hitbox = create("Frame",{
					["Name"] = "Hitbox",
					["Parent"] = dropdown,
					["BackgroundTransparency"] = 1,
					["ClipsDescendants"] = true,
					["Position"] = UDim2.new(0,0,1,0),
					["Size"] = UDim2.new(0,175,0,150),
				})
				local list = create("ScrollingFrame",{
					["Name"] = "List",
					["Parent"] = hitbox,
					["BackgroundColor3"] = Color3.new(.137255,.137255,.137255),
					["BorderSizePixel"] = 0,
					["Position"] = UDim2.new(0,0,-1,0),
					["Size"] = UDim2.new(1,0,0,150),
					["Visible"] = false,
					["CanvasSize"] = UDim2.new(0,0,5,0),
					["ScrollBarThickness"] = 4,
					["ZIndex"] = 2,
				})
				local layout = create("UIListLayout",{
					["Parent"] = list,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
				})
				local template, selected
				if multiple then
					template = create("TextLabel",{
						["Name"] = "Template",
						["Parent"] = list,
						["BackgroundTransparency"] = 1,
						["Size"] = UDim2.new(1,-30,0,25),
						["Visible"] = false,
						["Font"] = Enum.Font.GothamSemibold,
						["Text"] = "Text",
						["TextColor3"] = Color3.new(1,1,1),
						["TextSize"] = 14,
						["TextXAlignment"] = Enum.TextXAlignment.Left,
						["ZIndex"] = 2,
					})
					selected = create("ImageButton",{
						["Name"] = "Selected",
						["Parent"] = template,
						["BackgroundColor3"] = Color3.new(0.137255,0.137255,0.137255),
						["BorderColor3"] = Color3.new(0.0980392,0.0980392,0.0980392),
						["BorderSizePixel"] = 2,
						["Position"] = UDim2.new(0,-23,0,4),
						["Size"] = UDim2.new(0,17,0,17),
						["ZIndex"] = 2,
					})
				else
					template = create("TextButton",{
						["Name"] = "Template",
						["Parent"] = list,
						["BackgroundTransparency"] = 1,
						["Size"] = UDim2.new(1,-5,0,25),
						["Visible"] = false,
						["Font"] = Enum.Font.GothamSemibold,
						["Text"] = "Text",
						["TextColor3"] = Color3.new(1,1,1),
						["TextSize"] = 14,
						["TextXAlignment"] = Enum.TextXAlignment.Left,
						["ZIndex"] = 2,
					})
				end
				local debounce,uitoggled
				if multiple then
					for i, v in pairs(options) do
						local toggled
						local new = template:Clone()
						new.Text = i
						new.Name = i
						if v then
							toggled = true
							new.Selected.Image = "rbxassetid://2667008028"
						end
						if #i > 18 then
							new.TextScaled = true
						end
						new.Selected.MouseButton1Click:Connect(function()
							if toggled then
								toggled = false
								new.Selected.Image = ""
								callback(new.Text, false)
							else
								toggled = true
								new.Selected.Image = "rbxassetid://2667008028"
								callback(new.Text, true)
							end
						end)
						new.Visible = true
						new.Parent = list
					end
				else
					for i, v in pairs(options) do
						local new = template:Clone()
						new.Text = v
						new.Name = v
						new.MouseButton1Click:Connect(function()
							if not debounce then
								hitbox.ClipsDescendants = true
								dropdown.Text = new.Text
								callback(new.Text)
								debounce = true
								uitoggled = false
								display.Text = "+"
								list:TweenPosition(UDim2.new(0,0,-1,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,.2)
								wait(.3)
								list.Visible = false
								debounce = false
							end
						end)
						new.Visible = true
						new.Parent = list
					end
				end

				if (25*6) > layout.AbsoluteContentSize.Y then
					list.Size = UDim2.new(1,0,0,(#list:children()*25)-50)
					hitbox.Size = UDim2.new(1,0,0,(#list:children()*25)-50)
				end
				list.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y)
				
				dropdown.MouseButton1Click:Connect(function()
					if not debounce then
						if functions.showndrop == dropdown then
							hitbox.ClipsDescendants = true
							debounce = true
							functions.showndrop = nil
							display.Text = "+"
							list:TweenPosition(UDim2.new(0,0,-1,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,.2)
							wait(.3)
							list.Visible = false
							debounce = false
						else
							if not functions.showndrop then

								debounce = true
								functions.showndrop = dropdown
								display.Text = "-"
								list.Visible = true
								list:TweenPosition(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,.2)
								wait(.3)
								hitbox.ClipsDescendants = false
								debounce = false
							end
						end
					end
				end)
				
				function shareddata:ClearDrop()
					functions.showndrop = nil
				end
				
				category.Size = UDim2.new(0,200,0,functions.count+(text and 105 or 80))
				functions.count = functions.count + (text and 60 or 35)
				return dropdown
			end
			
			function functions:KRNL_f891ac39407eae (name, default, placeholder, focusreset, callback)
				local box = create("TextBox",{
					["Name"] = name,
					["Parent"] = category,
					["BackgroundTransparency"] = 1,
					["Position"] = (name == '' and UDim2.new(0,10,0,functions.count+35)) or UDim2.new(0,150,0,functions.count+35),
					["Size"] = (name == '' and UDim2.new(0,180,0,30)) or UDim2.new(0,40,0,30),
					["Font"] = Enum.Font.GothamSemibold,
					["PlaceholderText"] = placeholder,
					["Text"] = default,
					["TextColor3"] = Color3.new(1,1,1),
					["TextSize"] = 14,
					["ClearTextOnFocus"] = focusreset
				})
				local description = create("TextLabel",{
					["Name"] = "Description",
					["Parent"] = box,
					["BackgroundTransparency"] = 1,
					["Position"] = UDim2.new(-3.375,0,0,0),
					["Size"] = UDim2.new(0,135,0,30),
					["Font"] = Enum.Font.GothamSemibold,
					["Text"] = (name == '' and '') or (name .. ":"),
					["TextColor3"] = Color3.new(1, 1, 1),
					["TextSize"] = 14,
					["TextXAlignment"] = Enum.TextXAlignment.Left,
				})
				
				box.FocusLost:Connect(function()
					callback(box.Text)
				end)
				
				category.Size = UDim2.new(0,200,0,functions.count+75)
				functions.count = functions.count + 35
				return box
			end
			function functions:AddToggle(...) return functions:KRNL_cbb5ee2a24cf34(...) end
			function functions:AddButton(...) return functions:KRNL_0234a044e17801(...) end
			function functions:AddDropdown(...) return functions:KRNL_0784ecf211b327(...) end
			function functions:AddBox(...) return functions:KRNL_f891ac39407eae(...) end
			function functions:AddLabel(...) return functions:KRNL_2478d3ef4c426a(...) end
			function functions:AddSlider(...) return functions:KRNL_f32f6694ca8f88(...) end
			return functions
		end
		function data:AddCategory(...) return data:KRNL_1d7cf31a6a3640(...) end
		function data:ShowColor(...) return data:KRNL_iliIiI11111Il1l(...) end
		return data
	end
	function library:CreateUI(...) return library:KRNL_0bebcb447a7726(...) end
end

return library
