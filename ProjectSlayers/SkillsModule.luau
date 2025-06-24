local module;

if getrenv then
	module = getrenv()._G.skills_modules_thing;
elseif require then
	local l_Parent_0 = game:GetService("Players").LocalPlayer.PlayerScripts.Skills_Modules;
	local skills_modules_thing = {};
	for _, v5 in pairs(l_Parent_0:GetDescendants()) do
		if v5:IsA("ModuleScript") and skills_modules_thing[v5.Name] == nil then
			skills_modules_thing[v5.Name] = require(v5);
		end;
	end;
	l_Parent_0.DescendantAdded:Connect(function(v6)
		if v6:IsA("ModuleScript") and skills_modules_thing[v6.Name] == nil then
			skills_modules_thing[v6.Name] = require(v6);
		end;
	end);
	module = skills_modules_thing;
end;

return module;
