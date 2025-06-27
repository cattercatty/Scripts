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
local l_TweenService_0 = game:GetService("TweenService");
local v14 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
local l_RunService_1 = game:GetService("RunService");
local v16 = {
    [1] = 0.65, 
    [2] = 1.08, 
    [3] = 1.52
};
local v17 = false;
v0.Down = function(v18) --[[ Line: 30 ]]
    -- upvalues: v17 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), l_resume_0 (copy), l_create_0 (copy), l_TweenService_0 (copy), v14 (copy), v16 (copy), l_RunService_1 (copy)
    if v18 == nil then
        return;
    else
        local v19 = false;
        v17 = false;
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
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(20, 0) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v19 = true;
                                if v17 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                    l_HumanoidRootPart_0.air123123bp:Destroy();
                                end;
                                if v17 == false then
                                    v1.Disabled = true;
                                end;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(40000, 40000, 40000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new(0, 0, 0, 0);
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 10000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(0, 10000, 0, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 79 ]]
                                    -- upvalues: l_HumanoidRootPart_0 (copy), v0 (ref), v21 (copy), l_BodyVelocity_0 (copy), l_TweenService_0 (ref), v14 (ref)
                                    task.wait(0.25);
                                    _G:Initiate_C("final_go_in_air_wind", l_HumanoidRootPart_0.CFrame, l_HumanoidRootPart_0);
                                    if v0.currentid == v21 then
                                        l_BodyVelocity_0.Velocity = Vector3.new(0, 50, 0, 0);
                                        task.wait(0.3);
                                        if v0.currentid == v21 then
                                            l_TweenService_0:Create(l_BodyVelocity_0, v14, {
                                                Velocity = Vector3.new()
                                            }):Play();
                                        end;
                                    end;
                                end));
                                for v27 = 1, 3 do
                                    l_resume_0(l_create_0(function() --[[ Line: 92 ]]
                                        -- upvalues: v16 (ref), v27 (copy), v0 (ref), v21 (copy), l_Character_0 (copy), l_HumanoidRootPart_0 (copy), v18 (copy)
                                        task.wait(v16[v27]);
                                        if v0.currentid == v21 then
                                            if _G:StamBreath(5, 0) == true then
                                                if v27 == 1 then
                                                    _G:Initiate_C("Ball_In_Hand_tamariasd123", l_Character_0, true, {
                                                        "RightHand"
                                                    });
                                                end;
                                                if v27 == 2 then
                                                    _G:Initiate_C("Ball_In_Hand_tamariasd123", l_Character_0, true, {
                                                        "LeftHand"
                                                    });
                                                end;
                                                if v27 == 3 then
                                                    _G:Initiate_C("Ball_In_Hand_tamariasd123", l_Character_0, true, {
                                                        "RightHand"
                                                    });
                                                end;
                                                task.wait(0.1);
                                                _G:Initiate_C("release_ball_for_tamari", script.Name, 2, l_Character_0, l_Character_0.Name .. "'s tamari ball123asd1", "Tamari_Multi_throw_damage3triplethrowasd", (_G.getmousepos() - l_HumanoidRootPart_0.Position).Unit);
                                                return;
                                            else
                                                v0.Up(v18);
                                            end;
                                        end;
                                    end));
                                end;
                                l_resume_0(l_create_0(function() --[[ Line: 114 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_1.RenderStepped:wait();
                                    end;
                                end));
                                l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Tamari.Tamari_Multi_Shots):Play();
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
v7.ChildAdded:Connect(function(v30) --[[ Line: 137 ]]
    -- upvalues: v29 (copy), v28 (ref)
    if table.find(v29, v30.Name) ~= nil then
        v28 = "";
    end;
end);
v0.Up = function(v31) --[[ Line: 138 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v17 (ref), v1 (copy)
    if v31 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_1 = game.Players.LocalPlayer.Character;
        if l_Character_1 ~= nil then
            _G:Initiate_C("Ball_In_Hand_tamariasd123", l_Character_1, false);
            local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                for _, v36 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                    if v36.Name == "thunderclap_and_flash_bv" or v36.Name == "thunderclapandflashbg" then
                        v36:Destroy();
                    end;
                end;
                for _, v38 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v38.Name == "Tamari_Multi_Shots" and v38.TimePosition < 1.9 then
                        v38:Stop();
                    end;
                end;
            end;
        end;
        if v31 ~= nil and v31:FindFirstChild("LastUsed") ~= nil then
            v31.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v17 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
v0.Cancel = function(v39) --[[ Line: 175 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v17 (ref), v1 (copy)
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
                    if v46.Name == "Tamari_Multi_Shots" then
                        v46:Stop();
                    end;
                end;
            end;
        end;
        if v39 ~= nil and v39:FindFirstChild("LastUsed") ~= nil then
            v39.LastUsed.Value = l_tick_0();
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