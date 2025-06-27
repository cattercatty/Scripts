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
local v8 = 0;
local l_tick_0 = tick;
local l_get_item_health_0 = require(game.ReplicatedStorage.Modules.Server.Server_Modules:WaitForChild("get_item_health"));
local v11 = "";
local v12 = {
    "Stun", 
    "KnockedOut", 
    "RagDoll"
};
v7.ChildAdded:Connect(function(v13) --[[ Line: 15 ]]
    -- upvalues: v12 (copy), v11 (ref)
    if table.find(v12, v13.Name) ~= nil then
        v11 = "";
    end;
end);
local v14 = false;
local _ = game:GetService("RunService");
local v16 = {};
local v17 = false;
local v18 = 0;
local v19 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v20) --[[ Line: 24 ]]
    -- upvalues: v19 (copy), v18 (ref)
    if table.find(v19, v20.Name) ~= nil then
        v18 = "";
    end;
end);
local v21 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Global"):WaitForChild("skills_custom_add_thing"))[script.Name];
local v22 = 0;
v0.Down = function(v23) --[[ Line: 32 ]]
    -- upvalues: v14 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v7 (copy), v16 (copy), v17 (ref), v22 (ref), v18 (ref), v8 (ref), v21 (copy)
    if v23 == nil then
        return;
    else
        local v24 = false;
        v14 = false;
        if v23 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent == nil then
            return;
        else
            local v25 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil then
                v25 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v25 == false then
                v25 = nil;
            end;
            if v25 == nil then
                return;
            else
                v25 = v25.Value;
                if v25 == nil then
                    return;
                elseif l_get_item_health_0(v25, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v26 = _G.generateid();
                    v0.currentid = v26;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v14 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(10, 20) == true then
                                _G:Initiate_C("SnowBreathingPathStartup", l_Character_0);
                                task.delay(0.2, function() --[[ Line: 60 ]]
                                    -- upvalues: v0 (ref), v26 (copy), l_Character_0 (copy)
                                    if v0.currentid == v26 then
                                        _G:Initiate_C("SnowBreathingPathLoop", l_Character_0, true);
                                    end;
                                end);
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                local l_BoolValue_0 = Instance.new("BoolValue");
                                l_BoolValue_0.Name = "Invisible2";
                                l_BoolValue_0.Parent = v7;
                                table.insert(v16, l_BoolValue_0);
                                game.Debris:AddItem(l_BoolValue_0, 5.1);
                                local l_BoolValue_1 = Instance.new("BoolValue");
                                l_BoolValue_1.Name = "dsieapera123asd";
                                l_BoolValue_1.Parent = v7;
                                local l_BoolValue_2 = Instance.new("BoolValue");
                                l_BoolValue_2.Name = "Frost_path_tang123asd";
                                l_BoolValue_2.Parent = v7;
                                game.Debris:AddItem(l_BoolValue_2, 5.1);
                                table.insert(v16, l_BoolValue_1);
                                game.Debris:AddItem(l_BoolValue_1, 5.1);
                                v17 = true;
                                v22 = 0;
                                local _ = l_HumanoidRootPart_0.CFrame;
                                v18 = _G.generateid();
                                local v34 = false;
                                v8 = l_tick_0();
                                do
                                    local l_v34_0 = v34;
                                    task.spawn(function() --[[ Line: 93 ]]
                                        -- upvalues: v26 (copy), v0 (ref), v7 (ref), v22 (ref), v21 (ref), l_Character_0 (copy), l_HumanoidRootPart_0 (copy), l_v34_0 (ref), v17 (ref), v23 (copy)
                                        for _ = 1, 25 do
                                            if v26 == v0.currentid and v7 ~= nil and game.Players.LocalPlayer ~= nil and game.Players.LocalPlayer.Character ~= nil and v22 < v21 and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and v7:FindFirstChild("Stamina") ~= nil and v7.Stamina.Value > 1 then
                                                _G:RemoveStam(1);
                                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("snow_breathing_frost_path_damage", l_Character_0, l_HumanoidRootPart_0.CFrame);
                                                wait(0.25);
                                            else
                                                l_v34_0 = true;
                                                if v17 == true then
                                                    v0.Up(v23);
                                                    return;
                                                else
                                                    break;
                                                end;
                                            end;
                                        end;
                                    end);
                                    v24 = true;
                                    if v14 == true then
                                        _G.can_perf_air_tang = false;
                                    end;
                                    if v14 == false then
                                        v1.Disabled = true;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    return v24;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v37) --[[ Line: 131 ]]
    -- upvalues: v17 (ref), v18 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v11 (ref), v16 (copy), v14 (ref), v1 (copy)
    task.wait();
    if v37 == nil then
        return;
    elseif v17 == false then
        return true;
    else
        v17 = false;
        local v38 = _G.generateid();
        v18 = v38;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.3;
        if v38 ~= v18 then
            v0.Cancel(v37);
            return true;
        else
            v0.currentid = _G.generateid();
            v11 = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            for _, v41 in pairs(v16) do
                v41:Destroy();
            end;
            if l_Character_1 ~= nil then
                _G:Initiate_C("SnowBreathingPathLoop", l_Character_1, false);
                _G:Initiate_C("SnowBreathingPathEnd", l_Character_1);
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("snow_breathing_frost_path_damage2", l_Character_1, l_HumanoidRootPart_1.CFrame);
                    l_Humanoid_1:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Snow.Frost_Path_Exist):Play();
                    _G.Skills_Performance(script.Name, l_tick_0(), 6);
                    _G.Skills_Performance(script.Name, l_tick_0(), 991);
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
                    for _, v48 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v48.Name == "black_wind" then
                            v48:AdjustSpeed(1);
                        end;
                    end;
                end;
            end;
            if v37 ~= nil and v37:FindFirstChild("LastUsed") ~= nil then
                v37.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.31);
            if v14 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v49) --[[ Line: 196 ]]
    -- upvalues: v17 (ref), v0 (copy), v16 (copy), l_tick_0 (copy), v14 (ref), v1 (copy)
    task.wait();
    if v49 == nil then
        return;
    elseif v17 == false then
        return true;
    else
        v17 = false;
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        for _, v52 in pairs(v16) do
            v52:Destroy();
        end;
        if l_Character_2 ~= nil then
            _G:Initiate_C("SnowBreathingPathLoop", l_Character_2, false);
            _G:Initiate_C("SnowBreathingPathEnd", l_Character_2);
            _G.Skills_Performance(script.Name, l_tick_0(), 6);
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                _G.Skills_Performance(script.Name, l_tick_0(), 991);
                for _, v56 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v56.Name == "thunderclap_and_flash_bv" or v56.Name == "thunderclapandflashbg" then
                        v56:Destroy();
                    end;
                end;
                for _, v58 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v58.Name == "black_wind" then
                        v58:Stop();
                    end;
                end;
            end;
        end;
        if v49 ~= nil and v49:FindFirstChild("LastUsed") ~= nil then
            v49.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v14 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;