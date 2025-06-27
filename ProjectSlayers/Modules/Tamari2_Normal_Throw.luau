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
local v13 = false;
local l_RunService_1 = game:GetService("RunService");
v0.Down = function(v15) --[[ Line: 22 ]]
    -- upvalues: v13 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), l_resume_0 (copy), l_create_0 (copy), l_RunService_1 (copy)
    if v15 == nil then
        return;
    else
        local v16 = false;
        v13 = false;
        if v15 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v17 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v17 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
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
                    local v18 = _G.generateid();
                    v0.currentid = v18;
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
                                v16 = true;
                                if v13 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                    l_HumanoidRootPart_0.air123123bp:Destroy();
                                end;
                                if v13 == false then
                                    v1.Disabled = true;
                                end;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new();
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 20000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(1.0000000200408773E21, 1.0000000200408773E21, 1.0000000200408773E21, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 71 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_1.RenderStepped:wait();
                                    end;
                                end));
                                _G:Initiate_C("Ball_In_Hand_tamariasd123", l_Character_0, true, {
                                    "RightHand"
                                });
                                local v24 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Tamari.New_Tamari_Anims.normal_throw);
                                v24:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 81 ]]
                                    -- upvalues: v0 (ref), v18 (copy), v24 (copy)
                                    task.wait(0.15);
                                    if v0.currentid == v18 then
                                        v24:AdjustSpeed(0);
                                    end;
                                end));
                            end;
                        end;
                    end;
                    return v16;
                end;
            end;
        end;
    end;
end;
local v25 = 0;
local v26 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v27) --[[ Line: 99 ]]
    -- upvalues: v26 (copy), v25 (ref)
    if table.find(v26, v27.Name) ~= nil then
        v25 = "";
    end;
end);
v0.Up = function(v28) --[[ Line: 100 ]]
    -- upvalues: v25 (ref), l_tick_0 (copy), v0 (copy), v10 (ref), l_resume_0 (copy), l_create_0 (copy), v13 (ref), v1 (copy)
    if v28 == nil then
        return;
    else
        local v29 = _G.generateid();
        v25 = v29;
        repeat
            task.wait();
        until l_tick_0() - 0 >= 0.15;
        if v29 ~= v25 then
            v0.Cancel(v28);
            return true;
        else
            local v30 = _G.generateid();
            v0.currentid = v30;
            v10 = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    l_resume_0(l_create_0(function() --[[ Line: 115 ]]
                        -- upvalues: v0 (ref), v30 (copy), l_Character_1 (copy), l_HumanoidRootPart_1 (copy)
                        task.wait(0.085);
                        if v0.currentid == v30 then
                            _G:Initiate_C("release_ball_for_tamari", script.Name, 2, l_Character_1, l_Character_1.Name .. "'s tamari ball123asd1", "Tamari_Normal_Throw_Damage_new", (_G.getmousepos() - l_HumanoidRootPart_1.Position).Unit);
                        end;
                    end));
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
                    for _, v38 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v38.Name == "normal_throw" then
                            v38:AdjustSpeed(1);
                        end;
                    end;
                end;
            end;
            if v28 ~= nil and v28:FindFirstChild("LastUsed") ~= nil then
                v28.LastUsed.Value = l_tick_0();
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
v0.Cancel = function(v39) --[[ Line: 160 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v13 (ref), v1 (copy)
    if v39 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            _G:Initiate_C("Ball_In_Hand_tamariasd123", l_Character_2, false);
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v44 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v44.Name == "thunderclap_and_flash_bv" or v44.Name == "thunderclapandflashbg" then
                        v44:Destroy();
                    end;
                end;
                for _, v46 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v46.Name == "normal_throw" then
                        v46:Stop();
                    end;
                end;
            end;
        end;
        if v39 ~= nil and v39:FindFirstChild("LastUsed") ~= nil then
            v39.LastUsed.Value = l_tick_0();
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