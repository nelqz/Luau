-- ehhhhhh
-- esp i think
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function main(player)
    if player == LocalPlayer then return end
    local function esp(character)
        if not character then return end
        local gui = Instance.new("BillboardGui")
        gui.Parent = character
        gui.Adornee = character
        gui.AlwaysOnTop = true
        gui.Size = UDim2.fromScale(4,6)
        local box = Instance.new("Frame")
        box.Parent = gui
        box.BackgroundTransparency = 1
        box.Size = UDim2.fromScale(1,1)
        local str = Instance.new("UIStroke")
        str.Parent = box
        str.Color = Color3.fromRGB(255,255,255)
        str.Thickness = 1
    end
    if player.Character then
        esp(player.Character)
    end
    player.CharacterAdded:Connect(esp)
end

local function remove(char)
    char:Destroy()
end

local ui = Instance.new("ScreenGui")
ui.IgnoreGuiInset = true
ui.Parent = gethui()
local button = Instance.new("TextButton")
button.Size = UDim2.fromScale(0.1,0.1)
button.Position = UDim2.fromScale(0.5,0.1)
button.AnchorPoint = Vector2.new(0.5,0.5)
button.Parent = ui
local onof = false
button.Activated:Connect(function()
    if onof == false then
        onof = true
        for _, player in Players:GetPlayers() do
            main(player)
        end
        button.Text = "ESP: ON"
    else
        onof = false
        for _, player in Players:GetPlayers() do
            if player ~= LocalPlayer and player.Character then
                for _, v in player.Character:GetDescendants() do
                    if v:IsA("BillboardGui") or v:IsA("Frame") or v:IsA("UIStroke") then
                        remove(v)
                    end
                end
            end
        end
        button.Text = "ESP: OFF"
    end
end)

button.Text = "ESP: OFF"
