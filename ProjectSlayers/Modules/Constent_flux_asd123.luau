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
local v14 = {};
local v15 = {
    [1] = 0.2, 
    [2] = 0.75, 
    [3] = 1.3, 
    [4] = 1.7, 
    [5] = 2.16
};
local v16 = 0;
local v17 = false;
local v18 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Global"):WaitForChild("skills_custom_add_thing"))[script.Name];
local v19 = 0;
v0.Down = function(v20) --[[ Line: 42 ]]
    -- upvalues: v17 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v19 (ref), v8 (ref), v7 (copy), v14 (copy), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy), v15 (copy), v18 (copy), v16 (ref)
    if v20 == nil then
        return;
    else
        local v21 = false;
        v17 = false;
        if v20 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent == nil then
            return;
        else
            local v22 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil then
                v22 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v22 == false then
                v22 = nil;
            end;
            if v22 == nil then
                return;
            else
                v22 = v22.Value;
                if v22 == nil then
                    return;
                elseif l_get_item_health_0(v22, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v23 = _G.generateid();
                    v0.currentid = v23;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v17 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(15, 25) == true then
                                v19 = 0;
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                v21 = true;
                                if v17 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v17 == false then
                                    v1.Disabled = true;
                                end;
                                _G:Initiate_C("Constent_Flux_Blade_Activate", l_Character_0, true);
                                v8 = l_tick_0();
                                local v27 = false;
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v29 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v29:IsA("BodyVelocity") then
                                            v29:Destroy();
                                        end;
                                    end;
                                end;
                                local l_BoolValue_0 = Instance.new("BoolValue");
                                l_BoolValue_0.Name = "cant_move";
                                l_BoolValue_0.Parent = v7;
                                game.Debris:AddItem(l_BoolValue_0, 3.22);
                                table.insert(v14, l_BoolValue_0);
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(10000, 0, 10000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new();
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 20000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(0, 1.0000000200408773E21, 0, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                do
                                    local l_v27_0 = v27;
                                    l_resume_0(l_create_0(function() --[[ Line: 106 ]]
                                        -- upvalues: l_BodyGyro_0 (copy), l_BodyVelocity_0 (copy), l_v27_0 (ref), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                        while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyVelocity_0 ~= nil and l_BodyVelocity_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                            if l_v27_0 == false then
                                                l_BodyGyro_0.CFrame = l_BodyGyro_0.CFrame:Lerp(CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos()), 0.35);
                                                l_BodyVelocity_0.Velocity = l_BodyVelocity_0.Velocity:Lerp(l_BodyGyro_0.CFrame.lookVector * 21, 0.35);
                                            else
                                                l_BodyVelocity_0.Velocity = l_BodyVelocity_0.Velocity:Lerp(Vector3.new(), 0.25);
                                            end;
                                            l_RunService_0.RenderStepped:wait();
                                        end;
                                    end));
                                    for v34, v35 in pairs(v15) do
                                        l_resume_0(l_create_0(function() --[[ Line: 120 ]]
                                            -- upvalues: v35 (copy), v0 (ref), v23 (copy), v19 (ref), v18 (ref), v20 (copy), l_HumanoidRootPart_0 (copy), v34 (copy), l_Character_0 (copy)
                                            task.wait(v35);
                                            if v0.currentid == v23 then
                                                if _G:Stamina(5) == false or v18 <= v19 then
                                                    v0.Cancel(v20);
                                                end;
                                                if l_HumanoidRootPart_0 ~= nil then
                                                    _G:Initiate_C("Play_Sound", l_HumanoidRootPart_0, game.ReplicatedStorage.Sounds.Water_Dragon:FindFirstChild("Sound" .. v34));
                                                end;
                                            end;
                                            if v34 == 5 then
                                                task.wait(0.5);
                                            else
                                                task.wait(0.15);
                                            end;
                                            if v0.currentid == v23 and l_HumanoidRootPart_0 ~= nil and l_Character_0 ~= nil then
                                                v19 = v19 + 1;
                                                if v34 ~= 5 then
                                                    game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("constent_flux_damage", l_Character_0, l_HumanoidRootPart_0.CFrame, 10);
                                                    return;
                                                else
                                                    game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("constent_flux_damage", l_Character_0, l_HumanoidRootPart_0.CFrame, 20, true);
                                                end;
                                            end;
                                        end));
                                    end;
                                    l_resume_0(l_create_0(function() --[[ Line: 147 ]]
                                        -- upvalues: v0 (ref), v23 (copy), v16 (ref), l_tick_0 (ref), l_v27_0 (ref), l_resume_0 (ref), l_create_0 (ref), v20 (copy), l_HumanoidRootPart_0 (copy)
                                        task.wait(0.2);
                                        if v0.currentid == v23 then
                                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("add_water_dragon_thing123", game.Players.LocalPlayer.Character);
                                        end;
                                        task.wait(1.9600000000000002);
                                        if v0.currentid == v23 then
                                            v16 = l_tick_0();
                                            l_v27_0 = true;
                                            l_resume_0(l_create_0(function() --[[ Line: 156 ]]
                                                -- upvalues: v0 (ref), v20 (ref)
                                                v0.Up(v20);
                                            end));
                                            task.wait(0.6);
                                            local l_CFrame_0 = l_HumanoidRootPart_0.CFrame;
                                            _G:Initiate_C("water_dragon_dust_effect", l_CFrame_0 * CFrame.new(2, 0, -5));
                                            _G:Initiate_C("rock_follow_ting123", l_CFrame_0 * CFrame.new(2, 0, 0), l_CFrame_0.lookVector * 100, 0.2, "preset1");
                                        end;
                                    end));
                                    l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.WaterBreathing.constent_flux):Play();
                                end;
                            end;
                        end;
                    end;
                    return v21;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v37) --[[ Line: 183 ]]
    -- upvalues: l_tick_0 (copy), v16 (ref), v0 (copy), v14 (copy), v17 (ref), v1 (copy)
    if v37 == nil then
        return;
    else
        repeat
            task.wait();
        until l_tick_0() - v16 > 1;
        v0.currentid = _G.generateid();
        local l_Character_1 = game.Players.LocalPlayer.Character;
        if l_Character_1 ~= nil then
            _G:Initiate_C("Constent_Flux_Blade_Activate", l_Character_1, false);
            local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                for _, v42 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v42.Name == "constent_flux" then
                        v42:Stop();
                    end;
                end;
            end;
            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                for _, v44 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                    if v44.Name == "thunderclap_and_flash_bv" or v44.Name == "thunderclapandflashbg" then
                        v44:Destroy();
                    end;
                end;
                for _, v46 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v46.Name == "constent_flux" then
                        v46:Stop();
                    end;
                end;
            end;
        end;
        if #v14 > 0 then
            for _, v48 in pairs(v14) do
                v48:Destroy();
            end;
        end;
        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("delete_water_Dragon", game.Players.LocalPlayer);
        if v37 ~= nil and v37:FindFirstChild("LastUsed") ~= nil then
            v37.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v17 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
v0.Cancel = function(v49) --[[ Line: 232 ]]
    -- upvalues: l_tick_0 (copy), v16 (ref), v0 (copy), v14 (copy), v17 (ref), v1 (copy)
    if v49 == nil then
        return;
    else
        repeat
            task.wait();
        until l_tick_0() - v16 > 1;
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            _G:Initiate_C("Constent_Flux_Blade_Activate", l_Character_2, false);
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v54 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v54.Name == "constent_flux" then
                        v54:Stop();
                    end;
                end;
            end;
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v56 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v56.Name == "thunderclap_and_flash_bv" or v56.Name == "thunderclapandflashbg" then
                        v56:Destroy();
                    end;
                end;
                for _, v58 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v58.Name == "constent_flux" then
                        v58:Stop();
                    end;
                end;
            end;
        end;
        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("delete_water_Dragon", game.Players.LocalPlayer);
        if #v14 > 0 then
            for _, v60 in pairs(v14) do
                v60:Destroy();
            end;
        end;
        if v49 ~= nil and v49:FindFirstChild("LastUsed") ~= nil then
            v49.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v17 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;