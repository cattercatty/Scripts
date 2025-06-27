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
local _ = game:GetService("TweenService");
local _ = TweenInfo.new(0.03, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true, 0);
local l_get_item_health_0 = require(game.ReplicatedStorage.Modules.Server.Server_Modules:WaitForChild("get_item_health"));
local function v29(v13, v14, v15, v16) --[[ Line: 13 ]] --[[ Name: beamProjectile ]]
    local v17 = 0.5 * v13 * v16 * v16 + v14 * v16 + v15;
    local v18 = v17 - (v13 * v16 * v16 + v14 * v16) / 3;
    local v19 = (0.125 * v13 * v16 * v16 + 0.5 * v14 * v16 + v15 - 0.125 * (v15 + v17)) / 0.375 - v18;
    local l_magnitude_0 = (v19 - v15).magnitude;
    local l_magnitude_1 = (v18 - v17).magnitude;
    local l_unit_0 = (v15 - v17).unit;
    local l_unit_1 = (v19 - v15).unit;
    local l_unit_2 = l_unit_1:Cross(l_unit_0).unit;
    local l_unit_3 = (v18 - v17).unit;
    local l_unit_4 = l_unit_3:Cross(l_unit_0).unit;
    l_unit_0 = l_unit_2:Cross(l_unit_1).unit;
    local v27 = CFrame.new(v15.x, v15.y, v15.z, l_unit_1.x, l_unit_2.x, l_unit_0.x, l_unit_1.y, l_unit_2.y, l_unit_0.y, l_unit_1.z, l_unit_2.z, l_unit_0.z);
    local v28 = CFrame.new(v17.x, v17.y, v17.z, l_unit_3.x, l_unit_4.x, l_unit_0.x, l_unit_3.y, l_unit_4.y, l_unit_0.y, l_unit_3.z, l_unit_4.z, l_unit_0.z);
    return l_magnitude_0, -l_magnitude_1, v27, v28, v19, v18, v17;
end;
Lerp = function(v30, v31, v32) --[[ Line: 48 ]] --[[ Name: Lerp ]]
    return v30 + (v31 - v30) * v32;
end;
local v33 = "";
local v34 = {
    "Stun", 
    "KnockedOut", 
    "RagDoll"
};
v7.ChildAdded:Connect(function(v35) --[[ Line: 55 ]]
    -- upvalues: v34 (copy), v33 (ref)
    if table.find(v34, v35.Name) ~= nil then
        v33 = "";
    end;
end);
local v36 = false;
v0.Down = function(v37) --[[ Line: 61 ]]
    -- upvalues: v36 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), l_resume_0 (copy), l_create_0 (copy), v29 (copy), l_RunService_0 (copy)
    local v38 = false;
    v36 = false;
    if v37 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
        return;
    elseif l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent == nil then
        return;
    else
        local l_Id_0 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id");
        if l_Id_0 == nil then
            return;
        else
            l_Id_0 = l_Id_0.Value;
            if l_Id_0 == nil then
                return;
            elseif l_get_item_health_0(l_Id_0, game.Players.LocalPlayer.Name) ~= true then
                return;
            else
                local v40 = _G.generateid();
                v0.currentid = v40;
                if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                    if v1:Check() ~= true then
                        v36 = true;
                    end;
                    local l_Character_0 = game.Players.LocalPlayer.Character;
                    if l_Character_0 ~= nil then
                        local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                        local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                        if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(30, 35) then
                            _G.Skills_Performance(script.Name, l_tick_0(), 5);
                            v38 = true;
                            if v36 == true then
                                _G.can_perf_air_tang = false;
                            end;
                            if v36 == false then
                                v1.Disabled = true;
                            end;
                            if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                l_HumanoidRootPart_0.air123123bp:Destroy();
                            end;
                            v8 = l_tick_0();
                            v1.Disabled = true;
                            if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                for _, v45 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                    if v45:IsA("BodyVelocity") then
                                        v45:Destroy();
                                    end;
                                end;
                            end;
                            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                            l_BodyVelocity_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                            l_BodyVelocity_0.Velocity = Vector3.new();
                            l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                            l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                            local l_BodyGyro_0 = Instance.new("BodyGyro");
                            l_BodyGyro_0.P = 20000;
                            l_BodyGyro_0.MaxTorque = Vector3.new(0, 1.0000000200408773E21, 0, 0);
                            l_BodyGyro_0.Name = "thunderclapandflashbg";
                            local v48 = game.ReplicatedStorage.Assets.water_fall_basin_stuff.Part.water_fall_basin_at1:Clone();
                            v48.Parent = l_HumanoidRootPart_0;
                            local v49 = game.ReplicatedStorage.Assets.water_fall_basin_stuff.Part.water_fall_basin_at2:Clone();
                            v49.Parent = l_HumanoidRootPart_0;
                            local v50 = game.ReplicatedStorage.Assets.water_fall_basin_stuff.Part.Beam:Clone();
                            v50.Parent = l_HumanoidRootPart_0;
                            v50.Attachment0 = v48;
                            v50.Attachment1 = v49;
                            local v51 = game.ReplicatedStorage.Assets.water_fall_basin_stuff.water_fall_basin_3123:Clone();
                            v51.Parent = l_HumanoidRootPart_0;
                            v51.BillboardGui.Enabled = true;
                            game.Debris:AddItem(v48, 6);
                            game.Debris:AddItem(v49, 6);
                            game.Debris:AddItem(v50, 6);
                            game.Debris:AddItem(v51, 6);
                            l_resume_0(l_create_0(function() --[[ Line: 125 ]]
                                -- upvalues: v48 (copy), v49 (copy), l_HumanoidRootPart_0 (copy), v51 (copy), v50 (copy), v29 (ref)
                                while v48 ~= nil and v49 ~= nil and l_HumanoidRootPart_0 ~= nil and l_HumanoidRootPart_0:IsDescendantOf(workspace) and v48.Parent ~= nil and v49.Parent ~= nil and v51 ~= nil and v51.Parent ~= nil and l_HumanoidRootPart_0 ~= nil and l_HumanoidRootPart_0.Parent ~= nil and v50 ~= nil and v50.Parent ~= nil do
                                    local v52 = Vector3.new(0, -(game.Workspace.Gravity * 0.5), 0);
                                    local v53 = l_HumanoidRootPart_0.CFrame * Vector3.new(0, 2, -2, 0);
                                    local v54 = (_G.getmousepos(50, nil, nil, nil, nil, l_HumanoidRootPart_0.Position) - v53 - 0.5 * v52 * 0.94 * 0.94) / 0.94;
                                    local v55, v56, v57, v58 = v29(v52, v54, v53, 0.94);
                                    v50.CurveSize0 = v55;
                                    v50.CurveSize1 = v56;
                                    v51.CFrame = v58;
                                    v48.CFrame = v48.Parent.CFrame:inverse() * v57;
                                    v49.CFrame = v49.Parent.CFrame:inverse() * v58;
                                    game["Run Service"].RenderStepped:wait();
                                end;
                            end));
                            l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                            l_resume_0(l_create_0(function() --[[ Line: 143 ]]
                                -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil and l_BodyGyro_0:IsDescendantOf(workspace) do
                                    l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos(50, nil, nil, nil, nil, l_HumanoidRootPart_0.Position));
                                    l_RunService_0.RenderStepped:wait();
                                end;
                            end));
                            _G:Initiate_C("sword_trail_eff_for_flame", l_Character_0, true);
                            local v59 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Flame.Blazing_Universe);
                            v59.Priority = Enum.AnimationPriority.Action4;
                            v59:Play();
                            l_resume_0(l_create_0(function() --[[ Line: 153 ]]
                                -- upvalues: v0 (ref), v40 (copy), v59 (copy)
                                task.wait(0.3);
                                if v0.currentid == v40 then
                                    v59:AdjustSpeed(0);
                                end;
                            end));
                        end;
                    end;
                end;
                return v38;
            end;
        end;
    end;
end;
local function _(v60, v61, v62) --[[ Line: 170 ]] --[[ Name: lerp ]]
    return v60 + (v61 - v60) * v62;
end;
local _ = math.random;
local v65 = RaycastParams.new();
v65.FilterDescendantsInstances = {
    workspace.Map
};
v65.FilterType = Enum.RaycastFilterType.Whitelist;
local v66 = 0;
local v67 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v68) --[[ Line: 177 ]]
    -- upvalues: v67 (copy), v66 (ref)
    if table.find(v67, v68.Name) ~= nil then
        v66 = "";
    end;
end);
v0.Up = function(v69) --[[ Line: 178 ]]
    -- upvalues: v66 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v33 (ref), v29 (copy), v65 (copy), v7 (copy), v36 (ref), v1 (copy)
    if v69 == nil then
        return;
    else
        local v70 = _G.generateid();
        v66 = v70;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.3;
        if v70 ~= v66 then
            v0.Cancel(v69);
            return true;
        else
            _G.Skills_Performance(script.Name, l_tick_0(), 1);
            local v71 = _G.generateid();
            v0.currentid = v71;
            local l_Character_1 = game.Players.LocalPlayer.Character;
            local v73 = _G.generateid();
            v33 = v73;
            if l_Character_1 ~= nil then
                task.spawn(function() --[[ Line: 191 ]]
                    -- upvalues: l_Character_1 (copy)
                    task.wait(0.6);
                    _G:Initiate_C("sword_trail_eff_for_flame", l_Character_1, false);
                end);
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    if l_HumanoidRootPart_1:FindFirstChild("water_fall_basin_at1") ~= nil then
                        l_HumanoidRootPart_1.water_fall_basin_at1:Destroy();
                    end;
                    if l_HumanoidRootPart_1:FindFirstChild("water_fall_basin_at2") ~= nil then
                        l_HumanoidRootPart_1.water_fall_basin_at2:Destroy();
                    end;
                    if l_HumanoidRootPart_1:FindFirstChild("water_fall_basin_3123") ~= nil then
                        l_HumanoidRootPart_1.water_fall_basin_3123:Destroy();
                    end;
                    for _, v77 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v77.Name == "Blazing_Universe" or v77.Name == "water_fall_basin_loop" then
                            v77:AdjustSpeed(1);
                        end;
                    end;
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        if l_Humanoid_1 ~= nil then
                            l_Humanoid_1:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false);
                            l_Humanoid_1:SetStateEnabled(Enum.HumanoidStateType.Freefall, false);
                        end;
                        local v80 = Vector3.new(0, -game.Workspace.Gravity, 0);
                        local v81 = l_HumanoidRootPart_1.CFrame * Vector3.new(0, 2, -2, 0);
                        local v82 = (_G.getmousepos(50, nil, nil, nil, nil, l_HumanoidRootPart_1.Position) - v81 - 0.5 * v80 * 1 * 1) / 1;
                        local _, _, _, _, v87, v88, v89 = v29(v80, v82, v81, 1);
                        v89 = l_HumanoidRootPart_1.Position;
                        v87 = _G.getmousepos(50, nil, nil, nil, nil, l_HumanoidRootPart_1.Position);
                        local v90 = v87 + Vector3.new(0, 10, 0, 0);
                        local _ = Vector3.new(0, -40, 0, 0);
                        local v92 = workspace:Raycast(v90, Vector3.new(0, -40, 0, 0), v65);
                        if v92 ~= nil and v92.Instance ~= nil then
                            v87 = v92.Position;
                        end;
                        if l_HumanoidRootPart_1:FindFirstChild("air123123bp") ~= nil then
                            l_HumanoidRootPart_1.air123123bp:Destroy();
                        end;
                        local l_BodyPosition_0 = Instance.new("BodyPosition");
                        if l_thunderclap_and_flash_bv_0 ~= nil then
                            l_thunderclap_and_flash_bv_0:Destroy();
                        end;
                        l_BodyPosition_0.MaxForce = Vector3.new(20000, 40000, 20000, 0);
                        l_BodyPosition_0.P = 250000;
                        l_BodyPosition_0.D = 2500;
                        l_BodyPosition_0.Position = l_HumanoidRootPart_1.Position;
                        l_BodyPosition_0.Parent = l_HumanoidRootPart_1;
                        local l_BoolValue_0 = Instance.new("BoolValue");
                        l_BoolValue_0.Name = "FloorStand";
                        l_BoolValue_0.Parent = v7;
                        game.Debris:AddItem(l_BoolValue_0, 2);
                        local l_BoolValue_1 = Instance.new("BoolValue");
                        l_BoolValue_1.Name = "Cancel";
                        l_BoolValue_1.Parent = l_thunderclapandflashbg_0;
                        _G:Initiate_C("Flame_Up_Tang", l_HumanoidRootPart_1);
                        if v33 == v73 and v0.currentid == v71 and l_HumanoidRootPart_1 ~= nil then
                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("flame_eruption_damage", l_Character_1, l_HumanoidRootPart_1.CFrame, 1);
                        end;
                        local v96 = false;
                        for v97 = 1, 22 do
                            if v73 == v33 then
                                local v98 = v97 / 22;
                                local l_v89_0 = v89;
                                local v100 = l_v89_0 + (v88 - l_v89_0) * v98;
                                l_BodyPosition_0.Position = v100 + (v88 + (v87 - v88) * v98 - v100) * v98 + Vector3.new(0, 3, 0, 0);
                                task.wait(0.0085);
                            else
                                v96 = true;
                                break;
                            end;
                        end;
                        if l_BoolValue_0 ~= nil then
                            l_BoolValue_0:Destroy();
                        end;
                        if l_HumanoidRootPart_1 ~= nil and l_HumanoidRootPart_1.Parent ~= nil and v96 == false then
                            _G.Skills_Performance(script.Name, tick(), 2);
                            local v101 = l_HumanoidRootPart_1.CFrame * CFrame.new(0, 0, 0);
                            local v102 = v101.p + Vector3.new(0, 1, 0, 0);
                            local _ = Vector3.new(0, -15, 0, 0);
                            local v104 = workspace:Raycast(v102, Vector3.new(0, -15, 0, 0), v65);
                            if v104 ~= nil and v104.Instance ~= nil then
                                local v105 = v101 - v101.p;
                                v101 = CFrame.new(v104.Position + Vector3.new(0, 3, 0, 0)) * v105;
                            end;
                            task.wait(0.05);
                            if l_HumanoidRootPart_1 ~= nil then
                                _G:Initiate_C("flame_eruption_end", l_HumanoidRootPart_1);
                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("flame_eruption_damage", l_Character_1, v101, 2);
                            end;
                        end;
                        for _, v107 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                            if v107.Name == "Blazing_Universe" or v107.Name == "water_fall_basin_loop" then
                                v107:Stop();
                            end;
                        end;
                        if v96 == false then
                            local v108 = l_Humanoid_1:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Flame.Blazing_Universe_end);
                            v108.Priority = Enum.AnimationPriority.Action4;
                            v108:Play();
                            task.wait(0.25);
                        end;
                        if l_BodyPosition_0 ~= nil then
                            l_BodyPosition_0:Destroy();
                        end;
                        if l_thunderclapandflashbg_0 ~= nil then
                            l_thunderclapandflashbg_0:Destroy();
                        end;
                        if l_Humanoid_1 ~= nil then
                            l_Humanoid_1:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true);
                            l_Humanoid_1:SetStateEnabled(Enum.HumanoidStateType.Freefall, true);
                            if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                                l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                            end;
                        end;
                    end;
                end;
            end;
            if v69 ~= nil and v69:FindFirstChild("LastUsed") ~= nil then
                v69.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            if v36 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v109) --[[ Line: 344 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v36 (ref), v1 (copy)
    if v109 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            _G:Initiate_C("sword_trail_eff_for_flame", l_Character_2, false);
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                if l_HumanoidRootPart_2:FindFirstChild("water_fall_basin_at1") ~= nil then
                    l_HumanoidRootPart_2.water_fall_basin_at1:Destroy();
                end;
                if l_HumanoidRootPart_2:FindFirstChild("water_fall_basin_at2") ~= nil then
                    l_HumanoidRootPart_2.water_fall_basin_at2:Destroy();
                end;
                if l_HumanoidRootPart_2:FindFirstChild("water_fall_basin_3123") ~= nil then
                    l_HumanoidRootPart_2.water_fall_basin_3123:Destroy();
                end;
                for _, v114 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v114.Name == "thunderclap_and_flash_bv" or v114.Name == "thunderclapandflashbg" then
                        v114:Destroy();
                    end;
                end;
                for _, v116 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v116.Name == "Blazing_Universe" or v116.Name == "water_fall_basin_loop" then
                        v116:Stop();
                    end;
                end;
            end;
        end;
        if v109 ~= nil and v109:FindFirstChild("LastUsed") ~= nil then
            v109.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v36 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;