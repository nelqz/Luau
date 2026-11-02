-- throw food for animals
local cloneref = cloneref or function(...) return ... end
while true do
 local boost = cloneref(game:GetService("Players")).LocalPlayer.PlayerGui:WaitForChild("TrainingSequence"):WaitForChild("TapBonusLayer"):WaitForChild("TapBonus")
 if boost then
  firesignal(boost.Activated)
 end
 task.wait(0.1)
end
