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
local v12 = "";
local v13 = {
    "Stun", 
    "KnockedOut", 
    "RagDoll"
};
v7.ChildAdded:Connect(function(v14) --[[ Line: 16 ]]
    -- upvalues: v13 (copy), v12 (ref)
    if table.find(v13, v14.Name) ~= nil then
        v12 = "";
    end;
end);
local v15 = false;
local v16 = 0;
local v17 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v18) --[[ Line: 22 ]]
    -- upvalues: v17 (copy), v16 (ref)
    if table.find(v17, v18.Name) ~= nil then
        v16 = "";
    end;
end);
v0.Down = function(v19) --[[ Line: 29 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v15 (ref), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy)
    if v19 == nil then
        return;
    else
        local v20 = false;
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
                            v15 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(37) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                if v15 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                v20 = true;
                                _G:Initiate_C("arrow_activated_effect", l_Character_0);
                                if v15 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v27 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v27:IsA("BodyVelocity") then
                                            v27:Destroy();
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
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 83 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_0.RenderStepped:Wait();
                                    end;
                                end));
                                v8 = l_tick_0();
                                l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Dream.Dream_bda_Spiritual_core_attempt):Play();
                                game.Debris:AddItem(l_BodyGyro_0, 0.6);
                                game.Debris:AddItem(l_BodyVelocity_0, 0.6);
                                task.delay(0.29, function() --[[ Line: 95 ]]
                                    -- upvalues: v0 (ref), v22 (copy), l_HumanoidRootPart_0 (copy), l_Character_0 (copy)
                                    if v0.currentid == v22 then
                                        _G:Initiate_C("Play_Sound", l_HumanoidRootPart_0, game.ReplicatedStorage.Sounds.Sword.Rapid_Swing);
                                    end;
                                    task.wait(0.12);
                                    if v0.currentid == v22 and l_HumanoidRootPart_0 ~= nil then
                                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("dream_spiriutla_core_damage", l_Character_0, l_HumanoidRootPart_0.CFrame);
                                    end;
                                end);
                            end;
                        end;
                    end;
                    return v20;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v30) --[[ Line: 115 ]]
    -- upvalues: v16 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), l_LocalPlayer_0 (copy), v15 (ref), v1 (copy)
    if v30 == nil then
        return;
    else
        local v31 = _G.generateid();
        v16 = v31;
        repeat
            wait();
        until l_tick_0() - v8 >= 0.6;
        if v31 ~= v16 then
            v0.Cancel(v30);
            return true;
        else
            v0.currentid = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                    for _, v34 in pairs(game.Workspace.Debree:GetChildren()) do
                        if v34.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v34);
                            v34:Destroy();
                        end;
                    end;
                end;
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    for _, v38 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                        if v38.Name == "thunderclap_and_flash_bv" or v38.Name == "thunderclapandflashbg" then
                            v38:Destroy();
                        end;
                    end;
                    for _, v40 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v40.Name == "Dream_Man_Hypnosis" then
                            v40:Stop();
                        end;
                    end;
                end;
            end;
            if v30 ~= nil and v30:FindFirstChild("LastUsed") ~= nil then
                v30.LastUsed.Value = l_tick_0();
            end;
            if v15 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v41) --[[ Line: 164 ]]
    -- upvalues: v0 (copy), l_LocalPlayer_0 (copy), l_tick_0 (copy), v15 (ref), v1 (copy)
    if v41 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                for _, v44 in pairs(game.Workspace.Debree:GetChildren()) do
                    if v44.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v44);
                        v44:Destroy();
                    end;
                end;
            end;
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v48 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v48.Name == "thunderclap_and_flash_bv" or v48.Name == "thunderclapandflashbg" then
                        v48:Destroy();
                    end;
                end;
                for _, v50 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v50.Name == "Dream_Man_Hypnosis" then
                        v50:Stop();
                    end;
                end;
            end;
        end;
        if v41 ~= nil and v41:FindFirstChild("LastUsed") ~= nil then
            v41.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v15 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;