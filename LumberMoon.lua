-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local ScrollingFrame = Instance.new("ScrollingFrame")
local FramePlayer = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Fly = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
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
local maxspeed = 100 
local speed = 100 

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
speed = speed+.100+(speed/maxspeed) 
if speed > maxspeed then 
speed = maxspeed 
end 
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
speed = speed-100 
if speed < 100 then 
speed = 100 
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
speed = 100 
bg:Destroy() 
bv:Destroy() 
plr.Character.Humanoid.PlatformStand = false 
end 
mouse.KeyDown:connect(function(key) 
if key:lower() == "f" then 
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
local UICorner_3 = Instance.new("UICorner")
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
end)
local Player = Instance.new("TextLabel")
local InfJump = Instance.new("TextButton")
InfJump.MouseButton1Down:connect(function()
	_G.infinjump = true

	local Player = game:GetService("Players").LocalPlayer
	local Mouse = Player:GetMouse()
	Mouse.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
				Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
				Humanoid:ChangeState("Jumping")
				wait(0.1)
				Humanoid:ChangeState("Seated")
			end
		end
	end)

	local Player = game:GetService("Players").LocalPlayer
	local Mouse = Player:GetMouse()
	Mouse.KeyDown:connect(function(k)
		k = k:lower()
		if k == "f" then
			if _G.infinjump == true then
				_G.infinjump = false
			else
				_G.infinjump = true
			end
		end
	end)
end)
local UICorner_4 = Instance.new("UICorner")
local WaterWalk = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local LavaWalk = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local MoonScript = Instance.new("TextLabel")
local UICorner_7 = Instance.new("UICorner")
local FrameTeleport = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local Teleport = Instance.new("TextLabel")
local TeleportLocations = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ScrollingFrame.Parent = ScreenGui
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
ScrollingFrame.BorderColor3 = Color3.fromRGB(63, 63, 63)
ScrollingFrame.BorderSizePixel = 3
ScrollingFrame.Position = UDim2.new(0.239084616, 0, 0.154898569, 0)
ScrollingFrame.Size = UDim2.new(0, 571, 0, 327)

FramePlayer.Name = "FramePlayer"
FramePlayer.Parent = ScrollingFrame
FramePlayer.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
FramePlayer.Position = UDim2.new(0.064798601, 0, 0.0640348494, 0)
FramePlayer.Size = UDim2.new(0, 497, 0, 209)

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = FramePlayer

Fly.Name = "Fly"
Fly.Parent = FramePlayer
Fly.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
Fly.Position = UDim2.new(0.0230295341, 0, 0.196045801, 0)
Fly.Size = UDim2.new(0, 475, 0, 23)
Fly.Font = Enum.Font.GothamBlack
Fly.Text = "  Fly (R)"
Fly.TextColor3 = Color3.fromRGB(255, 255, 255)
Fly.TextSize = 14.000
Fly.TextXAlignment = Enum.TextXAlignment.Left

UICorner_2.Parent = Fly

NoClip.Name = "NoClip"
NoClip.Parent = FramePlayer
NoClip.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
NoClip.Position = UDim2.new(0.023, 0, 0.335000008, 0)
NoClip.Size = UDim2.new(0, 475, 0, 23)
NoClip.Font = Enum.Font.GothamBlack
NoClip.Text = "  NoClip (E)"
NoClip.TextColor3 = Color3.fromRGB(255, 255, 255)
NoClip.TextSize = 14.000
NoClip.TextXAlignment = Enum.TextXAlignment.Left

UICorner_3.Parent = NoClip

Player.Name = "Player"
Player.Parent = FramePlayer
Player.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Player.BorderColor3 = Color3.fromRGB(52, 52, 52)
Player.Position = UDim2.new(0.0237982683, 0, 0.0471543521, 0)
Player.Size = UDim2.new(0, 83, 0, 19)
Player.Font = Enum.Font.GothamBlack
Player.Text = "Player"
Player.TextColor3 = Color3.fromRGB(255, 255, 255)
Player.TextSize = 14.000
Player.TextXAlignment = Enum.TextXAlignment.Left

InfJump.Name = "InfJump"
InfJump.Parent = FramePlayer
InfJump.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
InfJump.Position = UDim2.new(0.023, 0, 0.474000007, 0)
InfJump.Size = UDim2.new(0, 475, 0, 23)
InfJump.Font = Enum.Font.GothamBlack
InfJump.Text = "  InfJump"
InfJump.TextColor3 = Color3.fromRGB(255, 255, 255)
InfJump.TextSize = 14.000
InfJump.TextXAlignment = Enum.TextXAlignment.Left

UICorner_4.Parent = InfJump

WaterWalk.Name = "WaterWalk"
WaterWalk.Parent = FramePlayer
WaterWalk.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
WaterWalk.Position = UDim2.new(0.023, 0, 0.612999976, 0)
WaterWalk.Size = UDim2.new(0, 475, 0, 23)
WaterWalk.Font = Enum.Font.GothamBlack
WaterWalk.Text = "  WaterWalk"
WaterWalk.TextColor3 = Color3.fromRGB(255, 255, 255)
WaterWalk.TextSize = 14.000
WaterWalk.TextXAlignment = Enum.TextXAlignment.Left

UICorner_5.Parent = WaterWalk

LavaWalk.Name = "LavaWalk"
LavaWalk.Parent = FramePlayer
LavaWalk.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
LavaWalk.Position = UDim2.new(0.023, 0, 0.753000021, 0)
LavaWalk.Size = UDim2.new(0, 475, 0, 23)
LavaWalk.Font = Enum.Font.GothamBlack
LavaWalk.Text = "  LavaWalk"
LavaWalk.TextColor3 = Color3.fromRGB(255, 255, 255)
LavaWalk.TextSize = 14.000
LavaWalk.TextXAlignment = Enum.TextXAlignment.Left

UICorner_6.Parent = LavaWalk

MoonScript.Name = "MoonScript"
MoonScript.Parent = ScrollingFrame
MoonScript.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MoonScript.Position = UDim2.new(0.0847264156, 0, 0.0104878545, 0)
MoonScript.Size = UDim2.new(0, 476, 0, 41)
MoonScript.Font = Enum.Font.GothamBlack
MoonScript.Text = "🌑 MoonScript 🌑"
MoonScript.TextColor3 = Color3.fromRGB(255, 255, 255)
MoonScript.TextSize = 14.000

UICorner_7.Parent = MoonScript

FrameTeleport.Name = "FrameTeleport"
FrameTeleport.Parent = ScrollingFrame
FrameTeleport.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
FrameTeleport.Position = UDim2.new(0.064798601, 0, 0.273058802, 0)
FrameTeleport.Size = UDim2.new(0, 497, 0, 209)

UICorner_8.CornerRadius = UDim.new(0, 10)
UICorner_8.Parent = FrameTeleport

Teleport.Name = "Teleport"
Teleport.Parent = FrameTeleport
Teleport.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Teleport.BorderColor3 = Color3.fromRGB(52, 52, 52)
Teleport.Position = UDim2.new(0.0237982683, 0, 0.0471543521, 0)
Teleport.Size = UDim2.new(0, 83, 0, 19)
Teleport.Font = Enum.Font.GothamBlack
Teleport.Text = "Teleport"
Teleport.TextColor3 = Color3.fromRGB(255, 255, 255)
Teleport.TextSize = 14.000
Teleport.TextXAlignment = Enum.TextXAlignment.Left

TeleportLocations.Name = "Teleport Locations"
TeleportLocations.Parent = FrameTeleport
TeleportLocations.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
TeleportLocations.Position = UDim2.new(0.023, 0, 0.195999995, 0)
TeleportLocations.Size = UDim2.new(0, 475, 0, 23)
TeleportLocations.Font = Enum.Font.GothamBlack
TeleportLocations.Text = "  Locations"
TeleportLocations.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportLocations.TextSize = 14.000
TeleportLocations.TextXAlignment = Enum.TextXAlignment.Left

UICorner_9.Parent = TeleportLocations

-- Scripts:

local function FAXTW_fake_script() -- ScrollingFrame.LocalScriptMoverJanela 
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
coroutine.wrap(FAXTW_fake_script)()
