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
local v13 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Global"):WaitForChild("skills_custom_add_thing"))[script.Name];
local v14 = 0;
v0.Down = function(v15) --[[ Line: 22 ]]
    -- upvalues: v12 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v14 (ref), v11 (ref), v8 (ref), l_resume_0 (copy), l_create_0 (copy), v7 (copy), v13 (copy), l_RunService_0 (copy)
    if v15 == nil then
        return;
    else
        local v16 = false;
        v12 = false;
        if v15 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent == nil then
            return;
        else
            local l_Id_0 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id");
            if l_Id_0 == nil then
                return;
            else
                l_Id_0 = l_Id_0.Value;
                if l_Id_0 == nil then
                    return;
                elseif l_get_item_health_0(l_Id_0, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v18 = _G.generateid();
                    v0.currentid = v18;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v12 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(3, 25) then
                                v14 = 0;
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v16 = true;
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                v11 = true;
                                if v12 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v12 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v23 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v23:IsA("BodyVelocity") then
                                            v23:Destroy();
                                        end;
                                    end;
                                end;
                                local v24 = false;
                                local v25 = false;
                                do
                                    local l_v24_0, l_v25_0 = v24, v25;
                                    l_resume_0(l_create_0(function() --[[ Line: 66 ]]
                                        -- upvalues: l_v25_0 (ref), v18 (copy), v0 (ref), v7 (ref), v14 (ref), v13 (ref), l_v24_0 (ref), v11 (ref), v15 (copy)
                                        while l_v25_0 == false do
                                            task.wait();
                                            if v18 == v0.currentid and v7 ~= nil and game.Players.LocalPlayer ~= nil and game.Players.LocalPlayer.Character ~= nil and v14 < v13 and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and v7:FindFirstChild("Stamina") ~= nil and v7.Stamina.Value > 3 then
                                                _G:RemoveStam(2);
                                                _G:Initiate_C("Initiate_slash_effectz", game.Players.LocalPlayer.Character.HumanoidRootPart, l_v24_0);
                                                if l_v24_0 == false then
                                                    l_v24_0 = nil;
                                                end;
                                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("Rapid_Slashes_Damage", game.Players.LocalPlayer.Character, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2));
                                                v14 = v14 + 1;
                                                task.wait(0.26);
                                            else
                                                l_v25_0 = true;
                                                if v11 == true then
                                                    v0.Up(v15);
                                                    return;
                                                else
                                                    break;
                                                end;
                                            end;
                                        end;
                                    end));
                                    local l_BodyGyro_0 = Instance.new("BodyGyro");
                                    l_BodyGyro_0.P = 20000;
                                    l_BodyGyro_0.MaxTorque = Vector3.new(1.0000000200408773E21, 1.0000000200408773E21, 1.0000000200408773E21, 0);
                                    l_BodyGyro_0.Name = "thunderslashesgyro";
                                    l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                    l_resume_0(l_create_0(function() --[[ Line: 99 ]]
                                        -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                        while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                            l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                            l_RunService_0.RenderStepped:Wait();
                                        end;
                                    end));
                                    l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.ThunderBreathing.Distant_Thunder_Loop):Play();
                                end;
                            end;
                        end;
                    end;
                    return v16;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v29) --[[ Line: 120 ]]
    -- upvalues: v11 (ref), v0 (copy), l_resume_0 (copy), l_create_0 (copy), v7 (copy), l_tick_0 (copy), v12 (ref), v1 (copy)
    if v29 == nil then
        return;
    elseif v11 == false then
        return true;
    else
        v11 = false;
        v0.currentid = _G.generateid();
        local l_Character_1 = game.Players.LocalPlayer.Character;
        if l_Character_1 ~= nil then
            local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                l_Humanoid_1:LoadAnimation(game.ReplicatedStorage.Animations.Moves.ThunderBreathing.rapidslashesend):Play();
                l_resume_0(l_create_0(function() --[[ Line: 132 ]]
                    -- upvalues: l_HumanoidRootPart_1 (copy), l_Humanoid_1 (copy)
                    task.wait(0.35);
                    if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                        _G:Initiate_C("Initiate_slash_effectz", game.Players.LocalPlayer.Character.HumanoidRootPart, true);
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("Rapid_Slashes_Damage", game.Players.LocalPlayer.Character, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2), true);
                    end;
                end));
                if l_HumanoidRootPart_1:FindFirstChild("thunderclapting") ~= nil then
                    for _, v34 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                        if v34.Name == "thunderclapting" then
                            v34:Destroy();
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
                for _, v38 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v38.Name == "Distant_Thunder_Loop" then
                        v38:Stop();
                    end;
                end;
            end;
        end;
        if v29 and v29 ~= nil and v29:FindFirstChild("LastUsed") ~= nil then
            v29.LastUsed.Value = l_tick_0();
        end;
        task.wait(1);
        if v12 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
v0.Cancel = function(v39) --[[ Line: 180 ]]
    -- upvalues: v11 (ref), v0 (copy), l_tick_0 (copy), v12 (ref), v1 (copy)
    if v39 == nil then
        return;
    elseif v11 == false then
        return true;
    else
        v11 = false;
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                if l_HumanoidRootPart_2:FindFirstChild("thunderclapting") ~= nil then
                    for _, v44 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                        if v44.Name == "thunderclapting" then
                            v44:Destroy();
                        end;
                    end;
                end;
                for _, v46 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v46.Name == "thunderclap_and_flash_bv" or v46.Name == "thunderslashesgyro" then
                        v46:Destroy();
                    end;
                end;
                for _, v48 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v48.Name == "Distant_Thunder_Loop" then
                        v48:Stop();
                    end;
                end;
            end;
        end;
        if v39 and v39 ~= nil and v39:FindFirstChild("LastUsed") ~= nil then
            v39.LastUsed.Value = l_tick_0();
        end;
        task.wait(1);
        if v12 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;