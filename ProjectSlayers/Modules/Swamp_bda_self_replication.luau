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
local v14 = RaycastParams.new();
v14.FilterDescendantsInstances = {
    workspace.Map
};
v14.FilterType = Enum.RaycastFilterType.Whitelist;
local l_RunService_1 = game:GetService("RunService");
local v16 = false;
local _ = game:GetService("TweenService");
local _ = TweenInfo.new(0.23, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
v0.Down = function(v19) --[[ Line: 30 ]]
    -- upvalues: v16 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_1 (copy)
    if v19 == nil then
        return;
    else
        local v20 = false;
        v16 = false;
        if v19 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v21 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v21 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v21 == false then
                v21 = nil;
            end;
            if v21 == nil then
                return;
            else
                v21 = v21.Value;
                if v21 == nil then
                    return;
                elseif l_get_item_health_0(v21, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v22 = _G.generateid();
                    v0.currentid = v22;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v16 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(67) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v20 = true;
                                if v16 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v16 == false then
                                    v1.Disabled = true;
                                end;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new();
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                v8 = l_tick_0();
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 20000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(0, 1.0000000200408773E21, 0, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 76 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_1.RenderStepped:wait();
                                    end;
                                end));
                                local v28 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Swamp.swamp_on_ground_Double);
                                v28:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 84 ]]
                                    -- upvalues: v0 (ref), v22 (copy), v28 (copy)
                                    task.wait(0.3);
                                    if v0.currentid == v22 then
                                        v28:AdjustSpeed(0);
                                    end;
                                end));
                            end;
                        end;
                    end;
                    return v20;
                end;
            end;
        end;
    end;
end;
local v29 = 0;
local v30 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v31) --[[ Line: 102 ]]
    -- upvalues: v30 (copy), v29 (ref)
    if table.find(v30, v31.Name) ~= nil then
        v29 = "";
    end;
end);
v0.Up = function(v32) --[[ Line: 103 ]]
    -- upvalues: v29 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v11 (ref), v16 (ref), v1 (copy)
    if v32 == nil then
        return;
    else
        local v33 = _G.generateid();
        v29 = v33;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.3;
        if v33 ~= v29 then
            v0.Cancel(v32);
            return true;
        else
            local v34 = _G.generateid();
            v0.currentid = v34;
            v11 = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    task.spawn(function() --[[ Line: 118 ]]
                        -- upvalues: l_tick_0 (ref), v0 (ref), v34 (copy), l_Character_1 (copy), l_HumanoidRootPart_1 (copy)
                        _G.Skills_Performance(script.Name, l_tick_0(), 2);
                        task.wait(0.15);
                        if v0.currentid == v34 then
                            _G:Initiate_C("swamp_traveling_claws_Startup3", {
                                Character = l_Character_1, 
                                EnterCF = l_HumanoidRootPart_1.CFrame
                            });
                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("perform_swamp_bda_replication_server", l_Character_1);
                        end;
                    end);
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "Cancel";
                        l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                        game.Debris:AddItem(l_thunderclapandflashbg_0, 0.25);
                    end;
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 0.25);
                    end;
                    for _, v42 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v42.Name == "swamp_on_ground_Double" then
                            v42:AdjustSpeed(1);
                        end;
                    end;
                end;
            end;
            if v32 ~= nil and v32:FindFirstChild("LastUsed") ~= nil then
                v32.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            if v16 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v43) --[[ Line: 165 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v16 (ref), v1 (copy)
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
                    if v50.Name == "swamp_on_ground_Double" then
                        v50:Stop();
                    end;
                end;
            end;
        end;
        if v43 ~= nil and v43:FindFirstChild("LastUsed") ~= nil then
            v43.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v16 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;