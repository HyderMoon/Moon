-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UICorner = Instance.new("UICorner")
local Frame = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Fly = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
Fly.MouseButton1Down:connect(function()
	repeat wait() 
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
	local mouse = game.Players.LocalPlayer:GetMouse() 
	repeat wait() until mouse
	local plr = game.Players.LocalPlayer 
	local torso = plr.Character.Head 
	local flying = false
	local deb = true 
	local ctrl = {f = 0, b = 0, l = 0, r = 0} 
	local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
	local maxspeed = 400 
	local speed = 5000 

	function Fly() 
		local bg = Instance.new("BodyGyro", torso) 
		bg.P = 9e4 
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
		bg.cframe = torso.CFrame 
		local bv = Instance.new("BodyVelocity", torso) 
		bv.velocity = Vector3.new(0,0.1,0) 
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
		repeat wait() 
			plr.Character.Humanoid.PlatformStand = true 
			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
				speed = speed+.5+(speed/maxspeed) 
				if speed > maxspeed then 
					speed = maxspeed 
				end 
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
				speed = speed-1 
				if speed < 0 then 
					speed = 0 
				end 
			end 
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
			else 
				bv.velocity = Vector3.new(0,0.1,0) 
			end 
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
		until not flying 
		ctrl = {f = 0, b = 0, l = 0, r = 0} 
		lastctrl = {f = 0, b = 0, l = 0, r = 0} 
		speed = 0 
		bg:Destroy() 
		bv:Destroy() 
		plr.Character.Humanoid.PlatformStand = false 
	end 
	mouse.KeyDown:connect(function(key) 
		if key:lower() == "r" then 
			if flying then flying = false 
			else 
				flying = true 
				Fly() 
			end 
		elseif key:lower() == "w" then 
			ctrl.f = 1 
		elseif key:lower() == "s" then 
			ctrl.b = -1 
		elseif key:lower() == "a" then 
			ctrl.l = -1 
		elseif key:lower() == "d" then 
			ctrl.r = 1 
		end 
	end) 
	mouse.KeyUp:connect(function(key) 
		if key:lower() == "w" then 
			ctrl.f = 0 
		elseif key:lower() == "s" then 
			ctrl.b = 0 
		elseif key:lower() == "a" then 
			ctrl.l = 0 
		elseif key:lower() == "d" then 
			ctrl.r = 0 
		end 
	end)
	Fly()
end)
local NoClip = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
NoClip.MouseButton1Down:connect(function()
	noclip = false
	game:GetService('RunService').Stepped:connect(function()
		if noclip then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
	plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()
	mouse.KeyDown:connect(function(key)

		if key == "e" then
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
	print('Loaded')
	print('Press "E" to noclip')
end)
local Player = Instance.new("TextLabel")
local UICorner_5 = Instance.new("UICorner")
local FrameLateralEsquerdo = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local MoonScript = Instance.new("TextLabel")
local UICorner_7 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

UIAspectRatioConstraint.Parent = ScreenGui
UIAspectRatioConstraint.AspectRatio = 2.018

ScrollingFrame.Parent = ScreenGui
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
ScrollingFrame.BorderColor3 = Color3.fromRGB(63, 63, 63)
ScrollingFrame.Position = UDim2.new(0.239084631, 0, 0.154898569, 0)
ScrollingFrame.Size = UDim2.new(0, 571, 0, 373)

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = ScrollingFrame

Frame.Parent = ScrollingFrame
Frame.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Frame.Position = UDim2.new(0.241681248, 0, 0.0352181941, 0)
Frame.Size = UDim2.new(0, 416, 0, 136)

UICorner_2.CornerRadius = UDim.new(0, 10)
UICorner_2.Parent = Frame

Fly.Name = "Fly"
Fly.Parent = Frame
Fly.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
Fly.Position = UDim2.new(0.0270537604, 0, 0.0863111168, 0)
Fly.Size = UDim2.new(0, 401, 0, 23)
Fly.Font = Enum.Font.Ubuntu
Fly.Text = "Fly"
Fly.TextColor3 = Color3.fromRGB(255, 255, 255)
Fly.TextSize = 14.000

UICorner_3.Parent = Fly

NoClip.Name = "NoClip"
NoClip.Parent = Frame
NoClip.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
NoClip.Position = UDim2.new(0.027053833, 0, 0.316176474, 0)
NoClip.Size = UDim2.new(0, 400, 0, 23)
NoClip.Font = Enum.Font.Ubuntu
NoClip.Text = "NoClip"
NoClip.TextColor3 = Color3.fromRGB(255, 255, 255)
NoClip.TextSize = 14.000

UICorner_4.Parent = NoClip

Player.Name = "Player"
Player.Parent = Frame
Player.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Player.Position = UDim2.new(0.398043752, 0, -0.210198596, 0)
Player.Size = UDim2.new(0, 83, 0, 19)
Player.Font = Enum.Font.Ubuntu
Player.Text = "Player"
Player.TextColor3 = Color3.fromRGB(255, 255, 255)
Player.TextSize = 14.000

UICorner_5.Parent = Player

FrameLateralEsquerdo.Name = "Frame Lateral Esquerdo"
FrameLateralEsquerdo.Parent = ScrollingFrame
FrameLateralEsquerdo.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
FrameLateralEsquerdo.BorderColor3 = Color3.fromRGB(56, 56, 56)
FrameLateralEsquerdo.Position = UDim2.new(-0.000115044415, 0, -0.000422053039, 0)
FrameLateralEsquerdo.Size = UDim2.new(0, 132, 0, 1111)

UICorner_6.Parent = FrameLateralEsquerdo

MoonScript.Name = "MoonScript"
MoonScript.Parent = FrameLateralEsquerdo
MoonScript.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
MoonScript.Position = UDim2.new(0.188053921, 0, 0.0090246629, 0)
MoonScript.Size = UDim2.new(0, 81, 0, 20)
MoonScript.Font = Enum.Font.Ubuntu
MoonScript.Text = "MoonScript"
MoonScript.TextColor3 = Color3.fromRGB(255, 255, 255)
MoonScript.TextSize = 14.000

UICorner_7.Parent = MoonScript

-- Scripts:

local function XNZZMDN_fake_script() -- ScrollingFrame.LocalScript 
	local script = Instance.new('LocalScript', ScrollingFrame)

	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end
coroutine.wrap(XNZZMDN_fake_script)()
