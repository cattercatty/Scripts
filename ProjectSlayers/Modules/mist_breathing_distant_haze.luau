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
local v12 = TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
local l_TweenService_0 = game:GetService("TweenService");
local v14 = false;
v0.Down = function(v15) --[[ Line: 15 ]]
    -- upvalues: v14 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v11 (ref), l_TweenService_0 (copy), v12 (copy), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy)
    if v15 == nil then
        return;
    else
        local v16 = false;
        v14 = false;
        if v15 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
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
                    local v18 = _G.generateid();
                    v0.currentid = v18;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v14 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(20, 32) then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v16 = true;
                                if v14 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                v11 = l_tick_0();
                                local v22 = game.ReplicatedStorage.Assets.thunderricepsirit:Clone();
                                v22.CFrame = l_HumanoidRootPart_0.CFrame;
                                v22.Name = "ricespiritrootthing";
                                v22.Parent = l_HumanoidRootPart_0;
                                v22.Transparency = 0.65;
                                v22.Color = Color3.fromRGB(255, 255, 255);
                                v22.Mesh.Scale = Vector3.new(40, 40, 40, 0);
                                l_TweenService_0:Create(v22.Mesh, v12, {
                                    Scale = Vector3.new(90, 90, 90, 0)
                                }):Play();
                                if v14 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v24 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v24:IsA("BodyVelocity") then
                                            v24:Destroy();
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
                                l_resume_0(l_create_0(function() --[[ Line: 76 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_0.RenderStepped:wait();
                                    end;
                                end));
                                _G:Initiate_C("Mist_Distant_haze_initiate", l_Character_0);
                                local v27 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.MistBreathing.mist_breathing_distant_haze_animation);
                                v27:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 85 ]]
                                    -- upvalues: v18 (copy), v0 (ref), v27 (copy)
                                    task.wait(0.35);
                                    if v18 == v0.currentid then
                                        v27:AdjustSpeed(0);
                                    end;
                                end));
                            end;
                        end;
                    end;
                    return v16;
                end;
            end;
        end;
    end;
end;
local v28 = 0;
local v29 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v30) --[[ Line: 103 ]]
    -- upvalues: v29 (copy), v28 (ref)
    if table.find(v29, v30.Name) ~= nil then
        v28 = "";
    end;
end);
v0.Up = function(v31) --[[ Line: 104 ]]
    -- upvalues: v28 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v7 (copy), v14 (ref), v1 (copy)
    if v31 == nil then
        return;
    else
        local v32 = _G.generateid();
        v28 = v32;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.35;
        if v32 ~= v28 then
            v0.Cancel(v31);
            return true;
        else
            v0.currentid = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    _G.Skills_Performance(script.Name, l_tick_0(), 2);
                    for _, v37 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v37.Name == "mist_breathing_distant_haze_animation" then
                            v37:AdjustSpeed(1);
                        end;
                    end;
                    if l_HumanoidRootPart_1:FindFirstChild("ricespiritrootthing") ~= nil then
                        if l_HumanoidRootPart_1.ricespiritrootthing:FindFirstChild("Mesh") ~= nil then
                            local l_Y_0 = l_HumanoidRootPart_1.ricespiritrootthing.Mesh.Scale.Y;
                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("wind_distant_haze_dmg", l_Character_1, l_HumanoidRootPart_1.CFrame, l_Y_0);
                        end;
                        for _, v40 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                            if v40.Name == "ricespiritrootthing" then
                                v40:Destroy();
                            end;
                        end;
                    end;
                    if l_HumanoidRootPart_1:FindFirstChild("thunderclapting") ~= nil then
                        for _, v42 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                            if v42.Name == "thunderclapting" then
                                v42:Destroy();
                            end;
                        end;
                    end;
                    local l_thunderslashesgyro_0 = l_HumanoidRootPart_1:FindFirstChild("thunderslashesgyro");
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        l_thunderclap_and_flash_bv_0:Destroy();
                    end;
                    if l_thunderslashesgyro_0 ~= nil then
                        l_thunderslashesgyro_0:Destroy();
                    end;
                    if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                        l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                    end;
                end;
            end;
            if v31 ~= nil and v31:FindFirstChild("LastUsed") ~= nil then
                v31.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            if v14 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v45) --[[ Line: 182 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v14 (ref), v1 (copy)
    if v45 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                if l_HumanoidRootPart_2:FindFirstChild("ricespiritrootthing") ~= nil then
                    for _, v50 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                        if v50.Name == "ricespiritrootthing" then
                            v50:Destroy();
                        end;
                    end;
                end;
                if l_HumanoidRootPart_2:FindFirstChild("thunderclapting") ~= nil then
                    for _, v52 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                        if v52.Name == "thunderclapting" then
                            v52:Destroy();
                        end;
                    end;
                end;
                for _, v54 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v54.Name == "thunderclap_and_flash_bv" or v54.Name == "thunderslashesgyro" then
                        v54:Destroy();
                    end;
                end;
                for _, v56 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v56.Name == "mist_breathing_distant_haze_animation" then
                        v56:Stop();
                    end;
                end;
            end;
        end;
        if v45 ~= nil and v45:FindFirstChild("LastUsed") ~= nil then
            v45.LastUsed.Value = l_tick_0();
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