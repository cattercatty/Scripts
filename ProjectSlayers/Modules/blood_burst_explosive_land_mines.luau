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
local v15 = nil;
local l_UserInputService_0 = game:GetService("UserInputService");
local v17 = false;
game.ReplicatedStorage:WaitForChild("mobile_tap_events"):WaitForChild("mobile_skill_tap").Event:Connect(function(v18) --[[ Line: 28 ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if v18 == "Explosive Landmines" then
        local l_FirstChild_0 = workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s explosive land mines");
        if l_FirstChild_0 ~= nil then
            for _, v21 in pairs(l_FirstChild_0:GetChildren()) do
                if v21:FindFirstChild("DetonateEvent") ~= nil then
                    v21.DetonateEvent:FireServer();
                    task.wait(0.12);
                end;
            end;
        end;
    end;
end);
l_UserInputService_0.InputBegan:Connect(function(v22, v23) --[[ Line: 42 ]]
    -- upvalues: v15 (ref), v17 (ref), l_LocalPlayer_0 (copy)
    if v23 == false and v15 ~= nil and v17 == false and v22.KeyCode.Name == game.ReplicatedStorage.Player_Data:FindFirstChild(l_LocalPlayer_0.Name).Keys:FindFirstChild(v15)["2"].Value then
        local l_FirstChild_1 = workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s explosive land mines");
        if l_FirstChild_1 ~= nil then
            for _, v26 in pairs(l_FirstChild_1:GetChildren()) do
                if v26:FindFirstChild("DetonateEvent") ~= nil then
                    v26.DetonateEvent:FireServer();
                    task.wait(0.12);
                end;
            end;
        end;
    end;
end);
local v27 = nil;
local v28 = false;
v0.Down = function(v29) --[[ Line: 58 ]]
    -- upvalues: v28 (ref), l_LocalPlayer_0 (copy), v17 (ref), l_get_item_health_0 (copy), v0 (copy), v27 (ref), v1 (copy), l_tick_0 (copy), l_resume_0 (copy), l_create_0 (copy), v15 (ref), l_RunService_1 (copy)
    if v29 == nil then
        return;
    else
        v28 = false;
        if workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s explosive land mines") ~= nil then
            return;
        else
            local v30 = false;
            v17 = false;
            if v29 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
                return;
            elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
                return;
            else
                local v31 = false;
                if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                    v31 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
                end;
                if v31 == false then
                    v31 = nil;
                end;
                if v31 == nil then
                    return;
                else
                    v31 = v31.Value;
                    if v31 == nil then
                        return;
                    elseif l_get_item_health_0(v31, game.Players.LocalPlayer.Name) ~= true then
                        return;
                    else
                        local v32 = _G.generateid();
                        v0.currentid = v32;
                        if v27 ~= nil then
                            v27:Disconnect();
                            v27 = nil;
                        end;
                        if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                            if v1:Check() ~= true then
                                v28 = true;
                            end;
                            local l_Character_0 = game.Players.LocalPlayer.Character;
                            if l_Character_0 ~= nil then
                                local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                                if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(43) == true then
                                    _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                    v17 = true;
                                    v27 = workspace.Debree.DescendantAdded:Connect(function(v36) --[[ Line: 93 ]]
                                        -- upvalues: l_LocalPlayer_0 (ref)
                                        if v36.Parent.Name == l_LocalPlayer_0.Name .. "'s explosive land mines" then
                                            local v37 = Instance.new("ClickDetector", v36);
                                            v37.MaxActivationDistance = 100;
                                            v37.MouseClick:Connect(function() --[[ Line: 97 ]]
                                                -- upvalues: v36 (copy)
                                                v36.DetonateEvent:FireServer();
                                            end);
                                        end;
                                    end);
                                    l_resume_0(l_create_0(function() --[[ Line: 102 ]]
                                        -- upvalues: v27 (ref)
                                        task.wait(10);
                                        if v27 ~= nil then
                                            v27:Disconnect();
                                            v27 = nil;
                                        end;
                                    end));
                                    v30 = true;
                                    v15 = v29.Equiped_Key.Value;
                                    if v28 == true then
                                        _G.can_perf_air_tang = false;
                                    end;
                                    if v28 == false then
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
                                    l_resume_0(l_create_0(function() --[[ Line: 128 ]]
                                        -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref)
                                        while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                            l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                            l_RunService_1.RenderStepped:wait();
                                        end;
                                    end));
                                    _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                    local v40 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.blood_burst.land_mines);
                                    v40:Play();
                                    l_resume_0(l_create_0(function() --[[ Line: 139 ]]
                                        -- upvalues: v0 (ref), v32 (copy), v40 (copy)
                                        task.wait(0.22);
                                        if v0.currentid == v32 then
                                            v40:AdjustSpeed(0);
                                        end;
                                    end));
                                end;
                            end;
                        end;
                        return v30;
                    end;
                end;
            end;
        end;
    end;
end;
local v41 = 0;
local v42 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v43) --[[ Line: 157 ]]
    -- upvalues: v42 (copy), v41 (ref)
    if table.find(v42, v43.Name) ~= nil then
        v41 = "";
    end;
end);
v0.Up = function(v44) --[[ Line: 158 ]]
    -- upvalues: v41 (ref), l_tick_0 (copy), v0 (copy), v10 (ref), v28 (ref), v1 (copy), v17 (ref)
    if v44 == nil then
        return;
    else
        local v45 = _G.generateid();
        v41 = v45;
        repeat
            task.wait();
        until l_tick_0() - 0 >= 0.22;
        if v45 ~= v41 then
            v0.Cancel(v44);
            return true;
        else
            local v46 = _G.generateid();
            v0.currentid = v46;
            v10 = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    _G:Initiate_C("land_mines_release_sound", l_HumanoidRootPart_1);
                    if v0.currentid == v46 and l_HumanoidRootPart_1 ~= nil then
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("land_mines_place", l_Character_1, l_HumanoidRootPart_1.CFrame);
                    end;
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "Cancel";
                        l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                        game.Debris:AddItem(l_thunderclapandflashbg_0, 0.5);
                    end;
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 0.5);
                    end;
                    for _, v54 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v54.Name == "land_mines" then
                            v54:AdjustSpeed(1);
                        end;
                    end;
                end;
            end;
            task.wait(0.5);
            if v44 ~= nil and v44:FindFirstChild("LastUsed") ~= nil then
                v44.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            if v28 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            v17 = false;
            return true;
        end;
    end;
end;
v0.Cancel = function(v55) --[[ Line: 218 ]]
    -- upvalues: v0 (copy), v27 (ref), l_tick_0 (copy), v28 (ref), v1 (copy), v17 (ref)
    if v55 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if v27 ~= nil then
            v27:Disconnect();
            v27 = nil;
        end;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v60 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v60.Name == "thunderclap_and_flash_bv" or v60.Name == "thunderclapandflashbg" then
                        v60:Destroy();
                    end;
                end;
                for _, v62 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v62.Name == "land_mines" then
                        v62:Stop();
                    end;
                end;
            end;
        end;
        task.wait(0.5);
        if v55 ~= nil and v55:FindFirstChild("LastUsed") ~= nil then
            v55.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v28 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        v17 = false;
        return true;
    end;
end;
return v0;