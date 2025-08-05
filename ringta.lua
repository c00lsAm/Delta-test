
-- // forest99 killaura.lua
local p = game:GetService("Players").LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
local h = c:WaitForChild("HumanoidRootPart")
local dmg = 15
local range = 12
local active = true

local rmt = game:GetService("ReplicatedStorage"):WaitForChild("DamageRemote")

task.spawn(function()
	while active and wait(0.3) do
		for _, ent in pairs(workspace:GetChildren()) do
			if ent:IsA("Model") and ent:FindFirstChild("Humanoid") and ent ~= c then
				local root = ent:FindFirstChild("HumanoidRootPart")
				if root and (h.Position - root.Position).Magnitude < range then
					rmt:FireServer(ent, dmg)
				end
			end
		end
	end
end)
