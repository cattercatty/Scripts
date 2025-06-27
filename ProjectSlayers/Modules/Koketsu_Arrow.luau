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
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(45) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v17 = true;
                                if v15 == true then
                                    _G.can_perf_air_tang = false;
                                end;
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
                                local v27 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Arrow.Koketsu_Arrow_actual_anim);
                                v27:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 85 ]]
                                    -- upvalues: v0 (ref), v19 (copy), v27 (copy)
                                    wait(0.34);
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
        until l_tick_0() - v8 >= 0.34;
        if v32 ~= v28 then
            v0.Cancel(v31);
            return true;
        else
            local v33 = _G.generateid();
            v0.currentid = v33;
            local l_Character_1 = game.Players.LocalPlayer.Character;
            local v35 = _G.generateid();
            v12 = v35;
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
                    for _, v44 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v44.Name == "Koketsu_Arrow_actual_anim" then
                            v44:AdjustSpeed(1);
                        end;
                    end;
                    _G.Skills_Performance(script.Name, l_tick_0(), 2);
                    task.wait(0.25);
                    if l_HumanoidRootPart_1 ~= nil and v12 == v35 and v0.currentid == v33 then
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("Arrow_knock_back_throw", game.Players.LocalPlayer, l_HumanoidRootPart_1, l_HumanoidRootPart_1.CFrame);
                        local v45 = workspace.Debree:WaitForChild(l_LocalPlayer_0.Name .. "'s arrow");
                        v45.Name = "";
                        _G:Initiate_C("Arrow_fire_effect", l_HumanoidRootPart_1.CFrame, v45);
                        _G:Initiate_C("arrow_follow", v45);
                        local v46 = {};
                        local v47 = l_tick_0();
                        do
                            local l_v47_0 = v47;
                            local v54 = v45.Touched:Connect(function(v49) --[[ Line: 153 ]]
                                -- upvalues: l_Character_1 (copy), v45 (copy), l_v47_0 (ref), l_CollectionService_0 (ref), v46 (copy)
                                if v49:IsDescendantOf(l_Character_1) == false and v49:IsDescendantOf(workspace.Debree) == false and (v49.Name == "UpperTorso" or v49.Name == "HumanoidRootPart" or v49.Name == "LowerTorso" or v49:IsDescendantOf(workspace.Map) == true) then
                                    local v50 = v45.Velocity.Unit * (v45.Size.Z / 2);
                                    local l_Position_0 = v45.Position;
                                    if v49:IsDescendantOf(workspace.Map) == true and v49.CanCollide == true and tick() - l_v47_0 > 0.15 then
                                        l_v47_0 = tick();
                                        _G:Initiate_C("arrow_hit_effect", "land", l_Position_0 + v50, v49);
                                        local v52 = Vector3.new(math.random(-1, 2) == 1 and -1 or 1, 1, math.random(-1, 2) == 1 and -1 or 1) * 65;
                                        v45.bv.Velocity = v52;
                                        v45.bg.CFrame = CFrame.new(v45.Position, v45.Position + v52);
                                        if v45:FindFirstChild("Damagething") ~= nil then
                                            v45.Damagething:FireServer();
                                            return;
                                        end;
                                    else
                                        local l_Parent_0 = v49.Parent;
                                        if l_CollectionService_0:HasTag(l_Parent_0, "Ignore") == false and l_Parent_0:FindFirstChild("HumanoidRootPart") ~= nil and l_Parent_0:FindFirstChild("Humanoid") ~= nil and table.find(v46, l_Parent_0) == nil then
                                            table.insert(v46, l_Parent_0);
                                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("Koketsu_arrow_damage", l_Character_1, v45, CFrame.new(l_Position_0), l_Parent_0);
                                            _G:Initiate_C("arrow_hit_effect", "humanoid", l_Position_0 + v50, v49);
                                        end;
                                    end;
                                end;
                            end);
                            v45.MeshPart.Trail.Lifetime = 0.07;
                            v45.bv.Velocity = (_G.getmousepos(2000, nil, v45.Position) - v45.Position).Unit * 150;
                            l_resume_0(l_create_0(function() --[[ Line: 183 ]]
                                -- upvalues: l_HumanoidRootPart_1 (copy), v45 (copy), l_tick_0 (ref), l_v47_0 (ref)
                                while l_HumanoidRootPart_1 ~= nil and v45 ~= nil and v45.Parent ~= nil and v45:FindFirstChild("bg") ~= nil and v45:FindFirstChild("bv") ~= nil do
                                    if l_tick_0() - l_v47_0 > 0.15 then
                                        l_v47_0 = l_tick_0();
                                        local v55 = Vector3.new(math.random(-1, 2) == 1 and -1 or 1, 1, math.random(-1, 2) == 1 and -1 or 1) * 65;
                                        v45.bv.Velocity = v55;
                                        v45.bg.CFrame = CFrame.new(v45.Position, v45.Position + v55);
                                        _G:Initiate_C("arrow_hit_effect", "humanoid", v45.Position);
                                        if v45:FindFirstChild("Damagething") ~= nil then
                                            v45.Damagething:FireServer();
                                        end;
                                    end;
                                    task.wait();
                                end;
                            end));
                            local l_v54_0 = v54 --[[ copy: 12 -> 14 ]];
                            l_resume_0(l_create_0(function() --[[ Line: 202 ]]
                                -- upvalues: v45 (copy), l_v54_0 (copy)
                                v45:GetPropertyChangedSignal("Parent"):Wait(1);
                                l_v54_0:Disconnect();
                            end));
                            task.wait(0.7);
                        end;
                    end;
                    for _, v58 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v58.Name == "Koketsu_Arrow_actual_anim" then
                            v58:Stop();
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
v0.Cancel = function(v59) --[[ Line: 242 ]]
    -- upvalues: v0 (copy), l_LocalPlayer_0 (copy), l_tick_0 (copy), v15 (ref), v1 (copy)
    if v59 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                for _, v62 in pairs(game.Workspace.Debree:GetChildren()) do
                    if v62.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v62);
                        v62:Destroy();
                    end;
                end;
            end;
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v66 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v66.Name == "thunderclap_and_flash_bv" or v66.Name == "thunderclapandflashbg" then
                        v66:Destroy();
                    end;
                end;
                for _, v68 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v68.Name == "Koketsu_Arrow_actual_anim" then
                        v68:Stop();
                    end;
                end;
            end;
        end;
        if v59 ~= nil and v59:FindFirstChild("LastUsed") ~= nil then
            v59.LastUsed.Value = l_tick_0();
        end;
        wait(0.3);
        if v15 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;