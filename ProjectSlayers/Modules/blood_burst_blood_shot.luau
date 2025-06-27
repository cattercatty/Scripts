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
local l_tick_0 = tick;
local l_get_item_health_0 = require(game.ReplicatedStorage.Modules.Server.Server_Modules:WaitForChild("get_item_health"));
local v10 = "";
local v11 = {
    "Stun", 
    "KnockedOut", 
    "RagDoll"
};
v7.ChildAdded:Connect(function(v12) --[[ Line: 15 ]]
    -- upvalues: v11 (copy), v10 (ref)
    if table.find(v11, v12.Name) ~= nil then
        v10 = "";
    end;
end);
if game.Workspace.Debree:FindFirstChild("Blood_shot_debree_for_client") ~= nil then
    game.Workspace.Debree.Blood_shot_debree_for_client:Destroy();
end;
local v13 = nil;
local v14 = nil;
local v15 = RaycastParams.new();
v15.FilterDescendantsInstances = {
    workspace.Map
};
v15.FilterType = Enum.RaycastFilterType.Whitelist;
local l_RunService_1 = game:GetService("RunService");
local v17 = false;
v0.Down = function(v18) --[[ Line: 30 ]]
    -- upvalues: v17 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v13 (ref), v14 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_1 (copy), v15 (copy)
    if v18 == nil then
        return;
    else
        local v19 = false;
        v17 = false;
        if v18 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v20 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v20 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
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
                            v17 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(24) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v19 = true;
                                if v17 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v17 == false then
                                    v1.Disabled = true;
                                end;
                                v13 = nil;
                                v14 = nil;
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
                                l_resume_0(l_create_0(function() --[[ Line: 77 ]]
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
                                l_resume_0(l_create_0(function() --[[ Line: 98 ]]
                                    -- upvalues: l_Part_0 (copy), v13 (ref), v14 (ref), v15 (ref), l_RunService_1 (ref)
                                    while l_Part_0 ~= nil and l_Part_0:IsDescendantOf(workspace.Debree) == true do
                                        local v28, v29, v30 = _G.getmousepos(100, true);
                                        if v29 ~= nil then
                                            v13 = v28;
                                            v14 = v30;
                                        else
                                            local v31 = v28 + Vector3.new(0, 10, 0, 0);
                                            local _ = Vector3.new(0, -25, 0, 0);
                                            local v33 = workspace:Raycast(v31, Vector3.new(0, -25, 0, 0), v15);
                                            if v33 ~= nil and v33.Instance ~= nil then
                                                v13 = v33.Position;
                                                v14 = v33.Normal;
                                            end;
                                        end;
                                        if v13 ~= nil then
                                            l_Part_0.Position = v13;
                                        end;
                                        l_RunService_1.RenderStepped:wait();
                                    end;
                                end));
                                local v34 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.blood_burst.blood_shot);
                                v34:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 121 ]]
                                    -- upvalues: v0 (ref), v21 (copy), v34 (copy)
                                    task.wait(0.22);
                                    if v0.currentid == v21 then
                                        v34:AdjustSpeed(0);
                                    end;
                                end));
                            end;
                        end;
                    end;
                    return v19;
                end;
            end;
        end;
    end;
end;
local v35 = 0;
local v36 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v37) --[[ Line: 139 ]]
    -- upvalues: v36 (copy), v35 (ref)
    if table.find(v36, v37.Name) ~= nil then
        v35 = "";
    end;
end);
v0.Up = function(v38) --[[ Line: 140 ]]
    -- upvalues: v35 (ref), l_tick_0 (copy), v0 (copy), v10 (ref), l_resume_0 (copy), l_create_0 (copy), v13 (ref), v14 (ref), v17 (ref), v1 (copy)
    if v38 == nil then
        return;
    else
        local v39 = _G.generateid();
        v35 = v39;
        repeat
            task.wait();
        until l_tick_0() - 0 >= 0.22;
        if v39 ~= v35 then
            v0.Cancel(v38);
            return true;
        else
            local v40 = _G.generateid();
            v0.currentid = v40;
            v10 = _G.generateid();
            if game.Workspace.Debree:FindFirstChild("Blood_shot_debree_for_client") ~= nil then
                game.Workspace.Debree.Blood_shot_debree_for_client:Destroy();
            end;
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    l_resume_0(l_create_0(function() --[[ Line: 158 ]]
                        -- upvalues: l_tick_0 (ref), v0 (ref), v40 (copy), v13 (ref), v14 (ref), l_Character_1 (copy)
                        _G.Skills_Performance(script.Name, l_tick_0(), 2);
                        task.wait(0.15);
                        if v0.currentid == v40 and v13 ~= nil and v14 ~= nil then
                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("blood_burst_blood_shot_damage", l_Character_1, CFrame.new(v13));
                            _G:Initiate_C("explosion_first", v13, v14, l_Character_1);
                        end;
                    end));
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "Cancel";
                        l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                        game.Debris:AddItem(l_thunderclapandflashbg_0, 0.5);
                    end;
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 0.5);
                    end;
                    for _, v48 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v48.Name == "blood_shot" then
                            v48:AdjustSpeed(1);
                        end;
                    end;
                end;
            end;
            if v38 ~= nil and v38:FindFirstChild("LastUsed") ~= nil then
                v38.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            if v17 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v49) --[[ Line: 206 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v17 (ref), v1 (copy)
    if v49 == nil then
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
                for _, v54 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v54.Name == "thunderclap_and_flash_bv" or v54.Name == "thunderclapandflashbg" then
                        v54:Destroy();
                    end;
                end;
                for _, v56 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v56.Name == "blood_shot" then
                        v56:Stop();
                    end;
                end;
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