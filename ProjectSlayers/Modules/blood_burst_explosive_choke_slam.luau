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
local v13 = RaycastParams.new();
v13.FilterDescendantsInstances = {
    workspace.Map
};
v13.FilterType = Enum.RaycastFilterType.Whitelist;
local l_RunService_1 = game:GetService("RunService");
local v15 = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
local l_TweenService_0 = game:GetService("TweenService");
local v17 = false;
v0.Down = function(v18) --[[ Line: 27 ]]
    -- upvalues: v17 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), l_resume_0 (copy), l_create_0 (copy), l_RunService_1 (copy)
    if v18 == nil then
        return;
    else
        v17 = false;
        local v19 = false;
        if v18 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v20 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v20 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v20 == false then
                v20 = nil;
            end;
            if v20 == nil then
                return;
            else
                v20 = v20.Value;
                if v20 == nil then
                    return;
                elseif l_get_item_health_0(v20, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v21 = _G.generateid();
                    v0.currentid = v21;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v17 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(33) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v19 = true;
                                if v17 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v17 == false then
                                    v1.Disabled = true;
                                end;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(10000, 40000, 10000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new();
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 20000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(0, 1.0000000200408773E21, 0, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 72 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_1.RenderStepped:wait();
                                    end;
                                end));
                                local v27 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.blood_burst.explosion_grab_attempt);
                                v27:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 82 ]]
                                    -- upvalues: v0 (ref), v21 (copy), v27 (copy)
                                    task.wait(0.22);
                                    if v0.currentid == v21 then
                                        v27:AdjustSpeed(0);
                                    end;
                                end));
                            end;
                        end;
                    end;
                    return v19;
                end;
            end;
        end;
    end;
end;
local v28 = 0;
local v29 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v30) --[[ Line: 100 ]]
    -- upvalues: v29 (copy), v28 (ref)
    if table.find(v29, v30.Name) ~= nil then
        v28 = "";
    end;
end);
v0.Up = function(v31) --[[ Line: 101 ]]
    -- upvalues: v28 (ref), l_tick_0 (copy), v0 (copy), v10 (ref), l_TweenService_0 (copy), v15 (copy), v17 (ref), v1 (copy)
    if v31 == nil then
        return;
    else
        local v32 = _G.generateid();
        v28 = v32;
        repeat
            task.wait();
        until l_tick_0() - 0 >= 0.22;
        if v32 ~= v28 then
            v0.Cancel(v31);
            return true;
        else
            local v33 = _G.generateid();
            v0.currentid = v33;
            v10 = _G.generateid();
            local v34 = nil;
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "Cancel";
                        l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                    end;
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        _G.Skills_Performance(script.Name, l_tick_0(), 1);
                        task.wait(0.2);
                        if v0.currentid == v33 then
                            _G:Initiate_C("slam_skill_departure", l_HumanoidRootPart_1);
                            l_thunderclap_and_flash_bv_0.Velocity = (l_HumanoidRootPart_1.CFrame.lookVector * 120 + l_HumanoidRootPart_1.CFrame.upVector * 37) * 2;
                            l_TweenService_0:Create(l_thunderclap_and_flash_bv_0, v15, {
                                Velocity = Vector3.new()
                            }):Play();
                            v34 = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("blood_burst_choke_slam_damage", l_Character_1, CFrame.new(l_HumanoidRootPart_1.Position, l_HumanoidRootPart_1.Position + (l_HumanoidRootPart_1.CFrame.lookVector * 120 + l_HumanoidRootPart_1.CFrame.upVector * 37) * 2));
                            game.Debris:AddItem(l_thunderclap_and_flash_bv_0, v34 == true and 2.25 or 0.5);
                        end;
                    end;
                    for _, v42 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v42.Name == "explosion_grab_attempt" then
                            v42:AdjustSpeed(1);
                        end;
                    end;
                    if v34 == true then
                        game.Debris:AddItem(l_thunderclapandflashbg_0, 1.3);
                    else
                        game.Debris:AddItem(l_thunderclapandflashbg_0, 0.5);
                    end;
                end;
            end;
            if v31 ~= nil and v31:FindFirstChild("LastUsed") ~= nil then
                v31.LastUsed.Value = l_tick_0();
            end;
            task.wait(v34 == true and 1.3 or 0.5);
            if v17 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v43) --[[ Line: 172 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v17 (ref), v1 (copy)
    if v43 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v48 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v48.Name == "thunderclap_and_flash_bv" or v48.Name == "thunderclapandflashbg" then
                        v48:Destroy();
                    end;
                end;
                for _, v50 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v50.Name == "explosion_grab_attempt" then
                        v50:Stop();
                    end;
                end;
            end;
        end;
        if v43 ~= nil and v43:FindFirstChild("LastUsed") ~= nil then
            v43.LastUsed.Value = l_tick_0();
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