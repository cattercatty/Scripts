local v0 = {
    currentid = ""
};
local v1 = require(game.ReplicatedStorage.Modules.Client.character_handler);
local _ = coroutine.resume;
local _ = coroutine.create;
local _ = game:GetService("RunService");
local _ = game.Players.LocalPlayer:GetMouse();
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v7 = game.ReplicatedStorage.PlayerValues:WaitForChild(l_LocalPlayer_0.Name);
local l_tick_0 = tick;
local l_get_item_health_0 = require(game.ReplicatedStorage.Modules.Server.Server_Modules:WaitForChild("get_item_health"));
local v10 = "";
local v11 = {
    "Stun", 
    "KnockedOut", 
    "RagDoll"
};
v7.ChildAdded:Connect(function(v12) --[[ Line: 15 ]]
    -- upvalues: v11 (copy), v10 (ref)
    if table.find(v11, v12.Name) ~= nil then
        v10 = "";
    end;
end);
local _ = TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
local _ = game:GetService("TweenService");
v0.Down = function(v15) --[[ Line: 23 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy)
    if v15 == nil then
        return;
    else
        local v16 = false;
        if v15 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("clan_skills_is_equiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("clan_skills_is_equiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("clan_skills_is_equiped", true).Parent == nil then
            return;
        else
            local v17 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("clan_skills_is_equiped", true) ~= nil then
                v17 = l_LocalPlayer_0.Character:FindFirstChild("clan_skills_is_equiped", true).Parent:FindFirstChild("Id");
            end;
            if v17 == false then
                v17 = nil;
            end;
            if v17 == nil then
                return;
            else
                v17 = v17.Value;
                if v17 == nil then
                    return;
                elseif l_get_item_health_0(v17, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    v0.currentid = _G.generateid();
                    if v1:Check() == true then
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(45) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                _G.Skills_Performance(script.Name, l_tick_0(), 2);
                                v16 = true;
                                game.ReplicatedStorage.Remotes.immense_reflexes_asd123:FireServer();
                                _G:Initiate_C("mist_breathing_shifting_flow_slash_effect2", l_Character_0);
                                if v15 ~= nil and v15:FindFirstChild("LastUsed") ~= nil then
                                    v15.LastUsed.Value = l_tick_0();
                                end;
                            end;
                        end;
                    end;
                    return v16;
                end;
            end;
        end;
    end;
end;
v0.Up = function(_) --[[ Line: 69 ]]
    return true;
end;
v0.Cancel = function(_) --[[ Line: 73 ]]
    return true;
end;
return v0;