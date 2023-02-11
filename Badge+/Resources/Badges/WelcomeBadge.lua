local players = game:GetService("Players")
local badges = game:GetService("BadgeService")
local userHasBadge = badges.UserHasBadgeAsync
local awardBadge = badges.AwardBadge

local badgeId = 0 --Change to ID of badge.
local function onPlayerAdded(player)
	local success, result = pcall(userHasBadge, badges, player.UserId, badgeId)
	if success then
		if not result then
			local success2, result2 = pcall(awardBadge, badges, player.UserId, badgeId)
			if success2 then
				if result2 then
					do end
				end
			else
				warn(result2)
			end
		end
	else
		warn(result)
	end
end

players.PlayerAdded:Connect(onPlayerAdded)