local v0 = {
    currentid = ""
};
local v1 = require(game.ReplicatedStorage.Modules.Client.character_handler);
local l_resume_0 = coroutine.resume;
local l_create_0 = coroutine.create;
local l_RunService_0 = game:GetService("RunService");
local _ = game.Players.LocalPlayer:GetMouse();
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game.ReplicatedStorage.PlayerValues:WaitForChild(l_LocalPlayer_0.Name);
local v8 = 0;
local l_tick_0 = tick;
local l_get_item_health_0 = require(game.ReplicatedStorage.Modules.Server.Server_Modules:WaitForChild("get_item_health"));
local _ = game:GetService("CollectionService");
local v12 = false;
local v13 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Global"):WaitForChild("skills_custom_add_thing"))[script.Name];
local v14 = 0;
v0.Down = function(v15) --[[ Line: 22 ]]
    -- upvalues: v12 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v14 (ref), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy), v13 (copy)
    if v15 == nil then
        return;
    else
        local v16 = false;
        v12 = false;
        if v15 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("ClawsIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("ClawsIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("ClawsIsEquiped", true).Parent == nil then
            return;
        else
            local v17 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("ClawsIsEquiped", true) ~= nil then
                v17 = l_LocalPlayer_0.Character:FindFirstChild("ClawsIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v17 == false then
                v17 = nil;
            end;
            if v17 == nil then
                return;
            else
                v17 = v17.Value;
                if v17 == nil then
                    return;
                elseif l_get_item_health_0(v17, game.Players.LocalPlayer.Name) ~= true then
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
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(0) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v14 = 0;
                                v16 = true;
                                if v12 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v12 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v23 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v23:IsA("BodyVelocity") then
                                            v23:Destroy();
                                        end;
                                    end;
                                end;
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 20000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(1.0000000200408773E21, 1.0000000200408773E21, 1.0000000200408773E21, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 78 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_0.RenderStepped:wait();
                                    end;
                                end));
                                local v25 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Claws.Claw_Attack_Spin_Wind_Up);
                                v25:Play();
                                do
                                    local l_v25_0 = v25;
                                    l_resume_0(l_create_0(function() --[[ Line: 88 ]]
                                        -- upvalues: v0 (ref), v18 (copy), l_HumanoidRootPart_0 (copy), l_v25_0 (ref), l_Humanoid_0 (copy), l_resume_0 (ref), l_create_0 (ref), l_Character_0 (copy), v14 (ref), v13 (ref), v15 (copy)
                                        task.wait(0.3);
                                        if v0.currentid == v18 then
                                            _G:Initiate_C("claw_spin_effect", l_HumanoidRootPart_0, true);
                                            l_v25_0 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Claws.Claw_Attack_Spin);
                                            l_v25_0:Play();
                                            local v27 = false;
                                            do
                                                local l_v27_0 = v27;
                                                l_resume_0(l_create_0(function() --[[ Line: 95 ]]
                                                    -- upvalues: l_v27_0 (ref), l_HumanoidRootPart_0 (ref), l_Character_0 (ref), v0 (ref), v18 (ref), v14 (ref), v13 (ref), v15 (ref)
                                                    while true do
                                                        if l_v27_0 == false then
                                                            if l_HumanoidRootPart_0 ~= nil and l_HumanoidRootPart_0.Parent ~= nil and l_Character_0 ~= nil and v0.currentid == v18 and _G:Stamina(2) == true and v14 < v13 then
                                                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("Claw_Spin_Damage", l_Character_0, l_HumanoidRootPart_0.CFrame);
                                                                v14 = v14 + 1;
                                                                task.wait(0.2);
                                                            else
                                                                l_v27_0 = true;
                                                                v0.Cancel(v15);
                                                                return;
                                                            end;
                                                        else
                                                            return;
                                                        end;
                                                    end;
                                                end));
                                            end;
                                        end;
                                    end));
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
v0.Up = function(v29) --[[ Line: 122 ]]
    -- upvalues: v0 (copy), l_LocalPlayer_0 (copy), l_tick_0 (copy), v12 (ref), v1 (copy)
    if v29 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_1 = game.Players.LocalPlayer.Character;
        if l_Character_1 ~= nil then
            if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                for _, v32 in pairs(game.Workspace.Debree:GetChildren()) do
                    if v32.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v32);
                        v32:Destroy();
                    end;
                end;
            end;
            local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                _G:Initiate_C("claw_spin_effect", l_HumanoidRootPart_1, false);
                for _, v36 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                    if v36.Name == "thunderclap_and_flash_bv" or v36.Name == "thunderclapandflashbg" then
                        v36:Destroy();
                    end;
                end;
                for _, v38 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v38.Name == "Claw_Attack_Spin" then
                        v38:Stop();
                    end;
                end;
            end;
        end;
        if v29 ~= nil and v29:FindFirstChild("LastUsed") ~= nil then
            v29.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v12 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
v0.Cancel = function(v39) --[[ Line: 164 ]]
    -- upvalues: v0 (copy), l_LocalPlayer_0 (copy), l_tick_0 (copy), v12 (ref), v1 (copy)
    if v39 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                for _, v42 in pairs(game.Workspace.Debree:GetChildren()) do
                    if v42.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v42);
                        v42:Destroy();
                    end;
                end;
            end;
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                _G:Initiate_C("claw_spin_effect", l_HumanoidRootPart_2, false);
                for _, v46 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v46.Name == "thunderclap_and_flash_bv" or v46.Name == "thunderclapandflashbg" then
                        v46:Destroy();
                    end;
                end;
                for _, v48 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v48.Name == "Claw_Attack_Spin" then
                        v48:Stop();
                    end;
                end;
            end;
        end;
        if v39 ~= nil and v39:FindFirstChild("LastUsed") ~= nil then
            v39.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v12 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;