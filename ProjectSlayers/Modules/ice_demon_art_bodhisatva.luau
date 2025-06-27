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
v0.Down = function(v16) --[[ Line: 22 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v15 (ref), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy)
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
                    v0.currentid = _G.generateid();
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v15 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(60) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                if v15 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                v17 = true;
                                if v15 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v23 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v23:IsA("BodyVelocity") then
                                            v23:Destroy();
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
                                l_BodyGyro_0.MaxTorque = Vector3.new(1.0000000200408773E21, 1.0000000200408773E21, 1.0000000200408773E21, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                game.ReplicatedStorage.Remotes.ice_buddah_add_skill:FireServer(true);
                                l_resume_0(l_create_0(function() --[[ Line: 76 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_0.RenderStepped:Wait();
                                    end;
                                end));
                                local v26 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Ice.blodhistabava);
                                v26:Play();
                                v26:AdjustSpeed(1.5);
                            end;
                        end;
                    end;
                    return v17;
                end;
            end;
        end;
    end;
end;
local v27 = 0;
local v28 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v29) --[[ Line: 100 ]]
    -- upvalues: v28 (copy), v27 (ref)
    if table.find(v28, v29.Name) ~= nil then
        v27 = "";
    end;
end);
v0.Up = function(v30) --[[ Line: 101 ]]
    -- upvalues: v27 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v12 (ref), v15 (ref), v1 (copy)
    if v30 == nil then
        return;
    else
        local v31 = _G.generateid();
        v27 = v31;
        repeat
            wait();
        until l_tick_0() - v8 >= 3.5;
        if v31 ~= v27 then
            v0.Cancel(v30);
            return true;
        else
            v0.currentid = _G.generateid();
            v12 = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                game.ReplicatedStorage.Remotes.ice_buddah_add_skill:FireServer(false);
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    for _, v36 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                        if v36.Name == "thunderclap_and_flash_bv" or v36.Name == "thunderclapandflashbg" then
                            v36:Destroy();
                        end;
                    end;
                    for _, v38 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v38.Name == "blodhistabava" then
                            v38:Stop();
                        end;
                    end;
                end;
            end;
            if v30 ~= nil and v30:FindFirstChild("LastUsed") ~= nil then
                v30.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            if v15 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v39) --[[ Line: 142 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v15 (ref), v1 (copy)
    if v39 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            game.ReplicatedStorage.Remotes.ice_buddah_add_skill:FireServer(false);
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v44 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v44.Name == "thunderclap_and_flash_bv" or v44.Name == "thunderclapandflashbg" then
                        v44:Destroy();
                    end;
                end;
                for _, v46 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v46.Name == "blodhistabava" then
                        v46:Stop();
                    end;
                end;
            end;
        end;
        if v39 ~= nil and v39:FindFirstChild("LastUsed") ~= nil then
            v39.LastUsed.Value = l_tick_0();
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