local BadgeInserter = {}
local ServerScriptService = game:GetService("ServerScriptService")
local BadgesFolder = script.Parent.Parent.Parent.Resources.Badges

local BadgeTypes = {
	["WelcomeBadge"] = BadgesFolder.WelcomeBadge,
	["TimeBadge"] = BadgesFolder.TimeBadge,
	["PromptBadge"] = BadgesFolder.PromptBadge,
	["PartBadge"] = BadgesFolder.PartBadge,
	["GroupBadge"] = BadgesFolder.GroupBadge,
	["GamepassBadge"] = BadgesFolder.GamepassBadge,
	["DiedBadge"] = BadgesFolder.DiedBadge,
	["ClickBadge"] = BadgesFolder.ClickBadge,
	["CreatorBadge"] = BadgesFolder.CreatorBadge,
	["ChatBadge"] = BadgesFolder.ChatBadge
}

function Insert(Name,Badge)
	local clone = Badge:Clone()
	clone.Parent = ServerScriptService
	clone.Disabled = false
	if script.Parent.Parent.Parent.Data.Values.Prints.Value == true then
		print(("[\"BADGES+\"] %s Badge has been inserted."):format(Name:split("Badge")[1]))
	else
		
	end
end

for name,badge in pairs(BadgeTypes) do
	BadgeInserter[name] = function()
		Insert(name,badge)
	end
end

return BadgeInserter
