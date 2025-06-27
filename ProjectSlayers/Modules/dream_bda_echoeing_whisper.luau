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
local _ = game:GetService("CollectionService");
local v12 = "";
local v13 = {
    "Stun", 
    "KnockedOut", 
    "RagDoll"
};
v7.ChildAdded:Connect(function(v14) --[[ Line: 16 ]]
    -- upvalues: v13 (copy), v12 (ref)
    if table.find(v13, v14.Name) ~= nil then
        v12 = "";
    end;
end);
local v15 = false;
local v16 = 0;
local v17 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v18) --[[ Line: 22 ]]
    -- upvalues: v17 (copy), v16 (ref)
    if table.find(v17, v18.Name) ~= nil then
        v16 = "";
    end;
end);
local l_RunService_1 = game:GetService("RunService");
local v20 = nil;
local l_UserInputService_0 = game:GetService("UserInputService");
local v22 = false;
det = function() --[[ Line: 31 ]] --[[ Name: det ]]
    -- upvalues: v22 (ref), l_LocalPlayer_0 (copy)
    if v22 == true then
        return;
    else
        v22 = true;
        task.wait(0.05);
        _G:Initiate_C("EchoingWhisper_effect", l_LocalPlayer_0, true);
        v22 = false;
        return;
    end;
end;
game.ReplicatedStorage:WaitForChild("mobile_tap_events"):WaitForChild("mobile_skill_tap").Event:Connect(function(v23) --[[ Line: 37 ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if v23 == "Echoeing Whisper" and workspace.Debree:FindFirstChild("melodicwhisperefffor" .. l_LocalPlayer_0.Name .. "asd123asdsad") ~= nil then
        det();
    end;
end);
l_UserInputService_0.InputBegan:Connect(function(v24, v25) --[[ Line: 45 ]]
    -- upvalues: v20 (ref), l_LocalPlayer_0 (copy)
    if v25 == false and v20 ~= nil and v24.KeyCode.Name == game.ReplicatedStorage.Player_Data:FindFirstChild(l_LocalPlayer_0.Name).Keys:FindFirstChild(v20)["2"].Value and workspace.Debree:FindFirstChild("melodicwhisperefffor" .. l_LocalPlayer_0.Name .. "asd123asdsad") ~= nil then
        det();
    end;
end);
v0.Down = function(v26) --[[ Line: 55 ]]
    -- upvalues: v22 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v15 (ref), v20 (ref), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_1 (copy), v16 (ref)
    if v26 == nil then
        return;
    else
        local v27 = false;
        if v22 == true then
            return;
        elseif workspace.Debree:FindFirstChild("melodicwhisperefffor" .. l_LocalPlayer_0.Name .. "asd123asdsad") ~= nil then
            return;
        elseif v26 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v28 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v28 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v28 == false then
                v28 = nil;
            end;
            if v28 == nil then
                return;
            else
                v28 = v28.Value;
                if v28 == nil then
                    return;
                elseif l_get_item_health_0(v28, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v29 = _G.generateid();
                    v0.currentid = v29;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v15 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(70) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                if v15 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                v20 = v26.Equiped_Key.Value;
                                v27 = true;
                                _G:Initiate_C("arrow_activated_effect", l_Character_0);
                                if v15 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v34 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v34:IsA("BodyVelocity") then
                                            v34:Destroy();
                                        end;
                                    end;
                                end;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new();
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 20000;
                                l_BodyGyro_0.MaxTorque = Vector3.new(1.0000000200408773E21, 1.0000000200408773E21, 1.0000000200408773E21, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 111 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_1.RenderStepped:Wait();
                                    end;
                                end));
                                v8 = l_tick_0();
                                l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Dream.Dream_Echoeing_Whisper_anim):Play();
                                game.Debris:AddItem(l_BodyGyro_0, 0.6);
                                game.Debris:AddItem(l_BodyVelocity_0, 0.6);
                                local v37 = _G.generateid();
                                v16 = v37;
                                if v0.currentid == v29 and v16 == v37 then
                                    _G:Initiate_C("EchoingWhisper_effect", l_LocalPlayer_0);
                                end;
                            end;
                        end;
                    end;
                    return v27;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v38) --[[ Line: 142 ]]
    -- upvalues: v16 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), l_LocalPlayer_0 (copy), v15 (ref), v1 (copy)
    if v38 == nil then
        return;
    else
        local v39 = _G.generateid();
        v16 = v39;
        repeat
            wait();
        until l_tick_0() - v8 >= 0.6;
        if v39 ~= v16 then
            v0.Cancel(v38);
            return true;
        else
            v0.currentid = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                    for _, v42 in pairs(game.Workspace.Debree:GetChildren()) do
                        if v42.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v42);
                            v42:Destroy();
                        end;
                    end;
                end;
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    for _, v46 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                        if v46.Name == "thunderclap_and_flash_bv" or v46.Name == "thunderclapandflashbg" then
                            v46:Destroy();
                        end;
                    end;
                    for _, v48 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v48.Name == "Dream_Man_Hypnosis" then
                            v48:Stop();
                        end;
                    end;
                end;
            end;
            if v38 ~= nil and v38:FindFirstChild("LastUsed") ~= nil then
                v38.LastUsed.Value = l_tick_0();
            end;
            if v15 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v49) --[[ Line: 191 ]]
    -- upvalues: v0 (copy), l_LocalPlayer_0 (copy), l_tick_0 (copy), v15 (ref), v1 (copy)
    if v49 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                for _, v52 in pairs(game.Workspace.Debree:GetChildren()) do
                    if v52.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v52);
                        v52:Destroy();
                    end;
                end;
            end;
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v56 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v56.Name == "thunderclap_and_flash_bv" or v56.Name == "thunderclapandflashbg" then
                        v56:Destroy();
                    end;
                end;
                for _, v58 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v58.Name == "Dream_Man_Hypnosis" then
                        v58:Stop();
                    end;
                end;
            end;
        end;
        if v49 ~= nil and v49:FindFirstChild("LastUsed") ~= nil then
            v49.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v15 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;