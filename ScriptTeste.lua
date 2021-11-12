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

mouse.KeyDown:connect(function (key) -- Run function
	key = string.lower(key)
	if string.byte(key) == 48 then
		running = true
		local keyConnection = mouse.KeyUp:connect(function (key)
			if string.byte(key) == 48 then
				running = false
			end
		end)

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25
		repeat wait () until running == false
		keyConnection:disconnect()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
		
	end
end)
