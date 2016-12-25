
function swtbeebox(inst)
	local player =GetPlayer()
	if player:HasTag("swt") then 
		inst.components.harvestable.onharvestfn = function (inst, picker)
			updatelevel(inst)
		end
	--[[else
		inst.components.harvestable.onharvestfn = function (inst, picker)
			updatelevel(inst)
			if inst.components.childspawner and not GetSeasonManager():IsWinter() then
	    		inst.components.childspawner:ReleaseAllChildren(picker)
			end
		end]]
	end
end



AddPrefabPostInit("beebox",swtbeebox)
AddPlayerPostInit("wx78",function (inst)
		inst:SetTag("swt")
end)