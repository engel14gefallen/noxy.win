local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local gui = Instance.new("ScreenGui")
gui.Name = "RainbowCrosshair"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local crosshair = Instance.new("Frame")
crosshair.Size = UDim2.new(0,40,0,40)
crosshair.AnchorPoint = Vector2.new(0.5,0.5)
crosshair.BackgroundTransparency = 1
crosshair.Parent = gui

local gap = 4
local length = 10
local thickness = 2

local function createLine(size,pos)
	local f = Instance.new("Frame")
	f.Size = size
	f.Position = pos
	f.BorderSizePixel = 0
	f.Parent = crosshair
	return f
end

local top = createLine(
	UDim2.new(0,thickness,0,length),
	UDim2.new(0.5,-thickness/2,0.5,-gap-length)
)

local bottom = createLine(
	UDim2.new(0,thickness,0,length),
	UDim2.new(0.5,-thickness/2,0.5,gap)
)

local left = createLine(
	UDim2.new(0,length,0,thickness),
	UDim2.new(0.5,-gap-length,0.5,-thickness/2)
)

local right = createLine(
	UDim2.new(0,length,0,thickness),
	UDim2.new(0.5,gap,0.5,-thickness/2)
)

-- Label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(0,200,0,20)
label.AnchorPoint = Vector2.new(0.5,0)
label.BackgroundTransparency = 1
label.Text = "noxy.win"
label.Font = Enum.Font.Arcade
label.TextScaled = true
label.Parent = gui

-- Outline for cool effect
local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.new(0,0,0)
stroke.Parent = label

local RunService = game:GetService("RunService")

local hue = 0

RunService.RenderStepped:Connect(function(dt)
	hue = (hue + dt * 0.25) % 1
	local color = Color3.fromHSV(hue,1,1)

	top.BackgroundColor3 = color
	bottom.BackgroundColor3 = color
	left.BackgroundColor3 = color
	right.BackgroundColor3 = color
	label.TextColor3 = color

	-- spin
	crosshair.Rotation = crosshair.Rotation + 120 * dt

	-- follow mouse
	local x = mouse.X
	local y = mouse.Y

	crosshair.Position = UDim2.fromOffset(x,y)
	label.Position = UDim2.fromOffset(x, y + 25)
end)
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local lighting = game:GetService("Lighting")

-- Remove old custom sky if it exists
if lighting:FindFirstChild("PurpleNightSky") then
    lighting.PurpleNightSky:Destroy()
end

-- Create a purple night sky
local nightSky = Instance.new("Sky")
nightSky.Name = "PurpleNightSky"

-- Leave textures blank to rely on ambient colors for purple effect
nightSky.SkyboxBk = ""
nightSky.SkyboxDn = ""
nightSky.SkyboxFt = ""
nightSky.SkyboxLf = ""
nightSky.SkyboxRt = ""
nightSky.SkyboxUp = ""
nightSky.Parent = lighting

-- Night sky lighting settings
lighting.ClockTime = 22 -- night time
lighting.FogStart = 0
lighting.FogEnd = 500
lighting.FogColor = Color3.fromRGB(50, 0, 80) -- dark purple fog
lighting.Ambient = Color3.fromRGB(80, 0, 120)
lighting.OutdoorAmbient = Color3.fromRGB(120, 30, 160)
lighting.StarCount = 5000 -- add stars