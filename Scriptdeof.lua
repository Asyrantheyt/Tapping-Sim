local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Tapping Sim", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTappingSim"})
local camera = game.workspace.CurrentCamera

_G.AutoClick = false
_G.AutoRebirth = false
_G.AutoRebirthnamy = 1
_G.PlayerEsp = false
local Players = game:GetService("Players")
local localplayer = Players.LocalPlayer
local lplr = game.Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint

local HeadOff = Vector3.new(0, 0.5, 0)
local LegOff = Vector3.new(0,3,0)

function AutoClick()
	while _G.AutoClick == true do

		local args = {
    		[1] = "Main"
		}

		game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Tap"):FireServer(unpack(args))
		wait()
	end
end

function AutoRebirth()
	while _G.AutoRebirth == true do
		local args = {
    		[1] = _G.AutoRebirthnamy
		}

		game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth"):FireServer(unpack(args))

		wait()
	end
end

function PlayerEsps()
while _G.PlayerEsp == true do
	wait()
	for _,v in pairs(game.Players:GetPlayers()) do
			if v.Character ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
				local vector,OnScreen = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
				local Line = Drawing.new("Line")
				Line.Visible = true
				Line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
				Line.To = Vector2.new(200, 200)
				Line.Color = Color3.fromRGB(255, 80, 60)
				Line.Thickness = 2
				Line.Transparency = 1

				function esplinescript()
					game:GetService("RunService").RenderStepped:Connect(function(step)
						if v.Character ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
							local vector,OnScreen = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
							if OnScreen == true then
								Line.To = Vector2.new(vector.X,vector.Y)
								Line.Visible = true
								Line.Visible = _G.PlayerEsp
							else
								Line.Visible = false
							end
						end
					end)
				end
			esplinescript()
		end
		 v.CharacterAdded:Connect(function()
			repeat wait() until v.Character ~= nil
			repeat wait() until v.Character:FindFirstChild("HumanoidRootPart")
			local vector,OnScreen = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
			local Line = Drawing.new("Line")
			Line.Visible = true
			Line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
			Line.To = Vector2.new(200, 200)
			Line.Color = Color3.fromRGB(255, 80, 60)
			Line.Thickness = 2
			Line.Transparency = 1

			function esplinescript2()
				game:GetService("RunService").RenderStepped:Connect(function(step)
					if v.Character ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						local vector,OnScreen = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
						if OnScreen == true then
							Line.To = Vector2.new(vector.X,vector.Y)
							Line.Visible = true
							Line.Visible = _G.PlayerEsp
						else
							Line.Visible = false
					end
				end
			end)
		 end
		end)
	end
	local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint

local HeadOff = Vector3.new(0, 0.5, 0)
local LegOff = Vector3.new(0,3,0)

for i,v in pairs(game.Players:GetChildren()) do
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Color3.new(0,0,0)
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.new(1,1,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    function boxesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                if onScreen then
                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                    BoxOutline.Visible = true
					BoxOutline.Visible = _G.PlayerEsp

                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = true
					Box.Visible = _G.PlayerEsp

                    if v.TeamColor == lplr.TeamColor then
                        BoxOutline.Visible = false
                        Box.Visible = false
                    else
                        BoxOutline.Visible = true
                        Box.Visible = true
						Box.Visible = _G.PlayerEsp
						BoxOutline.Visible = _G.PlayerEsp
                    end

                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
            end
        end)
    end
  	boxesp()
end

game.Players.PlayerAdded:Connect(function(v)
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Color3.new(0,0,0)
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.new(1,1,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    function boxesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                if onScreen then
                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                    BoxOutline.Visible = true
					BoxOutline.Visible = _G.PlayerEsp

                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = true
					Box.Visible = _G.PlayerEsp

                    if v.TeamColor == lplr.TeamColor then
                        BoxOutline.Visible = false
                        Box.Visible = false
                    else
                        BoxOutline.Visible = true
                        Box.Visible = true
						Box.Visible = _G.PlayerEsp
                    end

                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
            end
        end)
    end
  boxesp()
end)
end
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

Esp:AddLabel("this might not work due to")
Esp:AddLabel("'obfuscate'")

Esp:AddToggle({
	Name = "Player Esp (WILL CRASH YOU GAME)",
	Default = false,
	Callback = function(Value)
		_G.PlayerEsp = Value
		PlayerEsps()
	end
})


OrionLib:Init()
