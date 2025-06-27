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
local _ = game:GetService("TweenService");
local _ = TweenInfo.new(0.03, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true, 0);
local l_get_item_health_0 = require(game.ReplicatedStorage.Modules.Server.Server_Modules:WaitForChild("get_item_health"));
local v13 = false;
local v14 = false;
local v15 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Global"):WaitForChild("skills_custom_add_thing"))[script.Name];
local v16 = 0;
v0.Down = function(v17) --[[ Line: 21 ]]
    -- upvalues: v14 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v16 (ref), v13 (ref), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy), v15 (copy)
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
                        if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(20, 27) then
                            v16 = 0;
                            _G.Skills_Performance(script.Name, l_tick_0(), 5);
                            v18 = true;
                            v13 = true;
                            if v14 == true then
                                _G.can_perf_air_tang = false;
                            end;
                            v8 = l_tick_0();
                            _G.Skills_Performance(script.Name, l_tick_0(), 1);
                            if v14 == false then
                                v1.Disabled = true;
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
                            l_BodyGyro_0.P = 20000;
                            l_BodyGyro_0.MaxTorque = Vector3.new(1.0000000200408773E21, 1.0000000200408773E21, 1.0000000200408773E21, 0);
                            l_BodyGyro_0.Name = "thunderclapandflashbg";
                            l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                            l_resume_0(l_create_0(function() --[[ Line: 73 ]]
                                -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                    l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                    l_RunService_0.RenderStepped:wait();
                                end;
                            end));
                            local v28 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.WaterBreathing.water_wheel);
                            v28:Play();
                            local v29 = false;
                            do
                                local l_v28_0, l_v29_0 = v28, v29;
                                l_resume_0(l_create_0(function() --[[ Line: 83 ]]
                                    -- upvalues: v0 (ref), v20 (copy), l_v28_0 (ref), l_Humanoid_0 (copy), l_resume_0 (ref), l_create_0 (ref), l_BodyVelocity_0 (copy), l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_v29_0 (ref), l_Character_0 (copy), v16 (ref), v15 (ref), v17 (copy)
                                    task.wait(0.35);
                                    if v0.currentid == v20 then
                                        l_v28_0:Stop();
                                        l_v28_0 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.WaterBreathing.water_wheel_loop);
                                        l_v28_0:Play();
                                        local v32 = {};
                                        l_resume_0(l_create_0(function() --[[ Line: 92 ]]
                                            -- upvalues: l_BodyVelocity_0 (ref), l_BodyGyro_0 (ref), l_HumanoidRootPart_0 (ref), l_v29_0 (ref), l_Character_0 (ref), l_Humanoid_0 (ref), v16 (ref), v15 (ref), v0 (ref), v17 (ref), v32 (copy), v20 (ref)
                                            while l_BodyVelocity_0 ~= nil and l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyVelocity_0.Parent ~= nil and l_BodyGyro_0 ~= nil and l_HumanoidRootPart_0 ~= nil and l_v29_0 == false and l_Character_0 ~= nil and l_Humanoid_0 ~= nil and l_Humanoid_0.Health > 0 and l_Character_0:FindFirstChild("HumanoidRootPart") ~= nil do
                                                local v33 = false;
                                                if _G:Stamina(2) ~= true or v15 <= v16 then
                                                    l_v29_0 = true;
                                                    v33 = true;
                                                    v0.Up(v17);
                                                end;
                                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("water_wheel_damage", l_Character_0, l_HumanoidRootPart_0.CFrame, v32);
                                                v16 = v16 + 1;
                                                if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                                    task.wait(0.18);
                                                else
                                                    task.wait(0.25);
                                                end;
                                                if v33 == true then
                                                    break;
                                                end;
                                            end;
                                            if v0.currentid == v20 then
                                                v0.Cancel(v17);
                                            end;
                                        end));
                                        _G:Initiate_C("water_wheel_effect", l_Character_0, l_HumanoidRootPart_0);
                                        l_BodyVelocity_0.MaxForce = Vector3.new(40000, 0, 40000, 0);
                                        while l_BodyVelocity_0 ~= nil and l_BodyVelocity_0.Parent ~= nil and l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0 ~= nil and l_HumanoidRootPart_0 ~= nil do
                                            if l_HumanoidRootPart_0:FindFirstChild("air123123bp") == nil then
                                                l_BodyVelocity_0.Velocity = l_HumanoidRootPart_0.CFrame.lookVector * 55;
                                            else
                                                l_BodyVelocity_0.Velocity = Vector3.new();
                                            end;
                                            task.wait();
                                        end;
                                    end;
                                end));
                            end;
                        end;
                    end;
                end;
                return v18;
            end;
        end;
    end;
end;
Lerp = function(v34, v35, v36) --[[ Line: 149 ]] --[[ Name: Lerp ]]
    return v34 + (v35 - v34) * v36;
end;
local v37 = 0;
local v38 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v39) --[[ Line: 152 ]]
    -- upvalues: v38 (copy), v37 (ref)
    if table.find(v38, v39.Name) ~= nil then
        v37 = "";
    end;
end);
local _ = math.random;
v0.Up = function(v41) --[[ Line: 154 ]]
    -- upvalues: v37 (ref), v13 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), l_resume_0 (copy), l_create_0 (copy), v7 (copy), v14 (ref), v1 (copy)
    if v41 == nil then
        return true;
    else
        v37 = _G.generateid();
        if v13 == false then
            return true;
        else
            v13 = false;
            repeat
                task.wait();
            until l_tick_0() - v8 >= 1.5;
            v0.currentid = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    for _, v46 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v46.Name == "water_wheel_loop" then
                            v46:Stop();
                        end;
                    end;
                    if l_Humanoid_1 ~= nil then
                        l_Humanoid_1:LoadAnimation(game.ReplicatedStorage.Animations.Moves.WaterBreathing.water_wheel_end):Play();
                    end;
                    l_resume_0(l_create_0(function() --[[ Line: 176 ]]
                        -- upvalues: l_HumanoidRootPart_1 (copy)
                        task.wait(0.14);
                        if l_HumanoidRootPart_1 ~= nil then
                            _G:Initiate_C("sword_combat_ground_slash_effect2", l_HumanoidRootPart_1.CFrame);
                        end;
                    end));
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    _G:Initiate_C("water_wheel_effect", l_Character_1, l_HumanoidRootPart_1, false);
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        l_thunderclap_and_flash_bv_0:Destroy();
                    end;
                    if l_thunderclapandflashbg_0 ~= nil then
                        l_thunderclapandflashbg_0:Destroy();
                    end;
                    if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                        l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                    end;
                end;
            end;
            if v41 ~= nil and v41:FindFirstChild("LastUsed") ~= nil then
                v41.LastUsed.Value = l_tick_0();
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
v0.Cancel = function(v49) --[[ Line: 264 ]]
    -- upvalues: v13 (ref), v0 (copy), l_tick_0 (copy), v14 (ref), v1 (copy)
    if v49 == nil then
        return;
    elseif v13 == false then
        return true;
    else
        v13 = false;
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                _G:Initiate_C("water_wheel_effect", l_Character_2, l_HumanoidRootPart_2, false);
                for _, v54 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v54.Name == "thunderclap_and_flash_bv" or v54.Name == "thunderclapandflashbg" then
                        v54:Destroy();
                    end;
                end;
                for _, v56 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v56.Name == "water_wheel_loop" then
                        v56:Stop();
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