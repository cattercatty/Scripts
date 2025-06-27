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
local v14 = false;
local _ = game:GetService("RunService");
v0.Down = function(v16) --[[ Line: 22 ]]
    -- upvalues: v14 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), l_resume_0 (copy), l_create_0 (copy)
    if v16 == nil then
        return;
    else
        local v17 = false;
        v14 = false;
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
                    local v19 = _G.generateid();
                    v0.currentid = v19;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v14 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(0, 0) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                v17 = true;
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
                                l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                local v25 = script.TBCam:Clone();
                                v25.H.HRPW.Part1 = l_HumanoidRootPart_0;
                                game.Debris:AddItem(v25, 2.35);
                                v25.Parent = workspace.Debree;
                                v25.AnimationController:LoadAnimation(game.ReplicatedStorage.Animations.camasd):Play();
                                game.ReplicatedStorage.Remotes.camclient:Fire(v25);
                                local v26 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.FleshM.Obi_Obimultislash);
                                v26:Play();
                                _G:Initiate_C("Eight-Layed Obi Slash", l_Character_0, l_HumanoidRootPart_0.CFrame, "Start");
                                l_resume_0(l_create_0(function() --[[ Line: 84 ]]
                                    -- upvalues: v0 (ref), v19 (copy), v26 (copy)
                                    task.wait(1);
                                    if v0.currentid == v19 then
                                        v26:AdjustSpeed(0);
                                    end;
                                end));
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
v7.ChildAdded:Connect(function(v29) --[[ Line: 102 ]]
    -- upvalues: v28 (copy), v27 (ref)
    if table.find(v28, v29.Name) ~= nil then
        v27 = "";
    end;
end);
v0.Up = function(v30) --[[ Line: 103 ]]
    -- upvalues: v27 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v11 (ref), l_resume_0 (copy), l_create_0 (copy), v14 (ref), v1 (copy)
    if v30 == nil then
        return;
    else
        local v31 = _G.generateid();
        v27 = v31;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 1;
        if v31 ~= v27 then
            v0.Cancel(v30);
            return true;
        else
            local v32 = _G.generateid();
            v0.currentid = v32;
            v11 = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    l_resume_0(l_create_0(function() --[[ Line: 118 ]]
                        -- upvalues: l_tick_0 (ref), v0 (ref), v32 (copy), l_HumanoidRootPart_1 (copy), l_Character_1 (copy)
                        _G.Skills_Performance(script.Name, l_tick_0(), 2);
                        task.wait(0.115);
                        if v0.currentid == v32 then
                            local l_CFrame_0 = l_HumanoidRootPart_1.CFrame;
                            _G:Initiate_C("Eight-Layed Obi Slash", l_Character_1, l_HumanoidRootPart_1.CFrame, "Slash");
                            if v0.currentid == v32 then
                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("eght_leird_obi_dmg123asd", l_Character_1, l_CFrame_0 * CFrame.new(0, 0, -22));
                            end;
                            task.delay(0.6, function() --[[ Line: 129 ]]
                                -- upvalues: v0 (ref), v32 (ref), l_Character_1 (ref), l_CFrame_0 (copy)
                                if v0.currentid == v32 then
                                    game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("eght_leird_obi_dmg123asd", l_Character_1, l_CFrame_0 * CFrame.new(0, 0, -22), true);
                                end;
                            end);
                        end;
                    end));
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "Cancel";
                        l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                        game.Debris:AddItem(l_thunderclapandflashbg_0, 1.45);
                    end;
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 1.45);
                    end;
                    for _, v41 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v41.Name == "Obi_Obimultislash" then
                            v41:AdjustSpeed(1);
                        end;
                    end;
                end;
            end;
            if v30 ~= nil and v30:FindFirstChild("LastUsed") ~= nil then
                v30.LastUsed.Value = l_tick_0();
            end;
            task.wait(1.35);
            if v14 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v42) --[[ Line: 177 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v14 (ref), v1 (copy)
    if v42 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v47 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v47.Name == "thunderclap_and_flash_bv" or v47.Name == "thunderclapandflashbg" then
                        v47:Destroy();
                    end;
                end;
                for _, v49 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v49.Name == "Obi_Obimultislash" then
                        v49:Stop();
                    end;
                end;
            end;
        end;
        if v42 ~= nil and v42:FindFirstChild("LastUsed") ~= nil then
            v42.LastUsed.Value = l_tick_0();
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