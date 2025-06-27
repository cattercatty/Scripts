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
local l_TweenService_0 = game:GetService("TweenService");
local _ = TweenInfo.new(0.03, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true, 0);
local l_get_item_health_0 = require(game.ReplicatedStorage.Modules.Server.Server_Modules:WaitForChild("get_item_health"));
local v13 = TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
local v14 = {};
local v15 = "";
local v16 = {
    "Stun", 
    "KnockedOut", 
    "RagDoll"
};
v7.ChildAdded:Connect(function(v17) --[[ Line: 19 ]]
    -- upvalues: v16 (copy), v15 (ref), v14 (copy)
    if table.find(v16, v17.Name) ~= nil then
        if v15 ~= "" then
            for _, v19 in pairs(v14) do
                v19:Destroy();
            end;
        end;
        v15 = "";
    end;
end);
local v20 = false;
v0.Down = function(v21) --[[ Line: 30 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v20 (ref), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy)
    local v22 = false;
    if v21 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
        return;
    elseif l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent == nil then
        return;
    else
        local l_Id_0 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id");
        if l_Id_0 == nil then
            return;
        else
            v20 = false;
            l_Id_0 = l_Id_0.Value;
            if l_Id_0 == nil then
                return;
            elseif l_get_item_health_0(l_Id_0, game.Players.LocalPlayer.Name) ~= true then
                return;
            else
                local v24 = _G.generateid();
                v0.currentid = v24;
                if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                    if v1:Check() ~= true then
                        v20 = true;
                    end;
                    local l_Character_0 = game.Players.LocalPlayer.Character;
                    if l_Character_0 ~= nil then
                        local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                        local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                        if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(36, 32) then
                            _G.Skills_Performance(script.Name, l_tick_0(), 5);
                            v22 = true;
                            if v20 == true then
                                _G.can_perf_air_tang = false;
                            end;
                            v8 = l_tick_0();
                            if v20 == false then
                                v1.Disabled = true;
                            end;
                            if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                for _, v29 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                    if v29:IsA("BodyVelocity") then
                                        v29:Destroy();
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
                            l_resume_0(l_create_0(function() --[[ Line: 80 ]]
                                -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                    l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                    l_RunService_0.RenderStepped:wait();
                                end;
                            end));
                            _G:Initiate_C("Play_Sound", l_HumanoidRootPart_0, game.ReplicatedStorage.Sounds.beast.start_up5);
                            l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Beast.beast_devouring_slash):Play();
                            task.spawn(function() --[[ Line: 89 ]]
                                -- upvalues: l_BodyVelocity_0 (copy), v0 (ref), v24 (copy), l_HumanoidRootPart_0 (copy)
                                task.wait(0.45);
                                if l_BodyVelocity_0 ~= nil and v0.currentid == v24 then
                                    _G:Initiate_C("beast_dash_eff_thang", l_HumanoidRootPart_0);
                                    while l_BodyVelocity_0 ~= nil and l_HumanoidRootPart_0 ~= nil and l_BodyVelocity_0.Parent == l_HumanoidRootPart_0 and l_BodyVelocity_0:FindFirstChild("Cancel") == nil do
                                        l_BodyVelocity_0.Velocity = l_HumanoidRootPart_0.CFrame.lookVector * 45;
                                        task.wait();
                                    end;
                                end;
                            end);
                        end;
                    end;
                end;
                return v22;
            end;
        end;
    end;
end;
Lerp = function(v32, v33, v34) --[[ Line: 110 ]] --[[ Name: Lerp ]]
    return v32 + (v33 - v32) * v34;
end;
local v35 = 0;
local v36 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v37) --[[ Line: 113 ]]
    -- upvalues: v36 (copy), v35 (ref)
    if table.find(v36, v37.Name) ~= nil then
        v35 = "";
    end;
end);
local _ = math.random;
v0.Up = function(v39) --[[ Line: 115 ]]
    -- upvalues: v35 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v15 (ref), l_TweenService_0 (copy), v13 (copy), l_resume_0 (copy), l_create_0 (copy), v7 (copy), v20 (ref), v1 (copy)
    if v39 == nil then
        return;
    else
        local v40 = _G.generateid();
        v35 = v40;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.39;
        if v40 ~= v35 then
            v0.Cancel(v39);
            return true;
        else
            v0.currentid = _G.generateid();
            local v41 = _G.generateid();
            v15 = v41;
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    _G:Initiate_C("beast_dash_eff_thang", l_HumanoidRootPart_1, false);
                    for _, v46 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v46.Name == "beast_devouring_slash" then
                            if v46.TimePosition < 1.3 then
                                v46.TimePosition = 1.3;
                            end;
                            v46:AdjustSpeed(1);
                        end;
                    end;
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        if l_thunderclap_and_flash_bv_0 ~= nil then
                            local l_StringValue_0 = Instance.new("StringValue");
                            l_StringValue_0.Name = "Cancel";
                            l_StringValue_0.Parent = l_thunderclap_and_flash_bv_0;
                            l_TweenService_0:Create(l_thunderclap_and_flash_bv_0, v13, {
                                Velocity = Vector3.new()
                            }):Play();
                        end;
                        if l_thunderclapandflashbg_0 ~= nil then
                            local l_StringValue_1 = Instance.new("StringValue");
                            l_StringValue_1.Name = "Cancel";
                            l_StringValue_1.Parent = l_thunderclapandflashbg_0;
                        end;
                        l_thunderclap_and_flash_bv_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                        l_resume_0(l_create_0(function() --[[ Line: 155 ]]
                            -- upvalues: l_HumanoidRootPart_1 (copy), v15 (ref), v41 (copy), l_Character_1 (copy)
                            task.wait(0.12);
                            if l_HumanoidRootPart_1 ~= nil and v15 == v41 then
                                _G:Initiate_C("devouring_slash_effectasdasd", l_HumanoidRootPart_1);
                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("beast_devouring_slash_damage", l_Character_1, l_HumanoidRootPart_1.CFrame);
                            end;
                        end));
                        task.wait(0.2);
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
            end;
            if v39 ~= nil and v39:FindFirstChild("LastUsed") ~= nil then
                v39.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            if v20 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v51) --[[ Line: 193 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v20 (ref), v1 (copy)
    if v51 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                _G:Initiate_C("beast_dash_eff_thang", l_HumanoidRootPart_2, false);
                for _, v56 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v56.Name == "thunderclap_and_flash_bv" or v56.Name == "thunderclapandflashbg" then
                        v56:Destroy();
                    end;
                end;
                for _, v58 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v58.Name == "beast_devouring_slash" then
                        v58:Stop();
                    end;
                end;
            end;
        end;
        if v51 ~= nil and v51:FindFirstChild("LastUsed") ~= nil then
            v51.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v20 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;