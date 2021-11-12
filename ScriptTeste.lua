noclip = false
game:GetService('RunService').Stepped:Connect(function()
	if noclip then
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)

	end
end)

local p = game.Players.LocalPlayer
local mo = p:GetMouse()

mo.KeyDown:Connect(function(k)
	if k == 'e' then
		noclip = not noclip
		p.Character.Humanoid:ChangeState(11)
	end
end)

repeat wait() until game.Players.LocalPlayer

m = game.Players.LocalPlayer:GetMouse()

m.KeyDown:connect(function(key)
	if key == "0" then --"Shift to run" 0 == shift
		print("Running")
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32 --change "25" to your speed you want
	end
end)

m.KeyUp:connect(function(key)
	if key == "0" then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 --change "16" to your speed you want when you stop running
	end
end)
