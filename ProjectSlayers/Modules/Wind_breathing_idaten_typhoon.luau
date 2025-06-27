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
local l_TweenService_0 = game:GetService("TweenService");
local v15 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
local l_RunService_1 = game:GetService("RunService");
local v17 = {
    [1] = 0.85, 
    [2] = 1.08, 
    [3] = 1.32, 
    [4] = 1.47, 
    [5] = 2.35
};
local v18 = false;
v0.Down = function(v19) --[[ Line: 32 ]]
    -- upvalues: v18 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_TweenService_0 (copy), v15 (copy), v17 (copy), l_RunService_1 (copy)
    if v19 == nil then
        return;
    else
        local v20 = false;
        v18 = false;
        if v19 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent == nil then
            return;
        else
            local v21 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil then
                v21 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v21 == false then
                v21 = nil;
            end;
            if v21 == nil then
                return;
            else
                v21 = v21.Value;
                if v21 == nil then
                    return;
                elseif l_get_item_health_0(v21, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v22 = _G.generateid();
                    v0.currentid = v22;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v18 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(15, 20) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v20 = true;
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                if v18 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                    l_HumanoidRootPart_0.air123123bp:Destroy();
                                end;
                                if v18 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(40000, 40000, 40000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new(0, 0, 0, 0);
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 10000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(0, 10000, 0, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 84 ]]
                                    -- upvalues: l_HumanoidRootPart_0 (copy), v0 (ref), v22 (copy), l_BodyVelocity_0 (copy), l_TweenService_0 (ref), v15 (ref)
                                    task.wait(0.25);
                                    _G:Initiate_C("final_go_in_air_wind", l_HumanoidRootPart_0.CFrame, l_HumanoidRootPart_0);
                                    if v0.currentid == v22 then
                                        l_BodyVelocity_0.Velocity = Vector3.new(0, 50, 0, 0);
                                        task.wait(0.3);
                                        if v0.currentid == v22 then
                                            l_TweenService_0:Create(l_BodyVelocity_0, v15, {
                                                Velocity = Vector3.new()
                                            }):Play();
                                        end;
                                    end;
                                end));
                                for v28 = 1, 5 do
                                    l_resume_0(l_create_0(function() --[[ Line: 97 ]]
                                        -- upvalues: v17 (ref), v28 (copy), v0 (ref), v22 (copy), l_Character_0 (copy), l_HumanoidRootPart_0 (copy), v19 (copy)
                                        task.wait(v17[v28]);
                                        if v0.currentid == v22 then
                                            if _G:StamBreath(5, 0) == true then
                                                _G:Initiate_C("Wind_breathing_wind_slash_release", l_Character_0, l_HumanoidRootPart_0.CFrame, v28, _G.getmousepos());
                                                return;
                                            else
                                                v0.Up(v19);
                                            end;
                                        end;
                                    end));
                                end;
                                l_resume_0(l_create_0(function() --[[ Line: 109 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_1.RenderStepped:wait();
                                    end;
                                end));
                                l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Wind.idatentyphoon):Play();
                            end;
                        end;
                    end;
                    return v20;
                end;
            end;
        end;
    end;
end;
local v29 = 0;
local v30 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v31) --[[ Line: 132 ]]
    -- upvalues: v30 (copy), v29 (ref)
    if table.find(v30, v31.Name) ~= nil then
        v29 = "";
    end;
end);
v0.Up = function(v32) --[[ Line: 133 ]]
    -- upvalues: v29 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v18 (ref), v1 (copy)
    if v32 == nil then
        return;
    else
        v29 = _G.generateid();
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.6;
        v0.currentid = _G.generateid();
        local l_Character_1 = game.Players.LocalPlayer.Character;
        if l_Character_1 ~= nil then
            local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                for _, v37 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                    if v37.Name == "thunderclap_and_flash_bv" or v37.Name == "thunderclapandflashbg" then
                        v37:Destroy();
                    end;
                end;
                for _, v39 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v39.Name == "idatentyphoon" and v39.TimePosition < 2.2 then
                        v39:Stop();
                    end;
                end;
            end;
        end;
        if v32 ~= nil and v32:FindFirstChild("LastUsed") ~= nil then
            v32.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v18 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
v0.Cancel = function(v40) --[[ Line: 173 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v18 (ref), v1 (copy)
    if v40 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v45 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v45.Name == "thunderclap_and_flash_bv" or v45.Name == "thunderclapandflashbg" then
                        v45:Destroy();
                    end;
                end;
                for _, v47 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v47.Name == "idatentyphoon" then
                        v47:Stop();
                    end;
                end;
            end;
        end;
        if v40 ~= nil and v40:FindFirstChild("LastUsed") ~= nil then
            v40.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v18 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;