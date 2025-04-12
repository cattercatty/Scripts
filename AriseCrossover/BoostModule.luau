CloneTable = function(p96)
	local v97 = {};
	for v98, v99 in pairs(p96) do
		if type(v99) == "table" then
			v97[v98] = CloneTable(v99);
		else
			v97[v98] = v99;
		end;
	end;
	return v97;
end;

local v_u_1 = game:GetService("ReplicatedStorage");
local GetGuildInfo = function(p404)
	local v405 = p404.leaderstats:GetAttribute("Guild");
	if v405 ~= false then
		local v406 = v_u_1.__Infos.__Guilds:FindFirstChild(v405);
		if v406 ~= nil then
			return v406;
		end;
	end;
end;

local v1 = game:GetService("ReplicatedStorage");
local v_u_2 = v1.SharedModules;
local v3 = v1.Indexer;
local v_u_4 = {
	["Shadow"] = {
		["Name"] = "Shadow Boost",
		["Image"] = "rbxassetid://82471250368421",
		["Boosts"] = "ShadowDamage",
		["Amount"] = 1.5
	},
	["SwordDamage"] = {
		["Name"] = "Sword Damage",
		["Image"] = "rbxassetid://136323164820165",
		["Boosts"] = "SwordDamage",
		["Amount"] = 1.5
	},
	["Drops"] = {
		["Name"] = "Drops Boost",
		["Image"] = "rbxassetid://73941229536170",
		["Boosts"] = "Drops",
		["Amount"] = 1.5
	},
	["Gems"] = {
		["Name"] = "Gems Boost",
		["Image"] = "rbxassetid://139891536960417",
		["Boosts"] = "Gems",
		["Amount"] = 1.5
	},
	["Coins"] = {
		["Name"] = "Cash Boost",
		["Image"] = "rbxassetid://118289397597094",
		["Boosts"] = "Coins",
		["Amount"] = 1.5
	},
	["Exp"] = {
		["Name"] = "Exp Boost",
		["Image"] = "rbxassetid://72530234873537",
		["Boosts"] = "Exp",
		["Amount"] = 1.5
	}
}
local v_u_5 = {
	["Roles"] = {
		{
			["Name"] = "Leader",
			["Color"] = Color3.fromRGB(255, 0, 0)
		},
		{
			["Name"] = "Officer",
			["Color"] = Color3.fromRGB(0, 0, 255)
		},
		{
			["Name"] = "Banker",
			["Color"] = Color3.fromRGB(0, 255, 0)
		},
		{
			["Name"] = "Member",
			["Color"] = Color3.fromRGB(255, 255, 255)
		}
	};
	["Colors"] = {
		["0"] = {
			["Name"] = "Default",
			["Color"] = Color3.fromRGB(255, 221, 51),
			["Price"] = 0
		},
		["1"] = {
			["Name"] = "Red",
			["Color"] = Color3.fromRGB(255, 0, 0),
			["Price"] = 3000
		},
		["2"] = {
			["Name"] = "Blue",
			["Color"] = Color3.fromRGB(0, 102, 255),
			["Price"] = 3000
		},
		["3"] = {
			["Name"] = "Green",
			["Color"] = Color3.fromRGB(0, 200, 0),
			["Price"] = 3000
		},
		["4"] = {
			["Name"] = "Purple",
			["Color"] = Color3.fromRGB(128, 0, 255),
			["Price"] = 3500
		},
		["5"] = {
			["Name"] = "Orange",
			["Color"] = Color3.fromRGB(255, 140, 0),
			["Price"] = 3500
		},
		["6"] = {
			["Name"] = "Pink",
			["Color"] = Color3.fromRGB(255, 105, 180),
			["Price"] = 3500
		},
		["7"] = {
			["Name"] = "White",
			["Color"] = Color3.fromRGB(255, 255, 255),
			["Price"] = 4000
		},
		["8"] = {
			["Name"] = "Black",
			["Color"] = Color3.fromRGB(20, 20, 20),
			["Price"] = 4000
		},
		["9"] = {
			["Name"] = "Gold",
			["Color"] = Color3.fromRGB(255, 215, 0),
			["Price"] = 5000
		},
		["10"] = {
			["Name"] = "Silver",
			["Color"] = Color3.fromRGB(192, 192, 192),
			["Price"] = 4500
		},
		["11"] = {
			["Name"] = "Cyan",
			["Color"] = Color3.fromRGB(0, 255, 255),
			["Price"] = 3500
		},
		["12"] = {
			["Name"] = "Magenta",
			["Color"] = Color3.fromRGB(255, 0, 255),
			["Price"] = 3500
		},
		["13"] = {
			["Name"] = "Lime",
			["Color"] = Color3.fromRGB(180, 255, 0),
			["Price"] = 4000
		},
		["14"] = {
			["Name"] = "Crimson",
			["Color"] = Color3.fromRGB(220, 20, 60),
			["Price"] = 4500
		},
		["15"] = {
			["Name"] = "Aqua",
			["Color"] = Color3.fromRGB(0, 255, 180),
			["Price"] = 4000
		},
		["16"] = {
			["Name"] = "Galaxy",
			["Color"] = Color3.fromRGB(85, 0, 170),
			["Price"] = 6000
		},
		["17"] = {
			["Name"] = "Void",
			["Color"] = Color3.fromRGB(30, 0, 60),
			["Price"] = 6500
		},
		["18"] = {
			["Name"] = "Rose Gold",
			["Color"] = Color3.fromRGB(255, 102, 204),
			["Price"] = 5500
		},
		["19"] = {
			["Name"] = "Ice",
			["Color"] = Color3.fromRGB(180, 255, 255),
			["Price"] = 5000
		},
		["20"] = {
			["Name"] = "Midnight",
			["Color"] = Color3.fromRGB(10, 10, 40),
			["Price"] = 5500
		}
	};
	["Upgrades"] = {
		["MorePlayers"] = {
			["Name"] = "More Players",
			["Desc"] = "Increase the maximum number of players in your guild.",
			["Price"] = 500000,
			["Max"] = 30,
			["PriceMult"] = 1.5,
			["Icon"] = "rbxassetid://107463352514802"
		},
		["PetDamage"] = {
			["Name"] = "Shadow Boost",
			["Desc"] = "Increase the damage of your All Members Shadows.",
			["Price"] = 10000000,
			["Max"] = 100,
			["PriceMult"] = 1.85,
			["Icon"] = "rbxassetid://113150047926108"
		},
		["MoreSlots"] = {
			["Name"] = "Shadow Slots",
			["Desc"] = "Increase the Max Slots of your All Members Shadows.",
			["Price"] = 1000000000000000,
			["Max"] = 3,
			["PriceMult"] = 10000,
			["Icon"] = "rbxassetid://88434249768137"
		},
		["PetRange"] = {
			["Name"] = "Shadow Range",
			["Desc"] = "Increase the range of your All Members Shadows.",
			["Price"] = 100000000000,
			["Max"] = 10,
			["PriceMult"] = 25,
			["Icon"] = "rbxassetid://118022406749160"
		}
	};
}
local v_u_6 = {}
local v_u_7 = {}
local v_u_8 = nil;
Cat = {
	["GetAllType"] = function(p9, p10)
		-- upvalues: (copy) v_u_4
		local v11 = 1
		for v12, v13 in next, v_u_4 do
			if v13.Boosts == p9 and (p10.leaderstats.Boosts:GetAttribute(v12) or 0) >= 1 then
				if p9 == "Luck" then
					v11 = v11 + v13.Amount
				else
					v11 = v11 * v13.Amount
				end
			end
		end
		return v11
	end,
	["RemoveBuff"] = function(p14)
		-- upvalues: (copy) v_u_6
		v_u_6[p14] = nil
	end,
	["GuildBoost"] = function(p15)
		-- upvalues: (copy) v_u_7, (copy) v_u_2, (ref) v_u_8, (copy) v_u_5
		if v_u_7[p15] == nil or tick() - v_u_7[p15].LastCheck >= 10 then
			local v16 = require(v_u_2.ExtraFunctions)
			if v_u_8 == nil then
				v_u_8 = {}
				for v17, _ in next, v_u_5.Upgrades do
					v_u_8[v17] = 0
				end
			end
			v_u_7[p15] = nil
			local v18 = GetGuildInfo(p15)
			if v18 == nil or not v18:FindFirstChild("GuildUpgrades") then
				v_u_7[p15] = CloneTable(v_u_8)
			else
				v_u_7[p15] = CloneTable(v_u_8)
				local v19 = next
				local v20, v21 = v18.GuildUpgrades:GetAttributes()
				for v22, v23 in v19, v20, v21 do
					v_u_7[p15][v22] = v23
				end
			end
			v_u_7[p15].LastCheck = tick()
		end
		return v_u_7[p15]
	end,
	["GetBoost"] = function(p24, p25)
		-- upvalues: (copy) v_u_6, (copy) v_u_32
		if v_u_6[p24] == nil or tick() - v_u_6[p24].LastCheck >= 5 then
			v_u_6[p24] = {
				["LastCheck"] = tick(),
				["Coins"] = Cat.CoinsBoost(p24),
				["Exp"] = Cat.ExpBoost(p24),
				["Gems"] = Cat.GemsBoost(p24),
				["Drops"] = Cat.DropBoost(p24),
				["ShadowDamage"] = Cat.ShadowBoost(p24),
				["SwordDamage"] = Cat.SwordBoost(p24)
			}
		end
		return v_u_6[p24][p25] or 1
	end,
	["GemsBoost"] = function(p26)
		-- upvalues: (copy) v_u_32
		return (p26.leaderstats.Passes:GetAttribute("DoubleGems") == true and 2 or 1) * Cat.GetAllType("Gems", p26)
	end,
	["CoinsBoost"] = function(p27)
		-- upvalues: (copy) v_u_32
		return (p27.leaderstats.Passes:GetAttribute("DoubleCoins") == true and 2 or 1) * Cat.GetAllType("Coins", p27)
	end,
	["ExpBoost"] = function(p28)
		-- upvalues: (copy) v_u_32
		return (p28.leaderstats.Passes:GetAttribute("DoubleExp") == true and 2 or 1) * Cat.GetAllType("Exp", p28)
	end,
	["DropBoost"] = function(p29, _)
		-- upvalues: (copy) v_u_32
		return (p29.leaderstats.Passes:GetAttribute("DoubleDrops") == true and 2 or 1) * Cat.GetAllType("Drops", p29)
	end,
	["ShadowBoost"] = function(p30, _)
		-- upvalues: (copy) v_u_32
		return Cat.GetAllType("ShadowDamage", p30)
	end,
	["SwordBoost"] = function(p31, _)
		-- upvalues: (copy) v_u_32
		return Cat.GetAllType("SwordDamage", p31)
	end
}

return Cat
