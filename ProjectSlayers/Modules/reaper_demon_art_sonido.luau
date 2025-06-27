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
local v13 = false;
local _ = game:GetService("RunService");
local v15 = {};
v0.Down = function(v16) --[[ Line: 23 ]]
    -- upvalues: v13 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v7 (copy), v15 (copy)
    if v16 == nil then
        return;
    else
        local v17 = false;
        v13 = false;
        if v16 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v18 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v18 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v18 == false then
                v18 = nil;
            end;
            if v18 == nil then
                return;
            else
                v18 = v18.Value;
                if v18 == nil then
                    return;
                elseif l_get_item_health_0(v18, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    v0.currentid = _G.generateid();
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v13 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(15, 0) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                local l_BoolValue_0 = Instance.new("BoolValue");
                                l_BoolValue_0.Name = "Invisible2";
                                l_BoolValue_0.Parent = v7;
                                table.insert(v15, l_BoolValue_0);
                                game.Debris:AddItem(l_BoolValue_0, 5.1);
                                local l_BoolValue_1 = Instance.new("BoolValue");
                                l_BoolValue_1.Name = "reapersonidoinvisibility123asd";
                                l_BoolValue_1.Parent = v7;
                                table.insert(v15, l_BoolValue_1);
                                game.Debris:AddItem(l_BoolValue_1, 5.1);
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                local l_BoolValue_2 = Instance.new("BoolValue");
                                l_BoolValue_2.Name = "dsieapera123asd";
                                l_BoolValue_2.Parent = v7;
                                table.insert(v15, l_BoolValue_2);
                                game.Debris:AddItem(l_BoolValue_2, 5.1);
                                local l_CFrame_0 = l_HumanoidRootPart_0.CFrame;
                                _G:Initiate_C("sonido_effect", l_Character_0, l_CFrame_0, true);
                                v17 = true;
                                if v13 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                    l_HumanoidRootPart_0.air123123bp:Destroy();
                                end;
                                if v13 == false then
                                    v1.Disabled = true;
                                end;
                            end;
                        end;
                    end;
                    return v17;
                end;
            end;
        end;
    end;
end;
local v26 = 0;
local v27 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v28) --[[ Line: 97 ]]
    -- upvalues: v27 (copy), v26 (ref)
    if table.find(v27, v28.Name) ~= nil then
        v26 = "";
    end;
end);
v0.Up = function(v29) --[[ Line: 98 ]]
    -- upvalues: v26 (ref), l_tick_0 (copy), v0 (copy), v10 (ref), v15 (copy), v13 (ref), v1 (copy)
    task.wait();
    if v29 == nil then
        return;
    else
        local v30 = _G.generateid();
        v26 = v30;
        repeat
            task.wait();
        until l_tick_0() - 0 >= 0.3;
        if v30 ~= v26 then
            v0.Cancel(v29);
            return true;
        else
            v0.currentid = _G.generateid();
            v10 = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            for _, v33 in pairs(v15) do
                v33:Destroy();
            end;
            if l_Character_1 ~= nil then
                _G:Initiate_C("sonido_effect", l_Character_1, nil, false);
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    _G.Skills_Performance(script.Name, l_tick_0(), 6);
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "Cancel";
                        l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                        game.Debris:AddItem(l_thunderclapandflashbg_0, 0.3);
                    end;
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 0.3);
                    end;
                    for _, v40 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v40.Name == "black_wind" then
                            v40:AdjustSpeed(1);
                        end;
                    end;
                end;
            end;
            if v29 ~= nil and v29:FindFirstChild("LastUsed") ~= nil then
                v29.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.31);
            if v13 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v41) --[[ Line: 157 ]]
    -- upvalues: v0 (copy), v15 (copy), l_tick_0 (copy), v13 (ref), v1 (copy)
    task.wait();
    if v41 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        for _, v44 in pairs(v15) do
            v44:Destroy();
        end;
        if l_Character_2 ~= nil then
            _G.Skills_Performance(script.Name, l_tick_0(), 6);
            _G:Initiate_C("sonido_effect", l_Character_2, nil, false);
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v48 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v48.Name == "thunderclap_and_flash_bv" or v48.Name == "thunderclapandflashbg" then
                        v48:Destroy();
                    end;
                end;
                for _, v50 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v50.Name == "black_wind" then
                        v50:Stop();
                    end;
                end;
            end;
        end;
        if v41 ~= nil and v41:FindFirstChild("LastUsed") ~= nil then
            v41.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v13 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;