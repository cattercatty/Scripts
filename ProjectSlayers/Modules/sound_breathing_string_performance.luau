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
local l_TweenService_0 = game:GetService("TweenService");
local v12 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
local v13 = {};
local v14 = "";
local v15 = {
    "Stun", 
    "KnockedOut", 
    "RagDoll"
};
v7.ChildAdded:Connect(function(v16) --[[ Line: 18 ]]
    -- upvalues: v15 (copy), v14 (ref), v13 (copy)
    if table.find(v15, v16.Name) ~= nil then
        if v14 ~= "" then
            for _, v18 in pairs(v13) do
                v18:Destroy();
            end;
        end;
        v14 = "";
    end;
end);
local v19 = false;
local v20 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Global"):WaitForChild("skills_custom_add_thing"))[script.Name];
local v21 = 0;
v0.Down = function(v22) --[[ Line: 37 ]]
    -- upvalues: v19 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v21 (ref), v8 (ref), l_resume_0 (copy), l_create_0 (copy), v20 (copy), l_RunService_0 (copy)
    if v22 == nil then
        return;
    else
        v19 = false;
        local v23 = false;
        if v22 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
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
                    local v25 = _G.generateid();
                    v0.currentid = v25;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v19 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(25, 50) then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v23 = true;
                                v21 = 0;
                                if v19 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v19 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                    for _, v30 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v30.Name == "air123123bp" then
                                            game.Debris:AddItem(v30, 0.25);
                                        end;
                                    end;
                                end;
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v32 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v32:IsA("BodyVelocity") then
                                            v32:Destroy();
                                        end;
                                    end;
                                end;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(10000, 0, 10000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new();
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 20000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(0, 10000, 0, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                local v35 = 0;
                                _G:Initiate_C("StringPerformanceRun", l_Character_0, true);
                                local v36 = 0;
                                do
                                    local l_v35_0, l_v36_0 = v35, v36;
                                    l_resume_0(l_create_0(function() --[[ Line: 97 ]]
                                        -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_BodyVelocity_0 (copy), v0 (ref), v25 (copy), l_tick_0 (ref), l_v35_0 (ref), l_v36_0 (ref), v21 (ref), v20 (ref), l_Character_0 (copy), v22 (copy), l_RunService_0 (ref)
                                        while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                            if l_HumanoidRootPart_0 ~= nil then
                                                l_BodyVelocity_0.Velocity = workspace.CurrentCamera.CFrame.LookVector * 70;
                                            else
                                                l_BodyVelocity_0.Velocity = Vector3.new();
                                            end;
                                            if v0.currentid == v25 then
                                                if l_tick_0() - l_v35_0 >= 0.27 then
                                                    l_v35_0 = l_tick_0();
                                                    _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                                end;
                                                if l_tick_0() - l_v36_0 >= 0.19 then
                                                    if _G:StamBreath(4, 0) == true and v21 < v20 then
                                                        l_v36_0 = l_tick_0();
                                                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("sound_breathing_string_performance_damage", l_Character_0, l_HumanoidRootPart_0.CFrame);
                                                        v21 = v21 + 1;
                                                    else
                                                        v0.Up(v22);
                                                    end;
                                                end;
                                            end;
                                            l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, l_HumanoidRootPart_0.Position + workspace.CurrentCamera.CFrame.LookVector * 10);
                                            l_RunService_0.RenderStepped:wait();
                                        end;
                                    end));
                                    l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Sound.sound_breathing_string_performance_anim):Play();
                                end;
                            end;
                        end;
                    end;
                    return v23;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v39) --[[ Line: 141 ]]
    -- upvalues: l_tick_0 (copy), v8 (ref), v0 (copy), v14 (ref), l_TweenService_0 (copy), v12 (copy), v7 (copy), v19 (ref), v1 (copy)
    if v39 == nil then
        return;
    else
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0;
        v0.currentid = _G.generateid();
        local v40 = _G.generateid();
        v14 = v40;
        local v41 = nil;
        local l_Character_1 = game.Players.LocalPlayer.Character;
        if l_Character_1 ~= nil then
            _G:Initiate_C("StringPerformanceRun", l_Character_1, false);
            local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                if l_thunderclapandflashbg_0 ~= nil then
                    local l_StringValue_0 = Instance.new("StringValue");
                    l_StringValue_0.Name = "Cancel";
                    l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                end;
                if l_thunderclap_and_flash_bv_0 ~= nil then
                    l_thunderclap_and_flash_bv_0.MaxForce = Vector3.new(10000, 0, 10000, 0);
                end;
                for _, v49 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v49.Name == "sound_breathing_string_performance_anim" then
                        v49:Stop();
                    end;
                end;
                if l_thunderclap_and_flash_bv_0 ~= nil then
                    l_TweenService_0:Create(l_thunderclap_and_flash_bv_0, v12, {
                        Velocity = Vector3.new(0, 0, 0, 0)
                    }):Play();
                end;
                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                if v40 == v14 and l_HumanoidRootPart_1 ~= nil then
                    v41 = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("string_performance_Damage_2asdasd", l_Character_1, l_HumanoidRootPart_1.CFrame);
                end;
                if l_thunderclap_and_flash_bv_0 ~= nil then
                    game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 0.15);
                end;
                if l_thunderclapandflashbg_0 ~= nil then
                    game.Debris:AddItem(l_thunderclapandflashbg_0, 0.15);
                end;
                if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                    l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                end;
            end;
        end;
        if v39 ~= nil and v39:FindFirstChild("LastUsed") ~= nil then
            v39.LastUsed.Value = l_tick_0();
        end;
        local v50 = v41 == true and 3.45 or 0.4;
        local v51 = l_tick_0();
        repeat
            task.wait(0.05);
        until v50 < l_tick_0() - v51 or v7:FindFirstChild("asd123q23Cancel123asd") ~= nil;
        if v19 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
v0.Cancel = function(v52) --[[ Line: 222 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v19 (ref), v1 (copy)
    if v52 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                _G:Initiate_C("StringPerformanceRun", l_Character_2, false);
                for _, v57 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v57.Name == "thunderclap_and_flash_bv" or v57.Name == "thunderclapandflashbg" then
                        v57:Destroy();
                    end;
                end;
                for _, v59 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v59.Name == "sound_breathing_string_performance_anim" then
                        v59:Stop();
                    end;
                end;
            end;
        end;
        if v52 ~= nil and v52:FindFirstChild("LastUsed") ~= nil then
            v52.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v19 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;