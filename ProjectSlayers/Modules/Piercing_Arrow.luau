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
v0.Down = function(v16) --[[ Line: 22 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v15 (ref), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy)
    if v16 == nil then
        return;
    else
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
                            v15 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(28) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                if v15 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                v17 = true;
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                _G:Initiate_C("arrow_activated_effect", l_Character_0);
                                if v15 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v24 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v24:IsA("BodyVelocity") then
                                            v24:Destroy();
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
                                l_resume_0(l_create_0(function() --[[ Line: 76 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_0.RenderStepped:wait();
                                    end;
                                end));
                                local v27 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Arrow.Piercing_Arrow);
                                v27:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 86 ]]
                                    -- upvalues: v0 (ref), v19 (copy), v27 (copy)
                                    task.wait(0.3);
                                    if v0.currentid == v19 then
                                        v27:AdjustSpeed(0);
                                    end;
                                end));
                            end;
                        end;
                    end;
                    return v17;
                end;
            end;
        end;
    end;
end;
local v28 = 0;
local v29 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v30) --[[ Line: 105 ]]
    -- upvalues: v29 (copy), v28 (ref)
    if table.find(v29, v30.Name) ~= nil then
        v28 = "";
    end;
end);
v0.Up = function(v31) --[[ Line: 106 ]]
    -- upvalues: v28 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v12 (ref), l_LocalPlayer_0 (copy), l_resume_0 (copy), l_create_0 (copy), v7 (copy), v15 (ref), v1 (copy)
    if v31 == nil then
        return;
    else
        local v32 = _G.generateid();
        v28 = v32;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.3;
        if v32 ~= v28 then
            v0.Cancel(v31);
            return true;
        else
            local v33 = _G.generateid();
            v0.currentid = v33;
            local v34 = _G.generateid();
            v12 = v34;
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                    for _, v37 in pairs(game.Workspace.Debree:GetChildren()) do
                        if v37.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v37);
                            v37:Destroy();
                        end;
                    end;
                end;
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "Cancel";
                        l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                    end;
                    l_resume_0(l_create_0(function() --[[ Line: 135 ]]
                        -- upvalues: v0 (ref), v33 (copy), v12 (ref), v34 (copy), l_Character_1 (copy), l_HumanoidRootPart_1 (copy)
                        task.wait(0.13);
                        if v0.currentid == v33 and v12 == v34 then
                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("piercing_arrow_damage", l_Character_1, l_HumanoidRootPart_1.CFrame);
                            _G:Initiate_C("piercing_arrow_effect", l_HumanoidRootPart_1.CFrame);
                        end;
                    end));
                    for _, v44 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v44.Name == "Piercing_Arrow" then
                            v44:AdjustSpeed(1);
                        end;
                    end;
                    task.wait(0.75);
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        l_thunderclap_and_flash_bv_0:Destroy();
                    end;
                    if l_thunderclapandflashbg_0 ~= nil then
                        l_thunderclapandflashbg_0:Destroy();
                    end;
                    if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                        l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                    end;
                end;
            end;
            if v31 ~= nil and v31:FindFirstChild("LastUsed") ~= nil then
                v31.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            if v15 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v45) --[[ Line: 177 ]]
    -- upvalues: v0 (copy), l_LocalPlayer_0 (copy), l_tick_0 (copy), v15 (ref), v1 (copy)
    if v45 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                for _, v48 in pairs(game.Workspace.Debree:GetChildren()) do
                    if v48.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v48);
                        v48:Destroy();
                    end;
                end;
            end;
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v52 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v52.Name == "thunderclap_and_flash_bv" or v52.Name == "thunderclapandflashbg" then
                        v52:Destroy();
                    end;
                end;
                for _, v54 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v54.Name == "Piercing_Arrow" then
                        v54:Stop();
                    end;
                end;
            end;
        end;
        if v45 ~= nil and v45:FindFirstChild("LastUsed") ~= nil then
            v45.LastUsed.Value = l_tick_0();
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