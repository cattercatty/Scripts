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
local v11 = 0;
local _ = TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
local _ = game:GetService("TweenService");
local v14 = false;
local v15 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Global"):WaitForChild("skills_custom_add_thing"))[script.Name];
local v16 = 0;
v0.Down = function(v17) --[[ Line: 20 ]]
    -- upvalues: v14 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v11 (ref), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy)
    if v17 == nil then
        return;
    else
        local v18 = false;
        v14 = false;
        if v17 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
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
                    local v20 = _G.generateid();
                    v0.currentid = v20;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v14 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(50, 55) then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v18 = true;
                                if v14 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                v11 = l_tick_0();
                                if v14 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
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
                                l_BodyGyro_0.P = 20000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(1.0000000200408773E21, 1.0000000200408773E21, 1.0000000200408773E21, 0);
                                l_BodyGyro_0.Name = "thunderslashesgyro";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 80 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_0.RenderStepped:wait();
                                    end;
                                end));
                                local v28 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.MistBreathing.mist_breathing_obscuring_clouds);
                                v28:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 89 ]]
                                    -- upvalues: v20 (copy), v0 (ref), v28 (copy)
                                    task.wait(0.3);
                                    if v20 == v0.currentid then
                                        v28:AdjustSpeed(0);
                                    end;
                                end));
                            end;
                        end;
                    end;
                    return v18;
                end;
            end;
        end;
    end;
end;
local v29 = 0;
local v30 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v31) --[[ Line: 107 ]]
    -- upvalues: v30 (copy), v29 (ref)
    if table.find(v30, v31.Name) ~= nil then
        v29 = "";
    end;
end);
v0.Up = function(v32) --[[ Line: 108 ]]
    -- upvalues: v29 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v16 (ref), v7 (copy), v15 (copy), v14 (ref), v1 (copy)
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
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    v16 = 0;
                    local l_BoolValue_0 = Instance.new("BoolValue");
                    l_BoolValue_0.Name = "Invisible2";
                    l_BoolValue_0.Parent = v7;
                    game.Debris:AddItem(l_BoolValue_0, 8);
                    local l_BoolValue_1 = Instance.new("BoolValue");
                    l_BoolValue_1.Name = "dsieapera123asd";
                    l_BoolValue_1.Parent = v7;
                    game.Debris:AddItem(l_BoolValue_1, 8);
                    local l_BoolValue_2 = Instance.new("BoolValue");
                    l_BoolValue_2.Name = "obscuringcloudsinvisiblityshit123asd";
                    l_BoolValue_2.Parent = v7;
                    game.Debris:AddItem(l_BoolValue_2, 8);
                    _G.Skills_Performance(script.Name, l_tick_0(), 1);
                    for _, v42 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v42.Name == "mist_breathing_obscuring_clouds" then
                            v42:AdjustSpeed(1);
                        end;
                    end;
                    task.delay(0.1, function() --[[ Line: 149 ]]
                        -- upvalues: v0 (ref), v34 (copy), l_HumanoidRootPart_1 (copy), l_Character_1 (copy), v7 (ref), v16 (ref), v15 (ref)
                        if v0.currentid == v34 and l_HumanoidRootPart_1 ~= nil then
                            local v43 = CFrame.new(l_HumanoidRootPart_1.Position);
                            _G:Initiate_C("MistObscuringclouds_effects", l_Character_1);
                            task.spawn(function() --[[ Line: 153 ]]
                                -- upvalues: v7 (ref), v16 (ref), v15 (ref), l_Character_1 (ref), v43 (copy)
                                for _ = 1, 25 do
                                    if v7 ~= nil and game.Players.LocalPlayer ~= nil and game.Players.LocalPlayer.Character ~= nil and v16 < v15 and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("mist_obscuring_cloud_damage", l_Character_1, v43);
                                    end;
                                    wait(0.4);
                                end;
                            end);
                        end;
                    end);
                    if l_HumanoidRootPart_1:FindFirstChild("thunderclapting") ~= nil then
                        for _, v46 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                            if v46.Name == "thunderclapting" then
                                v46:Destroy();
                            end;
                        end;
                    end;
                    local l_thunderslashesgyro_0 = l_HumanoidRootPart_1:FindFirstChild("thunderslashesgyro");
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 0.5);
                    end;
                    if l_thunderslashesgyro_0 ~= nil then
                        game.Debris:AddItem(l_thunderslashesgyro_0, 0.5);
                    end;
                    if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                        l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                    end;
                end;
            end;
            if v32 ~= nil and v32:FindFirstChild("LastUsed") ~= nil then
                v32.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.5);
            if v14 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v49) --[[ Line: 208 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v14 (ref), v1 (copy)
    if v49 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                if l_HumanoidRootPart_2:FindFirstChild("thunderclapting") ~= nil then
                    for _, v54 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                        if v54.Name == "thunderclapting" then
                            v54:Destroy();
                        end;
                    end;
                end;
                for _, v56 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v56.Name == "thunderclap_and_flash_bv" or v56.Name == "thunderslashesgyro" then
                        v56:Destroy();
                    end;
                end;
                for _, v58 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v58.Name == "mist_breathing_obscuring_clouds" then
                        v58:Stop();
                    end;
                end;
            end;
        end;
        if v49 ~= nil and v49:FindFirstChild("LastUsed") ~= nil then
            v49.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v14 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;