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
local _ = game:GetService("CollectionService");
local v12 = TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
local v13 = false;
local v14 = false;
local v15 = RaycastParams.new();
v15.FilterDescendantsInstances = {
    workspace.Map
};
v15.FilterType = Enum.RaycastFilterType.Whitelist;
v0.Down = function(v16) --[[ Line: 18 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v14 (ref), v13 (ref), l_resume_0 (copy), l_create_0 (copy), v8 (ref), v15 (copy), l_RunService_0 (copy)
    if v16 == nil then
        return;
    else
        local v17 = false;
        if v16 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v18 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v18 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
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
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(10) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v17 = true;
                                if v14 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                v13 = true;
                                if v14 == false then
                                    v1.Disabled = true;
                                end;
                                _G:Initiate_C("arrow_activated_effect", l_Character_0);
                                l_resume_0(l_create_0(function() --[[ Line: 54 ]]
                                    -- upvalues: l_HumanoidRootPart_0 (copy)
                                    local v23 = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("arrow_arrow_spawn_leg", l_HumanoidRootPart_0, true);
                                    _G:Initiate_C("arrow_follow", v23);
                                end));
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                    l_HumanoidRootPart_0.air123123bp:Destroy();
                                end;
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v25 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v25:IsA("BodyVelocity") then
                                            v25:Destroy();
                                        end;
                                    end;
                                end;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new();
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 9000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(1.0000000200408773E21, 1.0000000200408773E21, 1.0000000200408773E21, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.CFrame = workspace.CurrentCamera.CFrame;
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 81 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_BodyVelocity_0 (copy), v0 (ref), v19 (copy), v16 (copy)
                                    while l_BodyGyro_0 ~= nil and l_BodyVelocity_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyVelocity_0.Parent ~= nil and v0.currentid == v19 do
                                        if _G:Stamina(3) ~= true then
                                            v0.Cancel(v16);
                                        end;
                                        wait(0.31);
                                    end;
                                end));
                                l_resume_0(l_create_0(function() --[[ Line: 89 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_BodyVelocity_0 (copy), v0 (ref), v19 (copy), l_HumanoidRootPart_0 (copy), v15 (ref), l_RunService_0 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyVelocity_0 ~= nil and l_BodyVelocity_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil and v0.currentid == v19 do
                                        l_BodyGyro_0.CFrame = workspace.CurrentCamera.CFrame;
                                        local v28 = l_BodyGyro_0.CFrame.lookVector * 45;
                                        local l_X_0 = v28.X;
                                        local l_Y_0 = v28.Y;
                                        local l_Z_0 = v28.Z;
                                        if game.PlaceId == (game.GameId == 2142948266 and 9366093452 or 10333730709) or workspace:FindFirstChild("is_dungeonasd") ~= nil then
                                            local v32 = workspace:Raycast(l_HumanoidRootPart_0.Position, Vector3.new(0, -20, 0, 0), v15);
                                            if v32 == nil or v32.Instance == nil then
                                                l_Y_0 = math.clamp(l_Y_0, -999, 0);
                                            end;
                                        end;
                                        l_BodyVelocity_0.Velocity = Vector3.new(l_X_0, l_Y_0, l_Z_0);
                                        l_RunService_0.RenderStepped:Wait();
                                    end;
                                end));
                                l_resume_0(l_create_0(function() --[[ Line: 105 ]]
                                    -- upvalues: l_Humanoid_0 (copy)
                                    l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Arrow.flgiht_asd):Play();
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
local v33 = 0;
local v34 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v35) --[[ Line: 130 ]]
    -- upvalues: v34 (copy), v33 (ref)
    if table.find(v34, v35.Name) ~= nil then
        v33 = "";
    end;
end);
v0.Up = function(v36) --[[ Line: 131 ]]
    -- upvalues: v33 (ref), v13 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), l_LocalPlayer_0 (copy), v12 (copy), v7 (copy), v14 (ref), v1 (copy)
    if v36 == nil then
        return true;
    else
        local v37 = _G.generateid();
        v33 = v37;
        if v13 == false then
            return true;
        else
            repeat
                wait();
            until l_tick_0() - v8 >= 0.3;
            if v37 ~= v33 then
                v0.Cancel(v36);
                return true;
            else
                v13 = false;
                v0.currentid = _G.generateid();
                local l_Character_1 = game.Players.LocalPlayer.Character;
                if l_Character_1 ~= nil then
                    if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                        for _, v40 in pairs(game.Workspace.Debree:GetChildren()) do
                            if v40.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v40);
                                v40:Destroy();
                            end;
                        end;
                    end;
                    local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                    local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                    if l_Humanoid_1 ~= nil then
                        for _, v44 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                            if v44.Name == "flgiht_asd" then
                                v44:Stop();
                            end;
                        end;
                    end;
                    game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("arrow_arrow_spawn_leg", l_HumanoidRootPart_1, false);
                    if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                        local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                        local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                        if l_thunderclapandflashbg_0 ~= nil then
                            local l_StringValue_0 = Instance.new("StringValue");
                            l_StringValue_0.Name = "Cancel";
                            l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                        end;
                        for _, v49 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                            if v49.Name == "Koketsu_Arrow" then
                                v49:Stop();
                            end;
                        end;
                        if l_thunderclap_and_flash_bv_0 ~= nil then
                            game.TweenService:Create(l_thunderclap_and_flash_bv_0, v12, {
                                Velocity = Vector3.new()
                            }):Play();
                            game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 0.15);
                        end;
                        for _, v51 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                            if v51.Name == "thunderclap_and_flash_bv" ~= nil and v51 ~= l_thunderclap_and_flash_bv_0 then
                                game.Debris:AddItem(v51, 0.15);
                            elseif v51.Name == "thunderclapandflashbg" and v51 ~= l_thunderclapandflashbg_0 then
                                v51:Destroy();
                            end;
                        end;
                        if l_thunderclapandflashbg_0 ~= nil then
                            l_thunderclapandflashbg_0:Destroy();
                        end;
                        if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                            l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                        end;
                    end;
                end;
                if v36 ~= nil and v36:FindFirstChild("LastUsed") ~= nil then
                    v36.LastUsed.Value = l_tick_0();
                end;
                wait(0.3);
                if v14 == false then
                    v1.Disabled = false;
                end;
                _G.can_perf_air_tang = true;
                return true;
            end;
        end;
    end;
end;
v0.Cancel = function(v52) --[[ Line: 214 ]]
    -- upvalues: v13 (ref), v0 (copy), v12 (copy), l_LocalPlayer_0 (copy), l_tick_0 (copy), v14 (ref), v1 (copy)
    if v52 == nil then
        return true;
    elseif v13 == false then
        return true;
    else
        v13 = false;
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil then
                local l_thunderclapandflashbg_1 = l_HumanoidRootPart_2:FindFirstChild("thunderclapandflashbg");
                local l_thunderclap_and_flash_bv_1 = l_HumanoidRootPart_2:FindFirstChild("thunderclap_and_flash_bv");
                if l_thunderclap_and_flash_bv_1 ~= nil then
                    game.TweenService:Create(l_thunderclap_and_flash_bv_1, v12, {
                        Velocity = Vector3.new()
                    }):Play();
                    game.Debris:AddItem(l_thunderclap_and_flash_bv_1, 0.15);
                end;
                for _, v59 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v59.Name == "thunderclap_and_flash_bv" ~= nil and v59 ~= l_thunderclap_and_flash_bv_1 then
                        game.Debris:AddItem(v59, 0.15);
                    elseif v59.Name == "thunderclapandflashbg" and v59 ~= l_thunderclapandflashbg_1 then
                        v59:Destroy();
                    end;
                end;
                if l_thunderclapandflashbg_1 ~= nil then
                    l_thunderclapandflashbg_1:Destroy();
                end;
            end;
            if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                for _, v61 in pairs(game.Workspace.Debree:GetChildren()) do
                    if v61.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v61);
                        v61:Destroy();
                    end;
                end;
            end;
            if l_Humanoid_2 ~= nil then
                for _, v63 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v63.Name == "flgiht_asd" then
                        v63:Stop();
                    end;
                end;
            end;
            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("arrow_arrow_spawn_leg", l_HumanoidRootPart_2, false);
        end;
        if v52 ~= nil and v52:FindFirstChild("LastUsed") ~= nil then
            v52.LastUsed.Value = l_tick_0();
        end;
        wait(0.3);
        if v14 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;