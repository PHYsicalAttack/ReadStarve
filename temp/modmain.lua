-- modmain.lua				desc:
require = GLOBAL.require
STRINGS = GLOBAL.STRINGS
RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
Prefabs = GLOBAL.Prefabs
TECH = GLOBAL.TECH
unpack = GLOBAL.unpack
-----------------------------------
TUNING.GOLD_VALUES.HONEYCOMB = 4
SWT_PLAYER ={
	["Wilson"] = true,
	["WX-78"] = true,
	}

-----------------------------------
SUPERDEBUG = false
if SUPERDEBUG then
	TECH.SCIENCE_ONE = TECH.SCIENCE_NONE

end
function swt_print(...)
		print("====【swt_print】: ",GLOBAL.unpack({...}))
	end
	swt_print(TUNING.GOLD_VALUES.HONEYCOMB)
------------------------------------
--add recipe for honeycomb and can be traded
Recipe("honeycomb", {Ingredient("bee", 4),Ingredient("honey", 8),Ingredient("goldnugget",1)}, RECIPETABS.FARM,  TECH.SCIENCE_TWO)
AddPrefabPostInit("honeycomb",function (inst)
	inst.components.tradable.goldvalue = TUNING.GOLD_VALUES.HONEYCOMB end)
--beebox will not attack swt player
function fixbeeboxfunc(inst, picker,produce)
		swt_print(inst.name,picker.name)
		local levels =
		{
		    { amount=6, idle="honey3", hit="hit_honey3" },
		    { amount=3, idle="honey2", hit="hit_honey2" },
		    { amount=1, idle="honey1", hit="hit_honey1" },
		    { amount=0, idle="bees_loop", hit="hit_idle" },
		}
		if not inst:HasTag("burnt") then
		    --updatelevel(inst)
			for k,level in pairs(levels) do
				if inst.components.harvestable.produce >= level.amount then
		           --setlevel(inst, v)
		           if not inst.anims then
				        inst.anims = {idle = level.idle, hit = level.hit}
				   else
				        inst.anims.idle = level.idle
				        inst.anims.hit = level.hit
				   end
				   inst.AnimState:PlayAnimation(inst.anims.idle)
		           break
		        end
		    end
			if inst.components.childspawner and not GLOBAL.GetSeasonManager():IsWinter() and  not picker:HasTag("swt") then
				inst.components.childspawner:ReleaseAllChildren(picker)
			end
		end
		swt_print(picker:HasTag("swt"),GLOBAL.GetSeasonManager():IsWinter(),"fixfunc is called completed")
end
function swtbeebox(inst)
	inst.components.harvestable.onharvestfn = nil
	inst.components.harvestable:SetOnHarvestFn(fixbeeboxfunc)
end
AddPrefabPostInit("beebox",swtbeebox)
AddPrefabPostInitAny()
--swt character(there maybe have bug because of check name string.)
function swtPlayersInit(player)
	if SWT_PLAYER[player.name] then
		if SUPERDEBUG then
			player.components.health:SetMaxHealth(500)
			player.components.hunger:SetMax(500)
		end
		if SWT_PLAYER[player.name] then
			-- if player control a swt character then add it a tag
			player:AddTag("swt")
		end
	end
	swt_print(player.name)
end
AddSimPostInit(swtPlayersInit)
---




















function testfunc(inst,picker)
	swt_print("testfunc is called",picker.components.inventory)
	for i =1,10,1 do
		swt_print("in for loop")
		local product = GLOBAL.SpawnPrefab("bee")
		picker.components.inventory:GiveItem(product)
	end
end

--GLOBAL.RunScript("swtbeebox")
