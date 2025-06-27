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
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(15, 20) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v17 = true;
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
                                    l_resume_0(l_create_0(function() --[[ Line: 74 ]]
                                        -- upvalues: l_v25_0 (ref)
                                        task.wait(0.25);
                                        l_v25_0 = true;
                                    end));
                                    l_resume_0(l_create_0(function() --[[ Line: 78 ]]
                                        -- upvalues: l_tick_0 (ref), v0 (ref), v19 (copy), l_HumanoidRootPart_0 (copy), v16 (copy), l_LocalPlayer_0 (ref)
                                        _G.Skills_Performance(script.Name, l_tick_0(), 2);
                                        local v27 = {
                                            [1] = 0.5
                                        };
                                        for v28 = 1, 3 do
                                            task.wait(v27[v28] or 0.35);
                                            if v0.currentid ~= v19 or l_HumanoidRootPart_0 == nil then
                                                v0.Up(v16);
                                                return;
                                            elseif _G:StamBreath(5, 0) == true then
                                                local l_CFrame_0 = l_HumanoidRootPart_0.CFrame;
                                                _G:Initiate_C("cold_mountain_eff", l_CFrame_0);
                                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("cold_wind_storm_damage", l_LocalPlayer_0.Character, l_CFrame_0);
                                            else
                                                v0.Up(v16);
                                            end;
                                        end;
                                    end));
                                    l_resume_0(l_create_0(function() --[[ Line: 95 ]]
                                        -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref), l_v25_0 (ref), l_BodyVelocity_0 (copy)
                                        while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                            l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                            l_RunService_1.RenderStepped:wait();
                                            if l_v25_0 == true then
                                                l_BodyVelocity_0.Velocity = l_BodyGyro_0.CFrame.lookVector * 30;
                                            end;
                                        end;
                                    end));
                                    l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Wind.asd123):Play();
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
local v30 = 0;
local v31 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v32) --[[ Line: 121 ]]
    -- upvalues: v31 (copy), v30 (ref)
    if table.find(v31, v32.Name) ~= nil then
        v30 = "";
    end;
end);
v0.Up = function(v33) --[[ Line: 122 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v14 (ref), v1 (copy)
    if v33 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_1 = game.Players.LocalPlayer.Character;
        if l_Character_1 ~= nil then
            local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                for _, v38 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                    if v38.Name == "thunderclap_and_flash_bv" or v38.Name == "thunderclapandflashbg" then
                        v38:Destroy();
                    end;
                end;
                for _, v40 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v40.Name == "asd123" and v40.TimePosition < 1.2 then
                        v40:Stop();
                    end;
                end;
            end;
        end;
        if v33 ~= nil and v33:FindFirstChild("LastUsed") ~= nil then
            v33.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v14 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
v0.Cancel = function(v41) --[[ Line: 158 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v14 (ref), v1 (copy)
    if v41 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v46 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v46.Name == "thunderclap_and_flash_bv" or v46.Name == "thunderclapandflashbg" then
                        v46:Destroy();
                    end;
                end;
                for _, v48 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v48.Name == "asd123" then
                        v48:Stop();
                    end;
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
return v0;