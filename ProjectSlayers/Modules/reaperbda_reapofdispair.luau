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
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(7, 0) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v17 = true;
                                if v14 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v24 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v24:IsA("BodyVelocity") then
                                            v24:Destroy();
                                        end;
                                    end;
                                end;
                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("add_reaper_Arm_thing_to_character", l_Character_0);
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
                                local v27 = false;
                                do
                                    local l_v27_0 = v27;
                                    l_resume_0(l_create_0(function() --[[ Line: 82 ]]
                                        -- upvalues: l_v27_0 (ref)
                                        task.wait(0.25);
                                        l_v27_0 = true;
                                    end));
                                    l_resume_0(l_create_0(function() --[[ Line: 86 ]]
                                        -- upvalues: l_tick_0 (ref), v0 (ref), v19 (copy), l_HumanoidRootPart_0 (copy), v16 (copy), l_LocalPlayer_0 (ref)
                                        _G.Skills_Performance(script.Name, l_tick_0(), 2);
                                        local v29 = {
                                            [1] = 0.48
                                        };
                                        for v30 = 1, 2 do
                                            task.wait(v29[v30] or 0.42);
                                            if v0.currentid ~= v19 or l_HumanoidRootPart_0 == nil then
                                                v0.Up(v16);
                                                return;
                                            elseif _G:StamBreath(5, 0) == true then
                                                local l_CFrame_0 = l_HumanoidRootPart_0.CFrame;
                                                _G:Initiate_C("reaperasd123", l_CFrame_0);
                                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("reaper-slash_thing_damage", l_LocalPlayer_0.Character, l_CFrame_0);
                                            else
                                                v0.Up(v16);
                                            end;
                                        end;
                                    end));
                                    l_resume_0(l_create_0(function() --[[ Line: 103 ]]
                                        -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref), l_v27_0 (ref), l_BodyVelocity_0 (copy)
                                        while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                            l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                            l_RunService_1.RenderStepped:wait();
                                            if l_v27_0 == true then
                                                l_BodyVelocity_0.Velocity = l_BodyGyro_0.CFrame.lookVector * 30;
                                            end;
                                        end;
                                    end));
                                    l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Reaper.fstskill123asd):Play();
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
local v32 = 0;
local v33 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v34) --[[ Line: 129 ]]
    -- upvalues: v33 (copy), v32 (ref)
    if table.find(v33, v34.Name) ~= nil then
        v32 = "";
    end;
end);
v0.Up = function(v35) --[[ Line: 130 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v14 (ref), v1 (copy)
    if v35 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_1 = game.Players.LocalPlayer.Character;
        if l_Character_1 ~= nil then
            local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                for _, v40 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                    if v40.Name == "thunderclap_and_flash_bv" or v40.Name == "thunderclapandflashbg" then
                        v40:Destroy();
                    end;
                end;
                for _, v42 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v42.Name == "fstskill123asd" and v42.TimePosition < 1.2 then
                        v42:Stop();
                    end;
                end;
            end;
        end;
        if v35 ~= nil and v35:FindFirstChild("LastUsed") ~= nil then
            v35.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v14 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
v0.Cancel = function(v43) --[[ Line: 166 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v14 (ref), v1 (copy)
    if v43 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v48 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v48.Name == "thunderclap_and_flash_bv" or v48.Name == "thunderclapandflashbg" then
                        v48:Destroy();
                    end;
                end;
                for _, v50 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v50.Name == "fstskill123asd" then
                        v50:Stop();
                    end;
                end;
            end;
        end;
        if v43 ~= nil and v43:FindFirstChild("LastUsed") ~= nil then
            v43.LastUsed.Value = l_tick_0();
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