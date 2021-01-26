if not Net then Net = "Simple" end

local SH = sethiddenproperty or set_hidden_property or set_hidden_prop
local GH = gethiddenproperty or get_hidden_prop or get_hidden_property
local SS = set_simulation_radius or setsimulationradius
local CNET

if Net == "Simple" then
	if CNET then CNET:Disconnect() end
	CNET = game:GetService("RunService").RenderStepped:Connect(function()
		settings().Physics.AllowSleep = false
		SS(math.huge*math.huge,math.huge*math.huge)
	end)
elseif Net == "Advanced" then
	if CNET then CNET:Disconnect() end
	CNET = game:GetService("RunService").Stepped:Connect(function()
		settings().Physics.AllowSleep = false
		SS(math.huge*math.huge,math.huge*math.huge)
		settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
		game:GetService("RunService").Heartbeat:Wait()
	end)
elseif Net == "Full" then
	if CNET then CNET:Disconnect() end
	CNET = game:GetService("RunService").RenderStepped:Connect(function()
		settings().Physics.AllowSleep = false
		settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
		game:GetService("Players").LocalPlayer.ReplicationFocus = workspace
		SS(math.huge,math.huge,math.huge,math.huge)
		SH(game.Players.LocalPlayer, "MaximumSimulationRadius",math.huge)
		SH(game.Players.LocalPlayer, "SimulationRadius",math.huge,math.huge,math.huge,math.huge)
		game:GetService("RunService").Heartbeat:Wait()
	end) 
end
