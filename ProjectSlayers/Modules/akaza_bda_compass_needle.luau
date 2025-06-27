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
local _ = game:GetService("TweenService");
local _ = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
local l_RunService_1 = game:GetService("RunService");
local _ = {
    [1] = 0.85, 
    [2] = 1.08, 
    [3] = 1.32, 
    [4] = 1.47, 
    [5] = 2.35
};
local l_Player_skills_handler_0 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Client"):WaitForChild("Player_skills_handler"));
local v19 = 0;
local v20 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v21) --[[ Line: 33 ]]
    -- upvalues: v20 (copy), v19 (ref)
    if table.find(v20, v21.Name) ~= nil then
        v19 = "";
    end;
end);
v0.Down = function(v22) --[[ Line: 34 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), v7 (copy), l_tick_0 (copy), l_Player_skills_handler_0 (copy), l_resume_0 (copy), l_create_0 (copy), l_RunService_1 (copy), v19 (ref), v8 (ref)
    if v22 == nil then
        return;
    else
        local v23 = false;
        if v22 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v24 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v24 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v24 == false then
                v24 = nil;
            end;
            if v24 == nil then
                return;
            else
                v24 = v24.Value;
                if v24 == nil then
                    return;
                elseif l_get_item_health_0(v24, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v25 = _G.generateid();
                    v0.currentid = v25;
                    if v1:Check() == true or v7:FindFirstChild("Blocking") ~= nil then
                        if v7:FindFirstChild("Blocking") ~= nil then
                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("remove_blocking", v7);
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(45, 0) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v23 = true;
                                l_Player_skills_handler_0:Force_Up();
                                if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                    l_HumanoidRootPart_0.air123123bp:Destroy();
                                end;
                                v1.Disabled = true;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(40000, 40000, 40000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new(0, 0, 0, 0);
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 10000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(0, 10000, 0, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 87 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, l_HumanoidRootPart_0.Position + workspace.CurrentCamera.CFrame.LookVector * 50);
                                        l_RunService_1.RenderStepped:Wait();
                                    end;
                                end));
                                local v31 = _G.generateid();
                                v19 = v31;
                                task.delay(0.55, function() --[[ Line: 95 ]]
                                    -- upvalues: v0 (ref), v25 (copy), v19 (ref), v31 (copy), l_tick_0 (ref), l_Character_0 (copy)
                                    if v0.currentid == v25 and v19 == v31 then
                                        _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                        _G:Initiate_C("Akaza_compass_needle_activate", l_Character_0);
                                    end;
                                end);
                                v8 = l_tick_0();
                                l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Akaza.compaps_needle_actibjasdasd):Play();
                                game.Debris:AddItem(l_BodyGyro_0, 0.8);
                                game.Debris:AddItem(l_BodyVelocity_0, 0.8);
                            end;
                        end;
                    end;
                    if v22 ~= nil and v22:FindFirstChild("LastUsed") ~= nil and v23 == true then
                        v22.LastUsed.Value = l_tick_0();
                    end;
                    if v23 == true then
                        task.wait(0.9);
                    end;
                    v1.Disabled = false;
                    _G.can_perf_air_tang = true;
                    return v23;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v32) --[[ Line: 130 ]]
    -- upvalues: v19 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v1 (copy)
    if v32 == nil then
        return;
    else
        local v33 = _G.generateid();
        v19 = v33;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.35;
        if v33 ~= v19 then
            v0.Cancel(v32);
            return true;
        else
            local v34 = _G.generateid();
            v0.currentid = v34;
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                _G:Initiate_C("Akaza_On_Hand", l_Character_1:FindFirstChild("LeftHand"), false);
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    task.delay(0.15, function() --[[ Line: 143 ]]
                        -- upvalues: v34 (copy), v0 (ref), l_Character_1 (copy)
                        if v34 == v0.currentid then
                            _G:Initiate_C("akaza_air_type_fire", l_Character_1, _G.getmousepos());
                        end;
                    end);
                    for _, v39 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                        if v39.Name == "thunderclap_and_flash_bv" or v39.Name == "thunderclapandflashbg" then
                            game.Debris:AddItem(v39, 0.4);
                        end;
                    end;
                    for _, v41 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v41.Name == "Akaza_Air_Type" then
                            v41:AdjustSpeed(1);
                        end;
                    end;
                end;
            end;
            if v32 ~= nil and v32:FindFirstChild("LastUsed") ~= nil then
                v32.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.6);
            v1.Disabled = false;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v42) --[[ Line: 174 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v1 (copy)
    if v42 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            _G:Initiate_C("Akaza_On_Hand", l_Character_2:FindFirstChild("LeftHand"), false);
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v47 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v47.Name == "thunderclap_and_flash_bv" or v47.Name == "thunderclapandflashbg" then
                        v47:Destroy();
                    end;
                end;
                for _, v49 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v49.Name == "Akaza_Air_Type" then
                        v49:Stop();
                    end;
                end;
            end;
        end;
        if v42 ~= nil and v42:FindFirstChild("LastUsed") ~= nil then
            v42.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        v1.Disabled = false;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;