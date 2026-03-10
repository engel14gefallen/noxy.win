loadstring([[local p=game.Players.LocalPlayer;local g=Instance.new("ScreenGui");g.ResetOnSpawn=false;g.Parent=p:WaitForChild("PlayerGui");local f=Instance.new("Frame");f.Size=UDim2.new(0,0,0,0);f.Position=UDim2.new(1,320,0,20);f.BackgroundColor3=Color3.fromRGB(20,20,20);f.BackgroundTransparency=0.5;f.BorderSizePixel=0;Instance.new("UICorner",f).CornerRadius=UDim.new(0,10);f.Parent=g;local l=Instance.new("TextLabel");l.Size=UDim2.new(1,-16,1,-16);l.Position=UDim2.new(0,8,0,8);l.BackgroundTransparency=1;l.Text="welcome to noxy.win";l.TextScaled=true;l.Font=Enum.Font.GothamMedium;l.TextXAlignment=Enum.TextXAlignment.Left;l.Parent=f;local stroke=Instance.new("UIStroke");stroke.Thickness=1.5;stroke.Transparency=0.4;stroke.Parent=l;local s=Instance.new("Sound");s.SoundId="rbxassetid://6026984224";s.Volume=0.8;s.Parent=f;s:Play();local ts=game:GetService("TweenService");local rs=game:GetService("RunService");local h=0;rs.RenderStepped:Connect(function(dt)h=(h+dt*0.3)%1;l.TextColor3=Color3.fromHSV(h,0.8,1)end);local t1=ts:Create(f,TweenInfo.new(1.2,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Size=UDim2.new(0,220,0,60)});local t2=ts:Create(f,TweenInfo.new(1.2,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Position=UDim2.new(1,-240,0,20)});t1:Play();t2:Play();t1.Completed:Connect(function()task.wait(4);local out=ts:Create(f,TweenInfo.new(0.8,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position=UDim2.new(1,320,0,20)});out:Play();out.Completed:Connect(function()g:Destroy()end)end) ]])()
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