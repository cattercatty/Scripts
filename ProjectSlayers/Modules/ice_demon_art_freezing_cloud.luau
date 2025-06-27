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
local v12 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
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
v0.Down = function(v20) --[[ Line: 30 ]]
    -- upvalues: v19 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy)
    if v20 == nil then
        return;
    else
        local v21 = false;
        v19 = false;
        if v20 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local l_Id_0 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
            if l_Id_0 == nil then
                return;
            else
                l_Id_0 = l_Id_0.Value;
                if l_Id_0 == nil then
                    return;
                elseif l_get_item_health_0(l_Id_0, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v23 = _G.generateid();
                    v0.currentid = v23;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v19 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(35, 0) then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v21 = true;
                                if v19 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v19 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v28 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v28:IsA("BodyVelocity") then
                                            v28:Destroy();
                                        end;
                                    end;
                                end;
                                local v29 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Ice.slide_asd_cloud2);
                                v29.TimePosition = 0.25;
                                v29:Play();
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
                                local v32 = false;
                                _G:Initiate_C("Ice_SlideStart", l_Character_0, true);
                                do
                                    local l_v32_0 = v32;
                                    l_resume_0(l_create_0(function() --[[ Line: 86 ]]
                                        -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_v32_0 (ref), l_BodyVelocity_0 (copy), l_RunService_0 (ref)
                                        while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                            if l_HumanoidRootPart_0 ~= nil and l_v32_0 == true then
                                                l_BodyVelocity_0.Velocity = l_BodyGyro_0.CFrame.lookVector * 45;
                                            else
                                                l_BodyVelocity_0.Velocity = Vector3.new();
                                            end;
                                            l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                            l_RunService_0.RenderStepped:wait();
                                        end;
                                    end));
                                    l_resume_0(l_create_0(function() --[[ Line: 98 ]]
                                        -- upvalues: v0 (ref), v23 (copy), l_v32_0 (ref), l_Humanoid_0 (copy)
                                        if v0.currentid == v23 then
                                            l_v32_0 = true;
                                            l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Ice.slide_asd_cloud1):Play();
                                        end;
                                    end));
                                end;
                            end;
                        end;
                    end;
                    return v21;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v34) --[[ Line: 125 ]]
    -- upvalues: v0 (copy), v14 (ref), l_resume_0 (copy), l_create_0 (copy), l_tick_0 (copy), l_TweenService_0 (copy), v12 (copy), v7 (copy), v19 (ref), v1 (copy)
    if v34 == nil then
        return;
    else
        local v35 = _G.generateid();
        v0.currentid = v35;
        local v36 = _G.generateid();
        v14 = v36;
        local l_Character_1 = game.Players.LocalPlayer.Character;
        if l_Character_1 ~= nil then
            _G:Initiate_C("Ice_SlideStart", l_Character_1, false);
            _G:Initiate_C("explosive_burst_arm_eff_thingasd", l_Character_1, false);
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
                for _, v44 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v44.Name == "slide_asd_cloud1" then
                        v44:Stop();
                    end;
                end;
                l_resume_0(l_create_0(function() --[[ Line: 152 ]]
                    -- upvalues: l_tick_0 (ref), v36 (copy), v14 (ref), v0 (ref), v35 (copy), l_Character_1 (copy), l_HumanoidRootPart_1 (copy)
                    _G.Skills_Performance(script.Name, l_tick_0(), 1);
                    if v36 == v14 and v0.currentid == v35 then
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("freezing_cloud_damage", l_Character_1, l_HumanoidRootPart_1.CFrame);
                    end;
                end));
                if l_thunderclap_and_flash_bv_0 ~= nil then
                    l_TweenService_0:Create(l_thunderclap_and_flash_bv_0, v12, {
                        Velocity = Vector3.new(0, 0, 0, 0)
                    }):Play();
                    game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 0.4);
                end;
                if l_thunderclapandflashbg_0 ~= nil then
                    game.Debris:AddItem(l_thunderclapandflashbg_0, 0.4);
                end;
                if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                    l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                end;
            end;
        end;
        if v34 ~= nil and v34:FindFirstChild("LastUsed") ~= nil then
            v34.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.4);
        if v19 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
v0.Cancel = function(v45) --[[ Line: 193 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v19 (ref), v1 (copy)
    if v45 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            _G:Initiate_C("Ice_SlideStart", l_Character_2, false);
            _G:Initiate_C("explosive_burst_arm_eff_thingasd", l_Character_2, false);
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v50 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v50.Name == "thunderclap_and_flash_bv" or v50.Name == "thunderclapandflashbg" then
                        v50:Destroy();
                    end;
                end;
                for _, v52 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v52.Name == "slide_asd_cloud1" then
                        v52:Stop();
                    end;
                end;
            end;
        end;
        if v45 ~= nil and v45:FindFirstChild("LastUsed") ~= nil then
            v45.LastUsed.Value = l_tick_0();
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