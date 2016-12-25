--modmain.lua require this file,add Ingredient Values for cooking item and --[[return food recipe]]
AddIngredientValues({"cutglass"},{tea=0.5})
AddIngredientValues({"jueye"},{tea =1})

local swtfood = {
	honeytea = {
		test = function(cooker, names, tags) return tags.fish and names.twigs and (tags.inedible and tags.inedible <= 1) end,
		priority = 1,
		foodtype = "MEAT",
		health = TUNING.HEALING_LARGE,
		hunger = TUNING.CALORIES_LARGE,
		perishtime = TUNING.PERISH_MED,
		sanity = TUNING.SANITY_TINY,
		cooktime = 2,
		tags = {"catfood"}
	},	
	
	creamcake = {
		test = function (cooker,names,tags) return tags.dairy and tags.frozen and tags.
}
	sdhs={dsd
	},	
}

for k,recipe in pairs(foods) do
	recipe.name = k
	recipe.weight = recipe.weight or 1
	recipe.priority = recipe.priority or 0
	AddCookerRecipe("cookpot", recipe)
end


RECIPE("xxxx",xxxx,swtfoodfun)
...