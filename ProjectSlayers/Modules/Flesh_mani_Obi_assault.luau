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
local v13 = false;
local l_RunService_1 = game:GetService("RunService");
v0.Down = function(v15) --[[ Line: 22 ]]
    -- upvalues: v13 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), l_resume_0 (copy), l_create_0 (copy), l_RunService_1 (copy)
    if v15 == nil then
        return;
    else
        local v16 = false;
        v13 = false;
        if v15 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v17 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v17 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v17 == false then
                v17 = nil;
            end;
            if v17 == nil then
                return;
            else
                v17 = v17.Value;
                if v17 == nil then
                    return;
                elseif l_get_item_health_0(v17, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    v0.currentid = _G.generateid();
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v13 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(0, 0) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v16 = true;
                                if v13 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                    l_HumanoidRootPart_0.air123123bp:Destroy();
                                end;
                                if v13 == false then
                                    v1.Disabled = true;
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
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 71 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_1.RenderStepped:wait();
                                    end;
                                end));
                                task.delay(0.2, function() --[[ Line: 77 ]]
                                    -- upvalues: l_Character_0 (copy), l_HumanoidRootPart_0 (copy)
                                    _G:Initiate_C("Obi Assault", l_Character_0, l_HumanoidRootPart_0.CFrame, "Start");
                                end);
                                l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.FleshM.Obi_assault_attempt):Play();
                            end;
                        end;
                    end;
                    return v16;
                end;
            end;
        end;
    end;
end;
local v23 = 0;
local v24 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v25) --[[ Line: 97 ]]
    -- upvalues: v24 (copy), v23 (ref)
    if table.find(v24, v25.Name) ~= nil then
        v23 = "";
    end;
end);
v0.Up = function(v26) --[[ Line: 98 ]]
    -- upvalues: v23 (ref), l_tick_0 (copy), v0 (copy), v10 (ref), l_resume_0 (copy), l_create_0 (copy), v13 (ref), v1 (copy)
    if v26 == nil then
        return;
    else
        local v27 = _G.generateid();
        v23 = v27;
        repeat
            task.wait();
        until l_tick_0() - 0 >= 0.427;
        if v27 ~= v23 then
            v0.Cancel(v26);
            return true;
        else
            local v28 = _G.generateid();
            v0.currentid = v28;
            v10 = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    l_resume_0(l_create_0(function() --[[ Line: 113 ]]
                        -- upvalues: v0 (ref), v28 (copy), l_tick_0 (ref), l_HumanoidRootPart_1 (copy), l_Character_1 (copy)
                        task.wait(0.05);
                        if v0.currentid == v28 then
                            _G.Skills_Performance(script.Name, l_tick_0(), 2);
                            local l_CFrame_0 = l_HumanoidRootPart_1.CFrame;
                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("Flesh_mani_Obi_assault_damage", l_Character_1, l_CFrame_0);
                        end;
                    end));
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
                end;
            end;
            if v26 ~= nil and v26:FindFirstChild("LastUsed") ~= nil then
                v26.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            if v13 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v36) --[[ Line: 156 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v13 (ref), v1 (copy)
    if v36 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v41 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v41.Name == "thunderclap_and_flash_bv" or v41.Name == "thunderclapandflashbg" then
                        v41:Destroy();
                    end;
                end;
                for _, v43 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v43.Name == "Obi_assault_attempt" then
                        v43:Stop();
                    end;
                end;
            end;
        end;
        if v36 ~= nil and v36:FindFirstChild("LastUsed") ~= nil then
            v36.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v13 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;