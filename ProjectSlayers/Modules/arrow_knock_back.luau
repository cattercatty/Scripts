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
local l_CollectionService_0 = game:GetService("CollectionService");
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
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(15) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                if v15 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                v17 = true;
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
                                l_resume_0(l_create_0(function() --[[ Line: 75 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_0.RenderStepped:Wait();
                                    end;
                                end));
                                local v27 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Arrow.Koketsu_Arrow);
                                v27:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 85 ]]
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
v7.ChildAdded:Connect(function(v30) --[[ Line: 104 ]]
    -- upvalues: v29 (copy), v28 (ref)
    if table.find(v29, v30.Name) ~= nil then
        v28 = "";
    end;
end);
v0.Up = function(v31) --[[ Line: 105 ]]
    -- upvalues: v28 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v12 (ref), l_LocalPlayer_0 (copy), l_CollectionService_0 (copy), l_resume_0 (copy), l_create_0 (copy), v7 (copy), v15 (ref), v1 (copy)
    if v31 == nil then
        return;
    else
        local v32 = _G.generateid();
        v28 = v32;
        repeat
            wait();
        until l_tick_0() - v8 >= 0.3;
        if v32 ~= v28 then
            v0.Cancel(v31);
            return true;
        else
            v0.currentid = _G.generateid();
            local v33 = _G.generateid();
            v12 = v33;
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                    for _, v36 in pairs(game.Workspace.Debree:GetChildren()) do
                        if v36.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v36);
                            v36:Destroy();
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
                    for _, v43 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v43.Name == "Koketsu_Arrow" then
                            v43:AdjustSpeed(1);
                        end;
                    end;
                    _G.Skills_Performance(script.Name, l_tick_0(), 2);
                    task.wait(0.1);
                    for _, v45 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v45.Name == "Koketsu_Arrow" then
                            v45:AdjustSpeed(0.18);
                        end;
                    end;
                    if l_HumanoidRootPart_1 ~= nil and v12 == v33 then
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("Arrow_knock_back_throw", game.Players.LocalPlayer, l_HumanoidRootPart_1, l_HumanoidRootPart_1.CFrame);
                        local v46 = workspace.Debree:WaitForChild(l_LocalPlayer_0.Name .. "'s arrow");
                        v46.Name = "";
                        _G:Initiate_C("Arrow_fire_effect", l_HumanoidRootPart_1.CFrame, v46);
                        _G:Initiate_C("arrow_follow", v46);
                        local v47 = {};
                        local v48 = false;
                        do
                            local l_v48_0 = v48;
                            local v54 = v46.Touched:Connect(function(v50) --[[ Line: 156 ]]
                                -- upvalues: l_v48_0 (ref), l_Character_1 (copy), v46 (copy), v47 (copy), l_CollectionService_0 (ref)
                                if l_v48_0 == false and v50:IsDescendantOf(l_Character_1) == false and v50:IsDescendantOf(workspace.Debree) == false then
                                    local v51 = v46.Velocity.Unit * (v46.Size.Z / 2);
                                    local l_Position_0 = v46.Position;
                                    if v50:IsDescendantOf(workspace.Map) == true and v50.CanCollide == true then
                                        l_v48_0 = true;
                                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v46);
                                        v46:Destroy();
                                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("arrow_knock_back_damage", l_Character_1, CFrame.new(l_Position_0), nil, v47);
                                        _G:Initiate_C("arrow_hit_effect", "land", l_Position_0 + v51, v50);
                                        return;
                                    else
                                        local l_Parent_0 = v50.Parent;
                                        if l_CollectionService_0:HasTag(l_Parent_0, "Ignore") == false and l_Parent_0:FindFirstChild("HumanoidRootPart") ~= nil and l_Parent_0:FindFirstChild("Humanoid") ~= nil and table.find(v47, l_Parent_0) == nil then
                                            table.insert(v47, l_Parent_0);
                                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("arrow_knock_back_damage", l_Character_1, CFrame.new(l_Position_0), l_Parent_0);
                                            _G:Initiate_C("arrow_hit_effect", "humanoid", l_Position_0 + v51, v50);
                                        end;
                                    end;
                                end;
                            end);
                            l_resume_0(l_create_0(function() --[[ Line: 178 ]]
                                -- upvalues: l_HumanoidRootPart_1 (copy), v46 (copy), l_thunderclap_and_flash_bv_0 (copy), l_thunderclapandflashbg_0 (copy)
                                while l_HumanoidRootPart_1 ~= nil and v46 ~= nil and v46:FindFirstChild("bg") ~= nil and l_thunderclap_and_flash_bv_0 ~= nil and l_thunderclap_and_flash_bv_0.Parent == l_HumanoidRootPart_1 and l_thunderclapandflashbg_0 ~= nil and l_thunderclapandflashbg_0.Parent == l_HumanoidRootPart_1 and v46:FindFirstChild("bv") ~= nil do
                                    v46.bv.Velocity = (_G.getmousepos(2000, nil, v46.Position) - v46.Position).Unit * 100;
                                    v46.bg.CFrame = CFrame.new(v46.Position, _G.getmousepos(2000, nil, v46.Position));
                                    task.wait();
                                end;
                            end));
                            v46:GetPropertyChangedSignal("Parent"):Wait(2);
                            v54:Disconnect();
                        end;
                    end;
                    for _, v56 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v56.Name == "Koketsu_Arrow" then
                            v56:Stop();
                        end;
                    end;
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
v0.Cancel = function(v57) --[[ Line: 223 ]]
    -- upvalues: v0 (copy), l_LocalPlayer_0 (copy), l_tick_0 (copy), v15 (ref), v1 (copy)
    if v57 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                for _, v60 in pairs(game.Workspace.Debree:GetChildren()) do
                    if v60.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v60);
                        v60:Destroy();
                    end;
                end;
            end;
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v64 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v64.Name == "thunderclap_and_flash_bv" or v64.Name == "thunderclapandflashbg" then
                        v64:Destroy();
                    end;
                end;
                for _, v66 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v66.Name == "Koketsu_Arrow" then
                        v66:Stop();
                    end;
                end;
            end;
        end;
        if v57 ~= nil and v57:FindFirstChild("LastUsed") ~= nil then
            v57.LastUsed.Value = l_tick_0();
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