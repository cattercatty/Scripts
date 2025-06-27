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
local v11 = {};
local v12 = "";
local v13 = {
    "Stun", 
    "KnockedOut", 
    "RagDoll"
};
v7.ChildAdded:Connect(function(v14) --[[ Line: 16 ]]
    -- upvalues: v13 (copy), v0 (copy), v12 (ref), v11 (copy)
    if table.find(v13, v14.Name) ~= nil then
        v0.currentid = "";
        if v12 ~= "" then
            for _, v16 in pairs(v11) do
                v16:Destroy();
            end;
        end;
        v12 = "";
    end;
end);
local l_TweenService_0 = game:GetService("TweenService");
local v18 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
local v19 = RaycastParams.new();
v19.FilterDescendantsInstances = {
    workspace.Map
};
v19.FilterType = Enum.RaycastFilterType.Whitelist;
local v20 = false;
local v21 = 0;
local v22 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v23) --[[ Line: 33 ]]
    -- upvalues: v22 (copy), v21 (ref)
    if table.find(v22, v23.Name) ~= nil then
        v21 = "";
    end;
end);
v0.Down = function(v24) --[[ Line: 34 ]]
    -- upvalues: v20 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), v18 (copy)
    if v24 == nil then
        return;
    else
        local v25 = false;
        v20 = false;
        if v24 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
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
                    local v27 = _G.generateid();
                    v0.currentid = v27;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v20 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(20, 30) then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v25 = true;
                                if v20 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v20 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v32 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v32:IsA("BodyVelocity") then
                                            v32:Destroy();
                                        end;
                                    end;
                                end;
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v34 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v34.Name == "BodyVelocity" then
                                            v34:Destroy();
                                        end;
                                    end;
                                end;
                                if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                    for _, v36 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v36.Name == "air123123bp" then
                                            v36:Destroy();
                                        end;
                                    end;
                                end;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(40000, 40000, 40000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new(0, 0, 0, 0);
                                _G:Initiate_C("caprice_up", l_HumanoidRootPart_0);
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 10000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(20000, 20000, 20000, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 99 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_0.RenderStepped:wait();
                                    end;
                                end));
                                local v39 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Insect.butter_fly_dance_up);
                                v39:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 108 ]]
                                    -- upvalues: v0 (ref), v27 (copy), l_TweenService_0 (ref), l_BodyVelocity_0 (copy), v18 (ref), v39 (copy), v24 (copy)
                                    if v0.currentid == v27 then
                                        task.wait(0.2);
                                        if v0.currentid == v27 then
                                            l_TweenService_0:Create(l_BodyVelocity_0, v18, {
                                                Velocity = Vector3.new(0, 55, 0, 0)
                                            }):Play();
                                            task.wait(0.27);
                                            if v0.currentid == v27 then
                                                v39:AdjustSpeed(0);
                                                l_TweenService_0:Create(l_BodyVelocity_0, v18, {
                                                    Velocity = Vector3.new()
                                                }):Play();
                                                return;
                                            else
                                                v0.Cancel(v24);
                                                return;
                                            end;
                                        else
                                            v0.Cancel(v24);
                                            return;
                                        end;
                                    else
                                        v0.Cancel(v24);
                                        return;
                                    end;
                                end));
                            end;
                        end;
                    end;
                    return v25;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v40) --[[ Line: 139 ]]
    -- upvalues: v21 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v12 (ref), v19 (copy), v7 (copy), v20 (ref), v1 (copy)
    if v40 == nil then
        return;
    else
        local v41 = _G.generateid();
        v21 = v41;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.51;
        if v41 ~= v21 then
            v0.Cancel(v40);
            return true;
        else
            local v42 = _G.generateid();
            v0.currentid = v42;
            v12 = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    _G:Initiate_C("caprice_up", l_HumanoidRootPart_1, false);
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "Cancel";
                        l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                    end;
                    l_Humanoid_1:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Insect.butter_fly_dance_hit):Play();
                    _G.Skills_Performance(script.Name, l_tick_0(), 1);
                    task.wait(0.3);
                    for _, v50 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v50.Name == "butter_fly_dance_up" then
                            v50:Stop();
                        end;
                    end;
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        l_thunderclap_and_flash_bv_0:Destroy();
                    end;
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_1 = Instance.new("StringValue");
                        l_StringValue_1.Name = "Cancel";
                        l_StringValue_1.Parent = l_thunderclapandflashbg_0;
                        game.Debris:AddItem(l_thunderclapandflashbg_0, 0.5);
                    end;
                    if v42 == v0.currentid then
                        local _ = l_HumanoidRootPart_1.CFrame;
                        local v53 = CFrame.new(l_HumanoidRootPart_1.Position, _G.getmousepos());
                        local v54 = l_HumanoidRootPart_1.Position + v53.lookVector * 60;
                        local v55 = workspace:Raycast(l_HumanoidRootPart_1.Position, v53.lookVector * 70, v19);
                        if v55 ~= nil and v55.Position ~= nil then
                            v54 = v55.Position;
                        end;
                        local l_BodyPosition_0 = Instance.new("BodyPosition");
                        l_BodyPosition_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                        l_BodyPosition_0.Position = v54;
                        local v57 = v53 - v53.Position;
                        if l_thunderclapandflashbg_0 ~= nil then
                            l_thunderclapandflashbg_0.CFrame = v53;
                            local l_StringValue_2 = Instance.new("StringValue");
                            l_StringValue_2.Name = "Cancel";
                            l_StringValue_2.Parent = l_thunderclapandflashbg_0;
                            game.Debris:AddItem(l_thunderclapandflashbg_0, 0.5);
                        end;
                        _G:Initiate_C("caprice_hit", v53, CFrame.new(v54) * v57, l_HumanoidRootPart_1);
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("insect_caprice_damage", l_Character_1, v53, CFrame.new(v54) * v57);
                        l_HumanoidRootPart_1.CFrame = CFrame.new(v54) * v57;
                        l_BodyPosition_0.Parent = l_HumanoidRootPart_1;
                        local l_StringValue_3 = Instance.new("StringValue");
                        l_StringValue_3.Name = "cant_move";
                        l_StringValue_3.Parent = v7;
                        game.Debris:AddItem(l_StringValue_3, 0.5);
                        game.Debris:AddItem(l_BodyPosition_0, 0.5);
                        local _ = CFrame.new(v54) * v57;
                        task.wait(0.5);
                    end;
                    if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                        l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                    end;
                end;
            end;
            if v40 ~= nil and v40:FindFirstChild("LastUsed") ~= nil then
                v40.LastUsed.Value = l_tick_0();
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
v0.Cancel = function(v61) --[[ Line: 240 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v20 (ref), v1 (copy)
    if v61 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                _G:Initiate_C("caprice_up", l_HumanoidRootPart_2, false);
                for _, v66 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v66.Name == "thunderclap_and_flash_bv" or v66.Name == "thunderclapandflashbg" then
                        v66:Destroy();
                    end;
                end;
                for _, v68 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v68.Name == "butter_fly_dance_up" then
                        v68:Stop();
                    end;
                end;
            end;
        end;
        if v61 ~= nil and v61:FindFirstChild("LastUsed") ~= nil then
            v61.LastUsed.Value = l_tick_0();
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