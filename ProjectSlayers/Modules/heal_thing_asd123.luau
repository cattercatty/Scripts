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
local v11 = false;
local v12 = false;
v0.Down = function(v13) --[[ Line: 13 ]]
    -- upvalues: v12 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v11 (ref), v8 (ref), l_resume_0 (copy), l_create_0 (copy), v7 (copy), l_RunService_0 (copy)
    if v13 == nil then
        return;
    else
        local v14 = false;
        v12 = false;
        if v13 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("clan_skills_is_equiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("clan_skills_is_equiped", true).Parent == nil then
            return;
        else
            local l_Id_0 = l_LocalPlayer_0.Character:FindFirstChild("clan_skills_is_equiped", true).Parent:FindFirstChild("Id");
            if l_Id_0 == nil then
                return;
            else
                l_Id_0 = l_Id_0.Value;
                if l_Id_0 == nil then
                    return;
                elseif l_get_item_health_0(l_Id_0, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v16 = _G.generateid();
                    v0.currentid = v16;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v12 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(0, 0) then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                _G.Skills_Performance(script.Name, l_tick_0(), 2);
                                v14 = true;
                                game.ReplicatedStorage.Remotes.heal_tang123asd:FireServer(true);
                                v11 = true;
                                if v12 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v12 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v21 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v21:IsA("BodyVelocity") then
                                            v21:Destroy();
                                        end;
                                    end;
                                end;
                                local v22 = false;
                                local v23 = false;
                                do
                                    local l_v22_0, l_v23_0 = v22, v23;
                                    l_resume_0(l_create_0(function() --[[ Line: 58 ]]
                                        -- upvalues: l_v23_0 (ref), v16 (copy), v0 (ref), v7 (ref), l_v22_0 (ref), v11 (ref), v13 (copy)
                                        while l_v23_0 == false do
                                            wait();
                                            if v16 == v0.currentid and v7 ~= nil and game.Players.LocalPlayer ~= nil and game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and v7:FindFirstChild("Stamina") ~= nil and v7.Stamina.Value > 5 then
                                                _G:RemoveStam(5);
                                                if l_v22_0 == false then
                                                    l_v22_0 = nil;
                                                end;
                                                wait(0.26);
                                            else
                                                l_v23_0 = true;
                                                if v11 == true then
                                                    v0.Up(v13);
                                                    return;
                                                else
                                                    break;
                                                end;
                                            end;
                                        end;
                                    end));
                                    local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                    l_BodyVelocity_0.MaxForce = Vector3.new(10000, 0, 10000, 0);
                                    l_BodyVelocity_0.Velocity = Vector3.new();
                                    l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                    l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                    local l_BodyGyro_0 = Instance.new("BodyGyro");
                                    l_BodyGyro_0.P = 20000;
                                    l_BodyGyro_0.MaxTorque = Vector3.new(0, 1.0000000200408773E21, 0, 0);
                                    l_BodyGyro_0.Name = "thunderslashesgyro";
                                    l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                    l_resume_0(l_create_0(function() --[[ Line: 89 ]]
                                        -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                        while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                            l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                            l_RunService_0.RenderStepped:Wait();
                                        end;
                                    end));
                                    l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.clan_skills["3asdasd123asd"]):Play();
                                end;
                            end;
                        end;
                    end;
                    return v14;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v28) --[[ Line: 110 ]]
    -- upvalues: v11 (ref), v0 (copy), v7 (copy), l_tick_0 (copy), v12 (ref), v1 (copy)
    if v28 == nil then
        return;
    elseif v11 == false then
        return true;
    else
        v11 = false;
        v0.currentid = _G.generateid();
        local l_Character_1 = game.Players.LocalPlayer.Character;
        game.ReplicatedStorage.Remotes.heal_tang123asd:FireServer(false);
        if l_Character_1 ~= nil then
            local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                if l_HumanoidRootPart_1:FindFirstChild("thunderclapting") ~= nil then
                    for _, v33 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                        if v33.Name == "thunderclapting" then
                            v33:Destroy();
                        end;
                    end;
                end;
                local l_thunderslashesgyro_0 = l_HumanoidRootPart_1:FindFirstChild("thunderslashesgyro");
                local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                if l_thunderclap_and_flash_bv_0 ~= nil then
                    l_thunderclap_and_flash_bv_0:Destroy();
                end;
                if l_thunderslashesgyro_0 ~= nil then
                    l_thunderslashesgyro_0:Destroy();
                end;
                if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                    l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                end;
                for _, v37 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v37.Name == "3asdasd123asd" then
                        v37:Stop();
                    end;
                end;
            end;
        end;
        if v28 and v28 ~= nil and v28:FindFirstChild("LastUsed") ~= nil then
            v28.LastUsed.Value = l_tick_0();
        end;
        wait(0.1);
        if v12 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
v0.Cancel = function(v38) --[[ Line: 164 ]]
    -- upvalues: v11 (ref), v0 (copy), l_tick_0 (copy), v12 (ref), v1 (copy)
    if v38 == nil then
        return;
    elseif v11 == false then
        return true;
    else
        v11 = false;
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        game.ReplicatedStorage.Remotes.heal_tang123asd:FireServer(false);
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                if l_HumanoidRootPart_2:FindFirstChild("thunderclapting") ~= nil then
                    for _, v43 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                        if v43.Name == "thunderclapting" then
                            v43:Destroy();
                        end;
                    end;
                end;
                for _, v45 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v45.Name == "thunderclap_and_flash_bv" or v45.Name == "thunderslashesgyro" then
                        v45:Destroy();
                    end;
                end;
                for _, v47 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v47.Name == "3asdasd123asd" then
                        v47:Stop();
                    end;
                end;
            end;
        end;
        if v38 and v38 ~= nil and v38:FindFirstChild("LastUsed") ~= nil then
            v38.LastUsed.Value = l_tick_0();
        end;
        wait(0.1);
        if v12 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;