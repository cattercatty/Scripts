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
local l_RunService_1 = game:GetService("RunService");
v0.Down = function(v16) --[[ Line: 22 ]]
    -- upvalues: v14 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_1 (copy)
    if v16 == nil then
        return;
    else
        v14 = false;
        local v17 = false;
        if v16 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent == nil then
            return;
        else
            local v18 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil then
                v18 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id");
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
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(15, 27) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v17 = true;
                                _G:Initiate_C("sword_trail_eff_for_flame", l_Character_0, true);
                                if v14 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v14 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(10000, 0, 10000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new();
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 10000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(0, 10000, 0, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                local v25 = false;
                                do
                                    local l_v25_0 = v25;
                                    l_resume_0(l_create_0(function() --[[ Line: 75 ]]
                                        -- upvalues: l_v25_0 (ref)
                                        task.wait(0.25);
                                        l_v25_0 = true;
                                    end));
                                    l_resume_0(l_create_0(function() --[[ Line: 79 ]]
                                        -- upvalues: l_tick_0 (ref), v0 (ref), v19 (copy), l_HumanoidRootPart_0 (copy), v16 (copy), l_Character_0 (copy)
                                        _G.Skills_Performance(script.Name, l_tick_0(), 2);
                                        local v27 = {
                                            [1] = 0.415, 
                                            [2] = 0.385, 
                                            [3] = 0.6
                                        };
                                        local v28 = {
                                            [3] = 0.3
                                        };
                                        for v29 = 1, 3 do
                                            if v29 == 3 and v0.currentid == v19 then
                                                _G:Initiate_C("flame_breathing_tiger_head_end", l_HumanoidRootPart_0);
                                            end;
                                            local v30 = v27[v29] or 0.35;
                                            local v31 = v28[v29] or 0.29;
                                            task.wait(v31);
                                            if v0.currentid == v19 then
                                                if v29 <= 2 then
                                                    _G:Initiate_C("Play_Sound", l_HumanoidRootPart_0, game.ReplicatedStorage.Sounds.FlameTiger_SOund123asd.flame_tiger_1);
                                                    _G:Initiate_C("Play_Sound", l_HumanoidRootPart_0, game.ReplicatedStorage.Sounds.FlameTiger_SOund123asd.flame_tiger_2);
                                                else
                                                    _G:Initiate_C("Play_Sound", l_HumanoidRootPart_0, game.ReplicatedStorage.Sounds.FlameTiger_SOund123asd.flame_tiger_3);
                                                end;
                                            end;
                                            task.wait(v30 - v31);
                                            if v0.currentid ~= v19 or l_HumanoidRootPart_0 == nil then
                                                v0.Up(v16);
                                                return;
                                            elseif _G:StamBreath(5, 0) == true then
                                                local _ = l_HumanoidRootPart_0.CFrame;
                                                if v29 == 1 then
                                                    _G:Initiate_C("flame_tiger_skill123", l_Character_0, 1);
                                                elseif v29 == 2 then
                                                    _G:Initiate_C("flame_tiger_skill123", l_Character_0, 2);
                                                elseif v29 == 3 then
                                                    _G:Initiate_C("flame_tiger_skill123", l_Character_0, 3);
                                                end;
                                                if l_HumanoidRootPart_0 ~= nil then
                                                    game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("flame_tiger_damage", l_Character_0, l_HumanoidRootPart_0.CFrame, nil, v29 == 3 or nil);
                                                end;
                                            else
                                                v0.Up(v16);
                                            end;
                                        end;
                                    end));
                                    l_resume_0(l_create_0(function() --[[ Line: 124 ]]
                                        -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref), l_v25_0 (ref), l_BodyVelocity_0 (copy)
                                        while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                            l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                            l_RunService_1.RenderStepped:Wait();
                                            if l_v25_0 == true then
                                                l_BodyVelocity_0.Velocity = l_BodyGyro_0.CFrame.lookVector * 18;
                                            end;
                                        end;
                                    end));
                                    l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Flame.Flaming_Tiger):Play();
                                end;
                            end;
                        end;
                    end;
                    return v17;
                end;
            end;
        end;
    end;
end;
local v33 = 0;
local v34 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v35) --[[ Line: 150 ]]
    -- upvalues: v34 (copy), v33 (ref)
    if table.find(v34, v35.Name) ~= nil then
        v33 = "";
    end;
end);
v0.Up = function(v36) --[[ Line: 151 ]]
    -- upvalues: v33 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v14 (ref), v1 (copy)
    if v36 == nil then
        return;
    else
        local v37 = _G.generateid();
        v33 = v37;
        repeat
            wait();
        until l_tick_0() - v8 >= 0.6;
        if v37 ~= v33 then
            v0.Cancel(v36);
            return true;
        else
            v0.currentid = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                _G:Initiate_C("sword_trail_eff_for_flame", l_Character_1, false);
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    for _, v42 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                        if v42.Name == "thunderclap_and_flash_bv" or v42.Name == "thunderclapandflashbg" then
                            v42:Destroy();
                        end;
                    end;
                    for _, v44 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v44.Name == "Flaming_Tiger" and v44.TimePosition < 1.8 then
                            v44:Stop();
                        end;
                    end;
                end;
            end;
            if v36 ~= nil and v36:FindFirstChild("LastUsed") ~= nil then
                v36.LastUsed.Value = l_tick_0();
            end;
            wait(0.3);
            if v14 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v45) --[[ Line: 195 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v14 (ref), v1 (copy)
    if v45 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            _G:Initiate_C("sword_trail_eff_for_flame", l_Character_2, false);
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v50 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v50.Name == "thunderclap_and_flash_bv" or v50.Name == "thunderclapandflashbg" then
                        v50:Destroy();
                    end;
                end;
                for _, v52 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v52.Name == "Flaming_Tiger" then
                        v52:Stop();
                    end;
                end;
            end;
        end;
        if v45 ~= nil and v45:FindFirstChild("LastUsed") ~= nil then
            v45.LastUsed.Value = l_tick_0();
        end;
        wait(0.3);
        if v14 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;