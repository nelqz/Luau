-- idk what to make
-- aimbot
local camera = workspace.CurrentCamera
game:GetService("RunService").RenderStepped:Connect(function()
    local v, dist = nil, math.huge
    for _, player in game.Players:GetPlayers() do
        if player ~= game.Players.LocalPlayer and player.Character then
            local closest = (camera.CFrame.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if closest < dist then
                dist = closest
                v = player
            end
        end
    end
    if v.Character.Head then
        camera.CFrame = CFrame.lookAt(camera.CFrame.Position, v.Character.Head.Position)
    end
end)
