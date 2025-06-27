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
local _ = {};
local v15 = RaycastParams.new();
v15.FilterDescendantsInstances = {
    workspace.Map
};
v15.FilterType = Enum.RaycastFilterType.Whitelist;
local v16 = {
    [1] = "LeftUpperHand", 
    [2] = "RightLowerHand", 
    [3] = "LeftLowerHand", 
    [4] = "RightUpperHand", 
    [5] = "RightHand", 
    [6] = "LeftHand"
};
local l_TweenService_0 = game:GetService("TweenService");
local v18 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
local v19 = {};
local v20 = false;
v0.Down = function(v21) --[[ Line: 37 ]]
    -- upvalues: v20 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), v16 (copy), l_resume_0 (copy), l_create_0 (copy), v15 (copy), l_TweenService_0 (copy), v18 (copy), v19 (ref), l_RunService_0 (copy)
    if v21 == nil then
        return;
    else
        local v22 = false;
        v20 = false;
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
                elseif l_get_item_health_0(v23, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v24 = _G.generateid();
                    v0.currentid = v24;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v20 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(30) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v22 = true;
                                if v20 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                    l_HumanoidRootPart_0.air123123bp:Destroy();
                                end;
                                if v20 == false then
                                    v1.Disabled = true;
                                end;
                                v1.Disabled = true;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v29 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v29:IsA("BodyVelocity") then
                                            v29:Destroy();
                                        end;
                                    end;
                                end;
                                local v30 = {};
                                for v31 = 1, 4 do
                                    local v32 = v16[v31];
                                    if v32 ~= nil then
                                        _G:Initiate_C("Ball_In_Hand_tamariasd123", l_Character_0, true, {
                                            v32
                                        }, l_Character_0.Name .. "tamarimeteorasd123");
                                    end;
                                end;
                                l_resume_0(l_create_0(function() --[[ Line: 99 ]]
                                    -- upvalues: v15 (ref), l_TweenService_0 (ref), v18 (ref), v30 (copy), v19 (ref)
                                    for _ = 1, 4 do
                                        local v34, v35, v36 = _G.getmousepos(250, true, nil, nil, nil);
                                        if v35 == nil and v36 == nil or v35:IsDescendantOf(workspace.Map) == false then
                                            local v37 = v34 + Vector3.new(0, 5, 0, 0);
                                            local _ = Vector3.new(0, -150, 0, 0);
                                            local v39 = workspace:Raycast(v37, Vector3.new(0, -150, 0, 0), v15);
                                            if v39 ~= nil and v39.Instance ~= nil then
                                                v34 = v39.Position;
                                                v36 = v39.Normal;
                                                v35 = v39.Instance;
                                            end;
                                        end;
                                        if v34 ~= nil and v35 ~= nil and v36 ~= nil then
                                            local v40 = game.ReplicatedStorage.Tamari_meteor_hit_part:Clone();
                                            v40.CFrame = CFrame.new(v34, v34 - v36) * CFrame.Angles(1.5707963267948966, 0, 0);
                                            l_TweenService_0:Create(v40, v18, {
                                                Size = Vector3.new(35, 0.05000000074505806, 35, 0)
                                            }):Play();
                                            l_TweenService_0:Create(v40.Decal, v18, {
                                                Transparency = 1
                                            }):Play();
                                            v40.Parent = workspace.Debree;
                                            game.Debris:AddItem(v40, 0.4);
                                            table.insert(v30, {
                                                v35, 
                                                v34
                                            });
                                        end;
                                        task.wait(0.1);
                                    end;
                                    v19 = v30;
                                end));
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
                                l_resume_0(l_create_0(function() --[[ Line: 134 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_0.RenderStepped:wait();
                                    end;
                                end));
                                local v43 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Tamari.Tamari_Meteor);
                                v43:Play();
                                local v44 = nil;
                                if l_Character_0:FindFirstChild("Tamari_Arms") ~= nil then
                                    v44 = l_Character_0.Tamari_Arms.Animator:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Tamari.Tamari_Meteor);
                                    v44:Play();
                                end;
                                do
                                    local l_v44_0 = v44;
                                    l_resume_0(l_create_0(function() --[[ Line: 149 ]]
                                        -- upvalues: v0 (ref), v24 (copy), v43 (copy), l_v44_0 (ref)
                                        task.wait(0.3);
                                        if v0.currentid == v24 then
                                            v43:AdjustSpeed(0);
                                            if l_v44_0 ~= nil then
                                                l_v44_0:AdjustSpeed(0);
                                            end;
                                        end;
                                    end));
                                end;
                            end;
                        end;
                    end;
                    return v22;
                end;
            end;
        end;
    end;
end;
local v46 = 0;
local v47 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v48) --[[ Line: 171 ]]
    -- upvalues: v47 (copy), v46 (ref)
    if table.find(v47, v48.Name) ~= nil then
        v46 = "";
    end;
end);
v0.Up = function(v49) --[[ Line: 172 ]]
    -- upvalues: v46 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v11 (ref), l_resume_0 (copy), l_create_0 (copy), v16 (copy), v19 (ref), v7 (copy), v20 (ref), v1 (copy)
    if v49 == nil then
        return;
    else
        local v50 = _G.generateid();
        v46 = v50;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.61;
        if v50 ~= v46 then
            v0.Cancel(v49);
            return true;
        else
            local v51 = _G.generateid();
            v0.currentid = v51;
            local v52 = _G.generateid();
            v11 = v52;
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "Cancel";
                        l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                    end;
                    l_resume_0(l_create_0(function() --[[ Line: 194 ]]
                        -- upvalues: l_tick_0 (ref), v11 (ref), v52 (copy), l_HumanoidRootPart_1 (copy), v16 (ref), l_Character_1 (copy), v0 (ref), v49 (copy), v19 (ref), v51 (copy)
                        task.wait(0.1);
                        _G.Skills_Performance(script.Name, l_tick_0(), 2);
                        task.wait(0.1);
                        if v11 == v52 then
                            if l_HumanoidRootPart_1 ~= nil then
                                local v59 = {};
                                for v60 = 1, 4 do
                                    local v61 = v16[v60];
                                    if v61 ~= nil then
                                        local l_l_Character_1_FirstChild_0 = l_Character_1:FindFirstChild(v61, true);
                                        if l_l_Character_1_FirstChild_0 ~= nil then
                                            local l_p_0 = l_l_Character_1_FirstChild_0.CFrame.p;
                                            if l_p_0 ~= nil then
                                                table.insert(v59, l_p_0);
                                            end;
                                        end;
                                    end;
                                end;
                                _G:Initiate_C("tamari_blast_off_eff", l_HumanoidRootPart_1.CFrame, v59);
                            end;
                        else
                            v0.Cancel(v49);
                        end;
                        if workspace.Debree:FindFirstChild(l_Character_1.Name .. "tamarimeteorasd123") ~= nil then
                            _G:Initiate_C("delete_from_debree", l_Character_1.Name .. "tamarimeteorasd123");
                        end;
                        task.wait(0.3);
                        if v19 ~= nil and v11 == v52 and v0.currentid == v51 then
                            _G:Initiate_C("Tamari_meteor_effect", l_Character_1, v19);
                        end;
                    end));
                    for _, v65 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v65.Name == "Tamari_Meteor" then
                            v65:AdjustSpeed(1);
                        end;
                    end;
                    if l_Character_1:FindFirstChild("Tamari_Arms") ~= nil then
                        for _, v67 in pairs(l_Character_1.Tamari_Arms.Animator:GetPlayingAnimationTracks()) do
                            if v67.Name == "Tamari_Meteor" then
                                v67:AdjustSpeed(1);
                            end;
                        end;
                    end;
                    task.wait(0.7);
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        l_thunderclap_and_flash_bv_0:Destroy();
                    end;
                    if l_thunderclapandflashbg_0 ~= nil then
                        l_thunderclapandflashbg_0:Destroy();
                    end;
                    if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                        l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                    end;
                end;
            end;
            if v49 ~= nil and v49:FindFirstChild("LastUsed") ~= nil then
                v49.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            if v20 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v68) --[[ Line: 271 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v20 (ref), v1 (copy)
    if v68 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v73 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v73.Name == "Tamari_Meteor" then
                        v73:Stop();
                    end;
                end;
            end;
            if l_Character_2:FindFirstChild("Tamari_Arms") ~= nil then
                for _, v75 in pairs(l_Character_2.Tamari_Arms.Animator:GetPlayingAnimationTracks()) do
                    if v75.Name == "Tamari_Meteor" then
                        v75:Stop();
                    end;
                end;
            end;
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v77 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v77.Name == "thunderclap_and_flash_bv" or v77.Name == "thunderclapandflashbg" then
                        v77:Destroy();
                    end;
                end;
                for _, v79 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v79.Name == "Tamari_Double_Throw" then
                        v79:Stop();
                    end;
                end;
            end;
            if workspace.Debree:FindFirstChild(l_Character_2.Name .. "tamarimeteorasd123") ~= nil then
                _G:Initiate_C("delete_from_debree", l_Character_2.Name .. "tamarimeteorasd123");
            end;
        end;
        if v68 ~= nil and v68:FindFirstChild("LastUsed") ~= nil then
            v68.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v20 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;