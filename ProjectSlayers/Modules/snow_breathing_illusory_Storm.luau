local v0 = {
    currentid = ""
};
local v1 = require(game.ReplicatedStorage.Modules.Client.character_handler);
local _ = coroutine.resume;
local _ = coroutine.create;
local _ = game:GetService("RunService");
local _ = game.Players.LocalPlayer:GetMouse();
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v7 = game.ReplicatedStorage.PlayerValues:WaitForChild(l_LocalPlayer_0.Name);
local v8 = 0;
local l_tick_0 = tick;
local l_get_item_health_0 = require(game.ReplicatedStorage.Modules.Server.Server_Modules:WaitForChild("get_item_health"));
local v11 = "";
local l_TweenService_0 = game:GetService("TweenService");
local v13 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
local v14 = {
    "Stun", 
    "KnockedOut", 
    "RagDoll"
};
v7.ChildAdded:Connect(function(v15) --[[ Line: 17 ]]
    -- upvalues: v14 (copy), v11 (ref)
    if table.find(v14, v15.Name) ~= nil then
        v11 = "";
    end;
end);
local v16 = false;
local _ = game:GetService("RunService");
v0.Down = function(v18) --[[ Line: 24 ]]
    -- upvalues: v16 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), l_TweenService_0 (copy), v13 (copy)
    if v18 == nil then
        return;
    else
        local v19 = false;
        v16 = false;
        if v18 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent == nil then
            return;
        else
            local v20 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil then
                v20 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v20 == false then
                v20 = nil;
            end;
            if v20 == nil then
                return;
            else
                v20 = v20.Value;
                if v20 == nil then
                    return;
                elseif l_get_item_health_0(v20, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v21 = _G.generateid();
                    v0.currentid = v21;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v16 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(10, 20) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                v19 = true;
                                if v16 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                    l_HumanoidRootPart_0.air123123bp:Destroy();
                                end;
                                if v16 == false then
                                    v1.Disabled = true;
                                end;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                                l_BodyVelocity_0.Velocity = l_HumanoidRootPart_0.CFrame.lookVector * -50;
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                v8 = l_tick_0();
                                l_TweenService_0:Create(l_BodyVelocity_0, v13, {
                                    Velocity = Vector3.new()
                                }):Play();
                                local v26 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Snow.illusory_Storm_Start);
                                v26:Play();
                                _G:Initiate_C("IllusoryStormSlash", l_Character_0, 1);
                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("snow_breathing_illusory_Storm_damage", l_Character_0, l_HumanoidRootPart_0.CFrame, 1);
                                do
                                    local l_v26_0 = v26;
                                    task.spawn(function() --[[ Line: 89 ]]
                                        -- upvalues: v0 (ref), v21 (copy), l_v26_0 (ref), l_Humanoid_0 (copy), l_Character_0 (copy), l_HumanoidRootPart_0 (copy)
                                        task.wait(0.3);
                                        if v0.currentid == v21 then
                                            l_v26_0 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Snow.illusory_Storm_2);
                                            l_v26_0:Play();
                                            _G:Initiate_C("IllusoryStormSlash", l_Character_0, 2);
                                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("snow_breathing_illusory_Storm_damage", l_Character_0, l_HumanoidRootPart_0.CFrame, 2);
                                            task.wait(0.3);
                                            if v0.currentid == v21 then
                                                l_v26_0 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Snow.illusory_Storm_3);
                                                l_v26_0:Play();
                                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("snow_breathing_illusory_Storm_damage", l_Character_0, l_HumanoidRootPart_0.CFrame, 3);
                                                _G:Initiate_C("IllusoryStormSlash", l_Character_0, 3);
                                            end;
                                        end;
                                    end);
                                end;
                            end;
                        end;
                    end;
                    return v19;
                end;
            end;
        end;
    end;
end;
local v28 = 0;
local v29 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v30) --[[ Line: 117 ]]
    -- upvalues: v29 (copy), v28 (ref)
    if table.find(v29, v30.Name) ~= nil then
        v28 = "";
    end;
end);
v0.Up = function(v31) --[[ Line: 118 ]]
    -- upvalues: v28 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v16 (ref), v1 (copy)
    if v31 == nil then
        return;
    else
        local v32 = _G.generateid();
        v28 = v32;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.8;
        if v32 ~= v28 then
            v0.Cancel(v31);
            return true;
        else
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
                        if v39.Name == "frozen_desert" then
                            v39:Stop();
                        end;
                    end;
                end;
            end;
            if v31 ~= nil and v31:FindFirstChild("LastUsed") ~= nil then
                v31.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            if v16 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v40) --[[ Line: 157 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v16 (ref), v1 (copy)
    if v40 == nil then
        return;
    else
        print("AA");
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
                    if v47.Name == "frozen_desert" then
                        v47:Stop();
                    end;
                end;
            end;
        end;
        if v40 ~= nil and v40:FindFirstChild("LastUsed") ~= nil then
            v40.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v16 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;