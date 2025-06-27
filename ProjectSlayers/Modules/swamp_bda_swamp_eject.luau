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
local v37 = {};
v0.Down = function(v38) --[[ Line: 62 ]]
    -- upvalues: v36 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), v7 (copy), v37 (copy), l_resume_0 (copy), l_create_0 (copy), v29 (copy), l_RunService_0 (copy)
    local v39 = false;
    v36 = false;
    if v38 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
        return;
    elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
        return;
    else
        local l_Id_0 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
        if l_Id_0 == nil then
            return;
        else
            l_Id_0 = l_Id_0.Value;
            if l_Id_0 == nil then
                return;
            elseif l_get_item_health_0(l_Id_0, game.Players.LocalPlayer.Name) ~= true then
                return;
            else
                local v41 = _G.generateid();
                v0.currentid = v41;
                if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                    if v1:Check() ~= true then
                        v36 = true;
                    end;
                    local l_Character_0 = game.Players.LocalPlayer.Character;
                    if l_Character_0 ~= nil then
                        local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                        local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                        if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(70, 0) then
                            _G.Skills_Performance(script.Name, l_tick_0(), 5);
                            _G.Skills_Performance(script.Name, l_tick_0(), 1);
                            v39 = true;
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
                                for _, v46 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                    if v46:IsA("BodyVelocity") then
                                        v46:Destroy();
                                    end;
                                end;
                            end;
                            local l_BoolValue_0 = Instance.new("BoolValue");
                            l_BoolValue_0.Name = "Invisible2";
                            l_BoolValue_0.Parent = v7;
                            table.insert(v37, l_BoolValue_0);
                            game.Debris:AddItem(l_BoolValue_0, 5.1);
                            local l_BoolValue_1 = Instance.new("BoolValue");
                            l_BoolValue_1.Name = "dsieapera123asd";
                            l_BoolValue_1.Parent = v7;
                            table.insert(v37, l_BoolValue_1);
                            game.Debris:AddItem(l_BoolValue_1, 5.1);
                            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                            l_BodyVelocity_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                            l_BodyVelocity_0.Velocity = Vector3.new();
                            l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                            l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                            local l_BodyGyro_0 = Instance.new("BodyGyro");
                            l_BodyGyro_0.P = 20000;
                            l_BodyGyro_0.MaxTorque = Vector3.new(0, 1.0000000200408773E21, 0, 0);
                            l_BodyGyro_0.Name = "thunderclapandflashbg";
                            local v51 = game.ReplicatedStorage.Assets.water_fall_basin_stuff.Part.water_fall_basin_at1:Clone();
                            v51.Parent = l_HumanoidRootPart_0;
                            local v52 = game.ReplicatedStorage.Assets.water_fall_basin_stuff.Part.water_fall_basin_at2:Clone();
                            v52.Parent = l_HumanoidRootPart_0;
                            local v53 = game.ReplicatedStorage.Assets.water_fall_basin_stuff.Part.Beam:Clone();
                            v53.Parent = l_HumanoidRootPart_0;
                            v53.Attachment0 = v51;
                            v53.Attachment1 = v52;
                            local v54 = game.ReplicatedStorage.Assets.water_fall_basin_stuff.water_fall_basin_3123:Clone();
                            v54.Parent = l_HumanoidRootPart_0;
                            v54.BillboardGui.Enabled = true;
                            game.Debris:AddItem(v51, 6);
                            game.Debris:AddItem(v52, 6);
                            game.Debris:AddItem(v53, 6);
                            game.Debris:AddItem(v54, 6);
                            l_resume_0(l_create_0(function() --[[ Line: 141 ]]
                                -- upvalues: v51 (copy), v52 (copy), l_HumanoidRootPart_0 (copy), v54 (copy), v53 (copy), v29 (ref)
                                while v51 ~= nil and v52 ~= nil and l_HumanoidRootPart_0 ~= nil and l_HumanoidRootPart_0:IsDescendantOf(workspace) and v51.Parent ~= nil and v52.Parent ~= nil and v54 ~= nil and v54.Parent ~= nil and l_HumanoidRootPart_0 ~= nil and l_HumanoidRootPart_0.Parent ~= nil and v53 ~= nil and v53.Parent ~= nil do
                                    local v55 = Vector3.new(0, -(game.Workspace.Gravity * 0.5), 0);
                                    local v56 = l_HumanoidRootPart_0.CFrame * Vector3.new(0, 2, -2, 0);
                                    local v57 = (_G.getmousepos(90, nil, nil, nil, nil, l_HumanoidRootPart_0.Position) - v56 - 0.5 * v55 * 0.94 * 0.94) / 0.94;
                                    local v58, v59, v60, v61 = v29(v55, v57, v56, 0.94);
                                    v53.CurveSize0 = v58;
                                    v53.CurveSize1 = v59;
                                    v54.CFrame = v61;
                                    v51.CFrame = v51.Parent.CFrame:inverse() * v60;
                                    v52.CFrame = v52.Parent.CFrame:inverse() * v61;
                                    game["Run Service"].RenderStepped:wait();
                                end;
                            end));
                            l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                            task.spawn(function() --[[ Line: 159 ]]
                                -- upvalues: l_Character_0 (copy), l_HumanoidRootPart_0 (copy)
                                _G:Initiate_C("Swamp_Charge_eff", {
                                    Character = l_Character_0, 
                                    CF = l_HumanoidRootPart_0.CFrame
                                });
                            end);
                            task.spawn(function() --[[ Line: 162 ]]
                                -- upvalues: l_Character_0 (copy)
                                _G:Initiate_C("Swamp_Start_Up_eff", {
                                    Character = l_Character_0
                                });
                            end);
                            task.spawn(function() --[[ Line: 165 ]]
                                -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil and l_BodyGyro_0:IsDescendantOf(workspace) do
                                    l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos(90, nil, nil, nil, nil, l_HumanoidRootPart_0.Position));
                                    l_RunService_0.RenderStepped:wait();
                                end;
                            end);
                            local v62 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Swamp.swamp_eject_animation);
                            v62.Priority = Enum.AnimationPriority.Action4;
                            v62:Play();
                            l_resume_0(l_create_0(function() --[[ Line: 175 ]]
                                -- upvalues: v0 (ref), v41 (copy), v62 (copy)
                                task.wait(0.1);
                                if v0.currentid == v41 then
                                    v62:AdjustSpeed(0);
                                end;
                            end));
                        end;
                    end;
                end;
                return v39;
            end;
        end;
    end;
end;
local function _(v63, v64, v65) --[[ Line: 192 ]] --[[ Name: lerp ]]
    return v63 + (v64 - v63) * v65;
end;
local _ = math.random;
local v68 = RaycastParams.new();
v68.FilterDescendantsInstances = {
    workspace.Map
};
v68.FilterType = Enum.RaycastFilterType.Whitelist;
local v69 = 0;
local v70 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v71) --[[ Line: 199 ]]
    -- upvalues: v70 (copy), v69 (ref)
    if table.find(v70, v71.Name) ~= nil then
        v69 = "";
    end;
end);
v0.Up = function(v72) --[[ Line: 200 ]]
    -- upvalues: v69 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v33 (ref), v37 (copy), v29 (copy), v68 (copy), v7 (copy), v36 (ref), v1 (copy)
    if v72 == nil then
        return;
    else
        local v73 = _G.generateid();
        v69 = v73;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.1;
        if v73 ~= v69 then
            v0.Cancel(v72);
            return true;
        else
            v0.currentid = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            local v75 = _G.generateid();
            v33 = v75;
            for _, v77 in pairs(v37) do
                v77:Destroy();
            end;
            _G.Skills_Performance(script.Name, l_tick_0(), 6);
            _G:Initiate_C("Swamp_Charge_eff", {
                Character = l_Character_1
            }, true);
            if l_Character_1 ~= nil then
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
                    for _, v81 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v81.Name == "swamp_eject_animation" or v81.Name == "water_fall_basin_loop" then
                            v81:AdjustSpeed(1);
                        end;
                    end;
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        if l_Humanoid_1 ~= nil then
                            l_Humanoid_1:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false);
                            l_Humanoid_1:SetStateEnabled(Enum.HumanoidStateType.Freefall, false);
                        end;
                        local v84 = Vector3.new(0, -game.Workspace.Gravity, 0);
                        local v85 = l_HumanoidRootPart_1.CFrame * Vector3.new(0, 2, -2, 0);
                        local v86 = (_G.getmousepos(90, nil, nil, nil, nil, l_HumanoidRootPart_1.Position) - v85 - 0.5 * v84 * 1 * 1) / 1;
                        local _, _, _, _, v91, v92, v93 = v29(v84, v86, v85, 1);
                        v93 = l_HumanoidRootPart_1.Position;
                        v91 = _G.getmousepos(90, nil, nil, nil, nil, l_HumanoidRootPart_1.Position);
                        local v94 = v91 + Vector3.new(0, 10, 0, 0);
                        local _ = Vector3.new(0, -150, 0, 0);
                        local v96 = workspace:Raycast(v94, Vector3.new(0, -150, 0, 0), v68);
                        if v96 ~= nil and v96.Instance ~= nil then
                            v91 = v96.Position;
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
                        local l_BoolValue_2 = Instance.new("BoolValue");
                        l_BoolValue_2.Name = "FloorStand";
                        l_BoolValue_2.Parent = v7;
                        game.Debris:AddItem(l_BoolValue_2, 2);
                        local l_BoolValue_3 = Instance.new("BoolValue");
                        l_BoolValue_3.Name = "Cancel";
                        l_BoolValue_3.Parent = l_thunderclapandflashbg_0;
                        task.spawn(function() --[[ Line: 283 ]]
                            -- upvalues: l_HumanoidRootPart_1 (copy), l_Character_1 (copy)
                            _G:Initiate_C("Swamp_Eject_Move_eff", {
                                CF = l_HumanoidRootPart_1.CFrame, 
                                Character = l_Character_1, 
                                TravelTime = 0.45
                            });
                        end);
                        local v100 = false;
                        for v101 = 1, 22 do
                            if v75 == v33 then
                                local v102 = v101 / 22;
                                local l_v93_0 = v93;
                                local v104 = l_v93_0 + (v92 - l_v93_0) * v102;
                                l_BodyPosition_0.Position = v104 + (v92 + (v91 - v92) * v102 - v104) * v102 + Vector3.new(0, 3, 0, 0);
                                task.wait(0.0085);
                            else
                                v100 = true;
                                break;
                            end;
                        end;
                        if l_BoolValue_2 ~= nil then
                            l_BoolValue_2:Destroy();
                        end;
                        if l_HumanoidRootPart_1 ~= nil and l_HumanoidRootPart_1.Parent ~= nil and v100 == false then
                            _G.Skills_Performance(script.Name, tick(), 2);
                            local v105 = l_HumanoidRootPart_1.CFrame * CFrame.new(0, 0, 0);
                            local v106 = v105.p + Vector3.new(0, 1, 0, 0);
                            local _ = Vector3.new(0, -15, 0, 0);
                            local v108 = workspace:Raycast(v106, Vector3.new(0, -15, 0, 0), v68);
                            if v108 ~= nil and v108.Instance ~= nil then
                                local v109 = v105 - v105.p;
                                v105 = CFrame.new(v108.Position + Vector3.new(0, 3, 0, 0)) * v109;
                            end;
                            task.wait(0.05);
                            if l_HumanoidRootPart_1 ~= nil then
                                task.spawn(function() --[[ Line: 317 ]]
                                    -- upvalues: l_Character_1 (copy), l_HumanoidRootPart_1 (copy)
                                    _G:Initiate_C("Swamp_Eject_Explosion", {
                                        Character = l_Character_1, 
                                        CF = l_HumanoidRootPart_1.CFrame
                                    });
                                end);
                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("swamp_eject_damage", l_Character_1, l_HumanoidRootPart_1.CFrame);
                            end;
                        end;
                        task.wait(0.25);
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
            if v72 ~= nil and v72:FindFirstChild("LastUsed") ~= nil then
                v72.LastUsed.Value = l_tick_0();
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
v0.Cancel = function(v110) --[[ Line: 359 ]]
    -- upvalues: v0 (copy), v37 (copy), l_tick_0 (copy), v36 (ref), v1 (copy)
    if v110 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        for _, v113 in pairs(v37) do
            v113:Destroy();
        end;
        _G.Skills_Performance(script.Name, l_tick_0(), 6);
        if l_Character_2 ~= nil then
            _G:Initiate_C("Swamp_Charge_eff", {
                Character = l_Character_2
            }, true);
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
                for _, v117 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v117.Name == "thunderclap_and_flash_bv" or v117.Name == "thunderclapandflashbg" then
                        v117:Destroy();
                    end;
                end;
                for _, v119 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v119.Name == "swamp_eject_animation" or v119.Name == "water_fall_basin_loop" then
                        v119:Stop();
                    end;
                end;
            end;
        end;
        if v110 ~= nil and v110:FindFirstChild("LastUsed") ~= nil then
            v110.LastUsed.Value = l_tick_0();
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