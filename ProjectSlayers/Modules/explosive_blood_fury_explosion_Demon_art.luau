local v0 = {
    currentid = ""
};
local v1 = require(game.ReplicatedStorage.Modules.Client.character_handler);
local l_resume_0 = coroutine.resume;
local l_create_0 = coroutine.create;
local l_RunService_0 = game:GetService("RunService");
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
local v14 = {};
local v15 = {
    [1] = 0.19, 
    [2] = 0.47, 
    [3] = 0.58, 
    [4] = 0.7799999999999999, 
    [5] = 1.05
};
local v16 = 0;
local v17 = false;
local v18 = false;
local v19 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Global"):WaitForChild("skills_custom_add_thing"))[script.Name];
local v20 = 0;
v0.Down = function(v21) --[[ Line: 39 ]]
    -- upvalues: v17 (ref), l_LocalPlayer_0 (copy), v18 (ref), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v20 (ref), v8 (ref), v7 (copy), v14 (copy), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy), v15 (copy), v19 (copy), v16 (ref)
    if v21 == nil then
        return;
    else
        local v22 = false;
        v17 = false;
        if v21 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v23 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v23 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v23 == false then
                v23 = nil;
            end;
            if v23 == nil then
                return;
            else
                v23 = v23.Value;
                if v23 == nil then
                    return;
                else
                    v18 = false;
                    if l_get_item_health_0(v23, game.Players.LocalPlayer.Name) ~= true then
                        return;
                    else
                        local v24 = _G.generateid();
                        v0.currentid = v24;
                        if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                            if v1:Check() ~= true then
                                v17 = true;
                            end;
                            local l_Character_0 = game.Players.LocalPlayer.Character;
                            if l_Character_0 ~= nil then
                                local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                                if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(30, 0) == true then
                                    v20 = 0;
                                    _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                    _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                    _G:Initiate_C("explosive_burst_arm_eff_thingasd", l_Character_0, true, "asdgo2");
                                    v22 = true;
                                    if v17 == true then
                                        _G.can_perf_air_tang = false;
                                    end;
                                    if v17 == false then
                                        v1.Disabled = true;
                                    end;
                                    v8 = l_tick_0();
                                    if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                        for _, v29 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                            if v29:IsA("BodyVelocity") then
                                                v29:Destroy();
                                            end;
                                        end;
                                    end;
                                    local l_BoolValue_0 = Instance.new("BoolValue");
                                    l_BoolValue_0.Name = "cant_move";
                                    l_BoolValue_0.Parent = v7;
                                    game.Debris:AddItem(l_BoolValue_0, 3.22);
                                    table.insert(v14, l_BoolValue_0);
                                    local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                    l_BodyVelocity_0.MaxForce = Vector3.new(10000, 0, 10000, 0);
                                    l_BodyVelocity_0.Velocity = Vector3.new();
                                    l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                    l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                    local l_BodyGyro_0 = Instance.new("BodyGyro");
                                    l_BodyGyro_0.P = 20000;
                                    l_BodyGyro_0.MaxTorque = Vector3.new(0, 1.0000000200408773E21, 0, 0);
                                    l_BodyGyro_0.Name = "thunderclapandflashbg";
                                    l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                    l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                    l_resume_0(l_create_0(function() --[[ Line: 103 ]]
                                        -- upvalues: l_BodyGyro_0 (copy), l_BodyVelocity_0 (copy), v18 (ref), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                        while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyVelocity_0 ~= nil and l_BodyVelocity_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                            if v18 == false then
                                                l_BodyGyro_0.CFrame = l_BodyGyro_0.CFrame:Lerp(CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos()), 0.35);
                                                l_BodyVelocity_0.Velocity = l_BodyVelocity_0.Velocity:Lerp(l_BodyGyro_0.CFrame.lookVector * 21, 0.35);
                                            else
                                                l_BodyVelocity_0.Velocity = l_BodyVelocity_0.Velocity:Lerp(Vector3.new(), 0.25);
                                            end;
                                            l_RunService_0.RenderStepped:wait();
                                        end;
                                    end));
                                    for v33, v34 in pairs(v15) do
                                        l_resume_0(l_create_0(function() --[[ Line: 117 ]]
                                            -- upvalues: v34 (copy), v0 (ref), v24 (copy), v20 (ref), v19 (ref), v21 (copy), l_HumanoidRootPart_0 (copy), v33 (copy), l_Character_0 (copy), v18 (ref), v16 (ref), l_tick_0 (ref), l_resume_0 (ref), l_create_0 (ref)
                                            task.wait(v34);
                                            if v0.currentid == v24 then
                                                if _G:Stamina(5) == false or v19 <= v20 then
                                                    v0.Cancel(v21);
                                                end;
                                                if l_HumanoidRootPart_0 ~= nil then
                                                    _G:Initiate_C("Play_Sound", l_HumanoidRootPart_0, game.ReplicatedStorage.Sounds.blood_burst_fury:FindFirstChild("Sound" .. v33));
                                                end;
                                            end;
                                            if v0.currentid == v24 and l_HumanoidRootPart_0 ~= nil and l_Character_0 ~= nil then
                                                _G:Initiate_C("blood_burst_claw_effect", l_HumanoidRootPart_0, v33);
                                                if v33 ~= 5 then
                                                    game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("explsoivwe_burzt_damageasd123123", l_Character_0, l_HumanoidRootPart_0.CFrame, 7);
                                                else
                                                    v18 = true;
                                                    game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("explsoivwe_burzt_damageasd123123", l_Character_0, l_HumanoidRootPart_0.CFrame, 14, true);
                                                end;
                                            end;
                                            v20 = v20 + 1;
                                            if v33 == 5 and v0.currentid == v24 then
                                                v16 = l_tick_0();
                                                l_resume_0(l_create_0(function() --[[ Line: 145 ]]
                                                    -- upvalues: v0 (ref), v21 (ref)
                                                    v0.Up(v21);
                                                end));
                                            end;
                                        end));
                                    end;
                                    l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.blood_burst.explosive_blood_fury):Play();
                                end;
                            end;
                        end;
                        return v22;
                    end;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v35) --[[ Line: 167 ]]
    -- upvalues: v0 (copy), v18 (ref), v14 (copy), l_tick_0 (copy), v17 (ref), v1 (copy)
    if v35 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_1 = game.Players.LocalPlayer.Character;
        if l_Character_1 ~= nil then
            _G:Initiate_C("explosive_burst_arm_eff_thingasd", l_Character_1, false);
            local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
            if v18 == false and l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                for _, v40 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v40.Name == "explosive_blood_fury" then
                        v40:Stop();
                    end;
                end;
            end;
            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                for _, v42 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                    if v42.Name == "thunderclap_and_flash_bv" or v42.Name == "thunderclapandflashbg" then
                        game.Debris:AddItem(v42, 0.3);
                    end;
                end;
            end;
        end;
        if #v14 > 0 then
            for _, v44 in pairs(v14) do
                game.Debris:AddItem(v44, 0.3);
            end;
        end;
        if v35 ~= nil and v35:FindFirstChild("LastUsed") ~= nil then
            v35.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v17 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
v0.Cancel = function(v45) --[[ Line: 213 ]]
    -- upvalues: l_tick_0 (copy), v16 (ref), v0 (copy), v14 (copy), v17 (ref), v1 (copy)
    if v45 == nil then
        return;
    else
        repeat
            task.wait();
        until l_tick_0() - v16 > 0.4;
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            _G:Initiate_C("explosive_burst_arm_eff_thingasd", l_Character_2, false);
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v50 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v50.Name == "explosive_blood_fury" then
                        v50:Stop();
                    end;
                end;
            end;
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v52 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v52.Name == "thunderclap_and_flash_bv" or v52.Name == "thunderclapandflashbg" then
                        v52:Destroy();
                    end;
                end;
            end;
        end;
        if #v14 > 0 then
            for _, v54 in pairs(v14) do
                v54:Destroy();
            end;
        end;
        if v45 ~= nil and v45:FindFirstChild("LastUsed") ~= nil then
            v45.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v17 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;