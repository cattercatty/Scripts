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
if game.Workspace.Debree:FindFirstChild("Blood_shot_debree_for_client") ~= nil then
    game.Workspace.Debree.Blood_shot_debree_for_client:Destroy();
end;
local v14 = nil;
local v15 = nil;
local v16 = RaycastParams.new();
v16.FilterDescendantsInstances = {
    workspace.Map
};
v16.FilterType = Enum.RaycastFilterType.Include;
local l_RunService_1 = game:GetService("RunService");
local v18 = false;
local _ = game:GetService("TweenService");
local _ = TweenInfo.new(0.23, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
v0.Down = function(v21) --[[ Line: 34 ]]
    -- upvalues: v18 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v14 (ref), v15 (ref), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_1 (copy), v16 (copy)
    if v21 == nil then
        return;
    else
        local v22 = false;
        v18 = false;
        if v21 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v23 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v23 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v23 == false then
                v23 = nil;
            end;
            if v23 == nil then
                return;
            else
                v23 = v23.Value;
                if v23 == nil then
                    return;
                elseif l_get_item_health_0(v23, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v24 = _G.generateid();
                    v0.currentid = v24;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v18 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(55) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v22 = true;
                                if v18 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v18 == false then
                                    v1.Disabled = true;
                                end;
                                v14 = nil;
                                v15 = nil;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new();
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                local l_BodyGyro_0 = Instance.new("BodyGyro");
                                l_BodyGyro_0.P = 20000;
                                v8 = l_tick_0();
                                l_BodyGyro_0.MaxTorque = Vector3.new(0, 1.0000000200408773E21, 0, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 82 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_1.RenderStepped:wait();
                                    end;
                                end));
                                if workspace.Debree:FindFirstChild("Blood_shot_debree_for_client") == nil then
                                    Instance.new("Folder", workspace.Debree).Name = "Blood_shot_debree_for_client";
                                end;
                                local l_Part_0 = Instance.new("Part");
                                l_Part_0.BottomSurface = Enum.SurfaceType.SmoothNoOutlines;
                                l_Part_0.TopSurface = Enum.SurfaceType.SmoothNoOutlines;
                                l_Part_0.Shape = Enum.PartType.Ball;
                                l_Part_0.Anchored = true;
                                l_Part_0.CanCollide = false;
                                l_Part_0.Size = Vector3.new(1.5, 1.5, 1.5, 0);
                                l_Part_0.Material = Enum.Material.Neon;
                                l_Part_0.Color = Color3.fromRGB(255, 0, 0);
                                l_Part_0.Transparency = 0.25;
                                l_Part_0.Parent = workspace.Debree.Blood_shot_debree_for_client;
                                l_resume_0(l_create_0(function() --[[ Line: 103 ]]
                                    -- upvalues: l_Part_0 (copy), l_HumanoidRootPart_0 (copy), v14 (ref), v15 (ref), v16 (ref), l_RunService_1 (ref)
                                    while l_Part_0 ~= nil and l_Part_0:IsDescendantOf(workspace.Debree) == true and l_HumanoidRootPart_0 ~= nil do
                                        local v31, v32, v33 = _G.getmousepos(100, true, nil, nil, nil, l_HumanoidRootPart_0.Position);
                                        if v32 ~= nil then
                                            v14 = v31;
                                            v15 = v33;
                                        else
                                            local v34 = v31 + Vector3.new(0, 10, 0, 0);
                                            local _ = Vector3.new(0, -25, 0, 0);
                                            local v36 = workspace:Raycast(v34, Vector3.new(0, -25, 0, 0), v16);
                                            if v36 ~= nil and v36.Instance ~= nil then
                                                v14 = v36.Position;
                                                v15 = v36.Normal;
                                            end;
                                        end;
                                        if v14 ~= nil then
                                            l_Part_0.Position = v14;
                                        end;
                                        l_RunService_1.RenderStepped:wait();
                                    end;
                                end));
                                local v37 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Swamp.swamp_bda_Swamp_trap);
                                v37:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 126 ]]
                                    -- upvalues: v0 (ref), v24 (copy), v37 (copy)
                                    task.wait(0.3);
                                    if v0.currentid == v24 then
                                        v37:AdjustSpeed(0);
                                    end;
                                end));
                            end;
                        end;
                    end;
                    return v22;
                end;
            end;
        end;
    end;
end;
local v38 = 0;
local v39 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v40) --[[ Line: 144 ]]
    -- upvalues: v39 (copy), v38 (ref)
    if table.find(v39, v40.Name) ~= nil then
        v38 = "";
    end;
end);
v0.Up = function(v41) --[[ Line: 145 ]]
    -- upvalues: v38 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v11 (ref), v14 (ref), v15 (ref), v16 (copy), v18 (ref), v1 (copy)
    if v41 == nil then
        return;
    else
        local v42 = _G.generateid();
        v38 = v42;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.3;
        if v42 ~= v38 then
            v0.Cancel(v41);
            return true;
        else
            local v43 = _G.generateid();
            v0.currentid = v43;
            v11 = _G.generateid();
            if game.Workspace.Debree:FindFirstChild("Blood_shot_debree_for_client") ~= nil then
                game.Workspace.Debree.Blood_shot_debree_for_client:Destroy();
            end;
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    task.spawn(function() --[[ Line: 163 ]]
                        -- upvalues: l_tick_0 (ref), v0 (ref), v43 (copy), l_Character_1 (copy), l_HumanoidRootPart_1 (copy), v14 (ref), v15 (ref), v16 (ref)
                        _G.Skills_Performance(script.Name, l_tick_0(), 2);
                        task.wait(0.137);
                        if v0.currentid == v43 then
                            _G:Initiate_C("swamp_traveling_claws_Startup2", {
                                Character = l_Character_1, 
                                EnterCF = l_HumanoidRootPart_1.CFrame
                            });
                        end;
                        task.wait(0.2);
                        if v0.currentid == v43 and v14 ~= nil and v15 ~= nil then
                            local v47 = v14 + Vector3.new(0, 10, 0, 0);
                            local _ = Vector3.new(0, -160, 0, 0);
                            local v49 = workspace:Raycast(v47, Vector3.new(0, -160, 0, 0), v16);
                            if v49 ~= nil and v49.Instance ~= nil then
                                v14 = v49.Position;
                            end;
                            local v50 = l_HumanoidRootPart_1.CFrame - l_HumanoidRootPart_1.Position;
                            local v51 = CFrame.new(v14) * v50;
                            _G:Initiate_C("swamp_bda_claws_appear", {
                                Character = l_Character_1, 
                                GoalCF = v51
                            });
                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("swamp_trap_damage", l_Character_1, v51);
                        end;
                    end);
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "Cancel";
                        l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                        game.Debris:AddItem(l_thunderclapandflashbg_0, 0.25);
                    end;
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 0.25);
                    end;
                    for _, v56 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v56.Name == "swamp_bda_Swamp_trap" then
                            v56:AdjustSpeed(1);
                        end;
                    end;
                end;
            end;
            if v41 ~= nil and v41:FindFirstChild("LastUsed") ~= nil then
                v41.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            if v18 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v57) --[[ Line: 225 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v18 (ref), v1 (copy)
    if v57 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        if game.Workspace.Debree:FindFirstChild("Blood_shot_debree_for_client") ~= nil then
            game.Workspace.Debree.Blood_shot_debree_for_client:Destroy();
        end;
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v62 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v62.Name == "thunderclap_and_flash_bv" or v62.Name == "thunderclapandflashbg" then
                        v62:Destroy();
                    end;
                end;
                for _, v64 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v64.Name == "swamp_bda_Swamp_trap" then
                        v64:Stop();
                    end;
                end;
            end;
        end;
        if v57 ~= nil and v57:FindFirstChild("LastUsed") ~= nil then
            v57.LastUsed.Value = l_tick_0();
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