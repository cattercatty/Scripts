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
v0.Down = function(v16) --[[ Line: 22 ]]
    -- upvalues: v14 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), l_resume_0 (copy), l_create_0 (copy)
    if v16 == nil then
        return;
    else
        local v17 = false;
        v14 = false;
        if v16 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent == nil then
            return;
        else
            local v18 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil then
                v18 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id");
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
                    local v19 = _G.generateid();
                    v0.currentid = v19;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v14 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(0, 20) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                v17 = true;
                                if v14 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v14 == false then
                                    v1.Disabled = true;
                                end;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new();
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                v8 = l_tick_0();
                                local v24 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Sound.explosive_impact);
                                v24:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 82 ]]
                                    -- upvalues: v0 (ref), v19 (copy), l_Character_0 (copy), l_HumanoidRootPart_0 (copy), v24 (copy)
                                    task.wait(0.15);
                                    if v0.currentid == v19 then
                                        _G:Initiate_C("ExplosiveImpact_effect", l_Character_0, "Startup");
                                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("sound_breathing_explosive_impact_damage", l_Character_0, l_HumanoidRootPart_0.CFrame);
                                    end;
                                    task.wait(0.35);
                                    if v0.currentid == v19 then
                                        v24:AdjustSpeed(0);
                                    end;
                                end));
                            end;
                        end;
                    end;
                    return v17;
                end;
            end;
        end;
    end;
end;
local v25 = 0;
local v26 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v27) --[[ Line: 105 ]]
    -- upvalues: v26 (copy), v25 (ref)
    if table.find(v26, v27.Name) ~= nil then
        v25 = "";
    end;
end);
v0.Up = function(v28) --[[ Line: 106 ]]
    -- upvalues: v25 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v11 (ref), v14 (ref), v1 (copy)
    if v28 == nil then
        return;
    else
        local v29 = _G.generateid();
        v25 = v29;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.5;
        if v29 ~= v25 then
            v0.Cancel(v28);
            return true;
        else
            local v30 = _G.generateid();
            v0.currentid = v30;
            v11 = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    for _, v35 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v35.Name == "explosive_impact" then
                            v35:AdjustSpeed(1);
                        end;
                    end;
                    task.spawn(function() --[[ Line: 128 ]]
                        -- upvalues: l_tick_0 (ref), v0 (ref), v30 (copy), v25 (ref), v29 (copy), l_Character_1 (copy), l_HumanoidRootPart_1 (copy)
                        _G.Skills_Performance(script.Name, l_tick_0(), 2);
                        task.wait(0.1);
                        task.delay(0.065, function() --[[ Line: 131 ]]
                            -- upvalues: v0 (ref), v30 (ref), v25 (ref), v29 (ref), l_Character_1 (ref)
                            if v0.currentid == v30 and v25 == v29 then
                                _G:Initiate_C("ExplosiveImpact_effect", l_Character_1, "Slash");
                            end;
                        end);
                        if game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("sound_breathing_explosive_impact_damage2", l_Character_1, l_HumanoidRootPart_1.CFrame) == true then
                            _G:Initiate_C("ExplosiveImpact_effect", l_Character_1, "Explosion");
                        end;
                    end);
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "Cancel";
                        l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                        game.Debris:AddItem(l_thunderclapandflashbg_0, 0.25);
                    end;
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 0.25);
                    end;
                end;
            end;
            if v28 ~= nil and v28:FindFirstChild("LastUsed") ~= nil then
                v28.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            if v14 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v39) --[[ Line: 176 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v14 (ref), v1 (copy)
    if v39 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v44 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v44.Name == "thunderclap_and_flash_bv" or v44.Name == "thunderclapandflashbg" then
                        v44:Destroy();
                    end;
                end;
                for _, v46 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v46.Name == "explosive_impact" then
                        v46:Stop();
                    end;
                end;
            end;
        end;
        if v39 ~= nil and v39:FindFirstChild("LastUsed") ~= nil then
            v39.LastUsed.Value = l_tick_0();
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