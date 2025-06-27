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
local v12 = TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
local l_get_item_health_0 = require(game.ReplicatedStorage.Modules.Server.Server_Modules:WaitForChild("get_item_health"));
local v14 = false;
local v15 = {};
local v16 = "";
local _ = {
    "Stun", 
    "KnockedOut", 
    "RagDoll"
};
local v18 = 0;
local v19 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v20) --[[ Line: 20 ]]
    -- upvalues: v19 (copy), v18 (ref)
    if table.find(v19, v20.Name) ~= nil then
        v18 = "";
    end;
end);
v7.ChildAdded:Connect(function(v21) --[[ Line: 21 ]]
    -- upvalues: v19 (copy), v16 (ref), v15 (copy)
    if table.find(v19, v21.Name) ~= nil then
        if v16 ~= "" then
            for _, v23 in pairs(v15) do
                v23:Destroy();
            end;
        end;
        v16 = "";
    end;
end);
local v24 = nil;
local l_UserInputService_0 = game:GetService("UserInputService");
local v26 = false;
l_UserInputService_0.InputBegan:Connect(function(v27, v28) --[[ Line: 36 ]]
    -- upvalues: v24 (ref), l_LocalPlayer_0 (copy), v26 (ref)
    if v28 == false and v24 ~= nil and v27.KeyCode.Name == game.ReplicatedStorage.Player_Data:FindFirstChild(l_LocalPlayer_0.Name).Keys:FindFirstChild(v24)["2"].Value and workspace.Debree:FindFirstChild("playersmarkedfor" .. l_LocalPlayer_0.Name) ~= nil and v26 == false then
        v26 = true;
        if game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil then
            game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Moves.blood_burst.ultdetonateanim):Play();
        end;
        task.wait(0.4);
        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("detonate_for_blood_burasd", l_LocalPlayer_0);
        task.wait(0.8);
        v26 = false;
    end;
end);
v0.Down = function(v29) --[[ Line: 54 ]]
    -- upvalues: v14 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), v24 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy)
    local v30 = false;
    v14 = false;
    if workspace.Debree:FindFirstChild("playersmarkedfor" .. l_LocalPlayer_0.Name) ~= nil then
        return;
    elseif v29 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
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
                local v32 = _G.generateid();
                v0.currentid = v32;
                if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                    if v1:Check() ~= true then
                        v14 = true;
                    end;
                    local l_Character_0 = game.Players.LocalPlayer.Character;
                    if l_Character_0 ~= nil then
                        local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                        local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                        if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(40, 0) then
                            _G.Skills_Performance(script.Name, l_tick_0(), 5);
                            v30 = true;
                            if v14 == true then
                                _G.can_perf_air_tang = false;
                            end;
                            if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                l_HumanoidRootPart_0.air123123bp:Destroy();
                            end;
                            v8 = l_tick_0();
                            if v14 == false then
                                v1.Disabled = true;
                            end;
                            v24 = v29.Equiped_Key.Value;
                            if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                for _, v37 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                    if v37:IsA("BodyVelocity") then
                                        v37:Destroy();
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
                            l_BodyGyro_0.MaxTorque = Vector3.new(0, 40000, 0, 0);
                            l_BodyGyro_0.Name = "thunderclapandflashbg";
                            l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                            l_resume_0(l_create_0(function() --[[ Line: 109 ]]
                                -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                    l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                    l_RunService_0.RenderStepped:wait();
                                end;
                            end));
                            local v40 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Reaper.tackle_skill_anim);
                            v40:Play();
                            l_resume_0(l_create_0(function() --[[ Line: 118 ]]
                                -- upvalues: v0 (ref), v32 (copy), v40 (copy)
                                task.wait(0.3);
                                if v0.currentid == v32 then
                                    v40:AdjustSpeed(0);
                                end;
                            end));
                        end;
                    end;
                end;
                return v30;
            end;
        end;
    end;
end;
Lerp = function(v41, v42, v43) --[[ Line: 135 ]] --[[ Name: Lerp ]]
    return v41 + (v42 - v41) * v43;
end;
local _ = math.random;
v0.Up = function(v45) --[[ Line: 139 ]]
    -- upvalues: v18 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v16 (ref), v7 (copy), v15 (copy), l_resume_0 (copy), l_create_0 (copy), l_TweenService_0 (copy), v12 (copy), v14 (ref), v1 (copy)
    if v45 == nil then
        return;
    else
        local v46 = _G.generateid();
        v18 = v46;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.3;
        if v46 ~= v18 then
            v0.Cancel(v45);
            return true;
        else
            _G.Skills_Performance(script.Name, l_tick_0(), 1);
            v0.currentid = _G.generateid();
            local v47 = _G.generateid();
            v16 = v47;
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "Cancel";
                        l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                    end;
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        local l_StringValue_1 = Instance.new("StringValue");
                        l_StringValue_1.Name = "cant_move";
                        l_StringValue_1.Parent = v7;
                        game.Debris:AddItem(l_StringValue_1, 0.59);
                        local _ = l_HumanoidRootPart_1.CFrame * CFrame.new(0, 0, -100);
                        local l_BodyPosition_0 = Instance.new("BodyPosition");
                        table.insert(v15, l_thunderclap_and_flash_bv_0);
                        table.insert(v15, l_BodyPosition_0);
                        l_BodyPosition_0.MaxForce = Vector3.new(0, 0, 0, 0);
                        l_BodyPosition_0.Position = l_HumanoidRootPart_1.Position;
                        l_BodyPosition_0.Parent = l_HumanoidRootPart_1;
                        l_thunderclap_and_flash_bv_0.MaxForce = Vector3.new(40000, 10000, 40000, 0);
                        local v57 = l_HumanoidRootPart_1.CFrame.lookVector * 550;
                        l_thunderclap_and_flash_bv_0.Velocity = Vector3.new(v57.X, 0, v57.Z);
                        for _, v59 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                            if v59.Name == "tackle_skill_anim" then
                                v59:AdjustSpeed(1);
                            end;
                        end;
                        l_resume_0(l_create_0(function() --[[ Line: 191 ]]
                            -- upvalues: v47 (copy), v16 (ref), l_Character_1 (copy), l_HumanoidRootPart_1 (copy)
                            if v47 == v16 and v47 == v16 then
                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("quick_tackle_damage_reaper123asd", l_Character_1, l_HumanoidRootPart_1.CFrame);
                            end;
                        end));
                        _G:Initiate_C("quick_tackle_effect_reaper", l_HumanoidRootPart_1.CFrame, l_HumanoidRootPart_1);
                        task.wait(0.0335);
                        if l_BodyPosition_0 ~= nil then
                            l_BodyPosition_0:Destroy();
                        end;
                        if l_thunderclap_and_flash_bv_0 ~= nil then
                            l_TweenService_0:Create(l_thunderclap_and_flash_bv_0, v12, {
                                Velocity = Vector3.new()
                            }):Play();
                            game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 0.25);
                        end;
                        if l_thunderclapandflashbg_0 ~= nil then
                            game.Debris:AddItem(l_thunderclapandflashbg_0, 0.25);
                        end;
                        if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                            l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                        end;
                    end;
                end;
            end;
            if v45 ~= nil and v45:FindFirstChild("LastUsed") ~= nil then
                v45.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.15);
            if v14 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v60) --[[ Line: 232 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v14 (ref), v1 (copy)
    if v60 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v65 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v65.Name == "thunderclap_and_flash_bv" or v65.Name == "thunderclapandflashbg" then
                        v65:Destroy();
                    end;
                end;
                for _, v67 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v67.Name == "tackle_skill_anim" then
                        v67:Stop();
                    end;
                end;
            end;
        end;
        if v60 ~= nil and v60:FindFirstChild("LastUsed") ~= nil then
            v60.LastUsed.Value = l_tick_0();
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