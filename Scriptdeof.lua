local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Tapping Sim", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTappingSim"})

_G.AutoClick = false
_G.AutoRebirth = false
_G.AutoRebirthnamy = 1
_G.PlayerEsp = false
local Players = game:GetService("Players")
local localplayer = Players.LocalPlayer

function AutoClick()
	while _G.AutoClick == true do

		local args = {
    		[1] = "Main"
		}

		game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Tap"):FireServer(unpack(args))
		wait(0.000000000000001)
	end
end

function AutoRebirth()
	while _G.AutoRebirth == true do
		local args = {
    		[1] = _G.AutoRebirthnamy
		}

		game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth"):FireServer(unpack(args))

		wait(0.0000000000001)
	end
end

function PlayerEsps()
while _G.PlayerEsp == true do
	for _,v in pairs(game.Workspace:GetChildren()) do
		if v.Name == Players:GetChildren().Name then
				local esp = Instance.new("Highlight", v)
				esp.FillTransparency = 1
				esp.OutlineColor = 0,255,0
			end
		end	
	end
	wait()
end

local AutoFarm = Window:MakeTab({
	Name = "AutoFarm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

AutoFarm:AddToggle({
	Name = "AutoClick",
	Default = false,
	Callback = function(Value)
		_G.AutoClick = Value
		AutoClick()
	end    
})

AutoFarm:AddToggle({
	Name = "AutoRebirth",
	Default = false,
	Callback = function(Value)
		_G.AutoRebirth = Value
		AutoRebirth()
	end    
})

AutoFarm:AddTextbox({
	Name = "AutoRebirth number",
	Default = "1",
	TextDisappear = false,
	Callback = function(Value)
		_G.AutoRebirthnamy = Value
	end	  
})

local Esp = Window:MakeTab({
	Name = "Esp",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Esp:AddToggle({
	Name = "Player Esp (WILL CRASH YOU GAME)",
	Default = false,
	Callback = function(Value)
	_G.PlayerEsp = Value
		PlayerEsps()
	end   
})

OrionLib:Init()
