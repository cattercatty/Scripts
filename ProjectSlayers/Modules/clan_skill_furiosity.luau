local v0 = {
    currentid = ""
};
local v1 = require(game.ReplicatedStorage.Modules.Client.character_handler);
local l_resume_0 = coroutine.resume;
local l_create_0 = coroutine.create;
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
local v15 = nil;
local v16 = 0;
local v17 = false;
Clear = function() --[[ Line: 25 ]] --[[ Name: Clear ]]
    -- upvalues: v17 (ref), l_LocalPlayer_0 (copy)
    if v17 == true and l_LocalPlayer_0 ~= nil and l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart") ~= nil and l_LocalPlayer_0.Character.HumanoidRootPart:FindFirstChild("clan_furiosity_skill123asd") ~= nil then
        v17 = false;
        if game.Players.LocalPlayer ~= nil and game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
            local l_HumanoidRootPart_0 = game.Players.LocalPlayer.Character.HumanoidRootPart;
            _G:Initiate_C("furiosity_activation123asd", l_HumanoidRootPart_0.CFrame, l_HumanoidRootPart_0);
        end;
        game.ReplicatedStorage.Remotes.clan_furiosity_add:FireServer(false);
    end;
end;
game:GetService("UserInputService").InputBegan:Connect(function(v19, v20) --[[ Line: 43 ]]
    -- upvalues: v15 (ref), l_LocalPlayer_0 (copy), v17 (ref), l_tick_0 (copy), v16 (ref)
    if v20 == false and v15 ~= nil and v19.KeyCode.Name == game.ReplicatedStorage.Player_Data:FindFirstChild(l_LocalPlayer_0.Name).Keys:FindFirstChild(v15)["2"].Value and v17 == true and l_tick_0() - v16 > 1 then
        Clear();
    end;
end);
game.ReplicatedStorage:WaitForChild("mobile_tap_events"):WaitForChild("mobile_skill_tap").Event:Connect(function(v21) --[[ Line: 52 ]]
    -- upvalues: l_tick_0 (copy), v16 (ref)
    if v21 == "Furiosity" and l_tick_0() - v16 > 1 then
        Clear();
    end;
end);
v0.Down = function(v22) --[[ Line: 60 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v16 (ref), v17 (ref), v15 (ref), l_resume_0 (copy), l_create_0 (copy)
    if v22 == nil then
        return;
    else
        local v23 = false;
        if v22 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("clan_skills_is_equiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("clan_skills_is_equiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("clan_skills_is_equiped", true).Parent == nil then
            return;
        else
            local v24 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("clan_skills_is_equiped", true) ~= nil then
                v24 = l_LocalPlayer_0.Character:FindFirstChild("clan_skills_is_equiped", true).Parent:FindFirstChild("Id");
            end;
            if v24 == false then
                v24 = nil;
            end;
            if v24 == nil then
                return;
            else
                v24 = v24.Value;
                if v24 == nil then
                    return;
                elseif l_get_item_health_0(v24, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    v0.currentid = _G.generateid();
                    if v1:Check() == true then
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_1 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(45) == true and l_HumanoidRootPart_1:FindFirstChild("clan_furiosity_skill123asd") == nil then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                _G.Skills_Performance(script.Name, l_tick_0(), 2);
                                v23 = true;
                                v16 = l_tick_0();
                                v17 = true;
                                v15 = v22.Equiped_Key.Value;
                                _G:Initiate_C("furiosity_activation123asd", l_HumanoidRootPart_1.CFrame, l_HumanoidRootPart_1);
                                game.ReplicatedStorage.Remotes.clan_furiosity_add:FireServer(true);
                                l_resume_0(l_create_0(function() --[[ Line: 113 ]]
                                    -- upvalues: v17 (ref)
                                    wait(17);
                                    if v17 == true then
                                        Clear();
                                    end;
                                end));
                                if v22 ~= nil and v22:FindFirstChild("LastUsed") ~= nil then
                                    v22.LastUsed.Value = l_tick_0();
                                end;
                            end;
                        end;
                    end;
                    return v23;
                end;
            end;
        end;
    end;
end;
v0.Up = function(_) --[[ Line: 139 ]]
    return true;
end;
v0.Cancel = function(_) --[[ Line: 143 ]]
    return true;
end;
return v0;