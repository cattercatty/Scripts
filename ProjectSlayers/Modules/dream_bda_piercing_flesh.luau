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
local _ = game:GetService("TweenService");
local _ = TweenInfo.new(0.23, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
v0.Down = function(v20) --[[ Line: 34 ]]
    -- upvalues: v17 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v13 (ref), v14 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_1 (copy), v15 (copy)
    if v20 == nil then
        return;
    else
        local v21 = false;
        v17 = false;
        if v20 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v22 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v22 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
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
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(75) == true then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v21 = true;
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
                                l_BodyGyro_0.MaxTorque = Vector3.new(0, 1.0000000200408773E21, 0, 0);
                                l_BodyGyro_0.Name = "thunderclapandflashbg";
                                l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                l_resume_0(l_create_0(function() --[[ Line: 81 ]]
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
                                l_resume_0(l_create_0(function() --[[ Line: 102 ]]
                                    -- upvalues: l_Part_0 (copy), v13 (ref), v14 (ref), v15 (ref), l_RunService_1 (ref)
                                    while l_Part_0 ~= nil and l_Part_0:IsDescendantOf(workspace.Debree) == true do
                                        local v30, v31, v32 = _G.getmousepos(100, true);
                                        if v31 ~= nil then
                                            v13 = v30;
                                            v14 = v32;
                                        else
                                            local v33 = v30 + Vector3.new(0, 10, 0, 0);
                                            local _ = Vector3.new(0, -25, 0, 0);
                                            local v35 = workspace:Raycast(v33, Vector3.new(0, -25, 0, 0), v15);
                                            if v35 ~= nil and v35.Instance ~= nil then
                                                v13 = v35.Position;
                                                v14 = v35.Normal;
                                            end;
                                        end;
                                        if v13 ~= nil then
                                            l_Part_0.Position = v13;
                                        end;
                                        l_RunService_1.RenderStepped:wait();
                                    end;
                                end));
                                local v36 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Dream.Dream_tentacle_thingasdasd);
                                v36:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 125 ]]
                                    -- upvalues: v0 (ref), v23 (copy), v36 (copy)
                                    task.wait(0.3);
                                    if v0.currentid == v23 then
                                        v36:AdjustSpeed(0);
                                    end;
                                end));
                            end;
                        end;
                    end;
                    return v21;
                end;
            end;
        end;
    end;
end;
local v37 = 0;
local v38 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v39) --[[ Line: 143 ]]
    -- upvalues: v38 (copy), v37 (ref)
    if table.find(v38, v39.Name) ~= nil then
        v37 = "";
    end;
end);
v0.Up = function(v40) --[[ Line: 144 ]]
    -- upvalues: v37 (ref), l_tick_0 (copy), v0 (copy), v10 (ref), v13 (ref), v14 (ref), v15 (copy), v17 (ref), v1 (copy)
    if v40 == nil then
        return;
    else
        local v41 = _G.generateid();
        v37 = v41;
        repeat
            task.wait();
        until l_tick_0() - 0 >= 0.3;
        if v41 ~= v37 then
            v0.Cancel(v40);
            return true;
        else
            local v42 = _G.generateid();
            v0.currentid = v42;
            v10 = _G.generateid();
            if game.Workspace.Debree:FindFirstChild("Blood_shot_debree_for_client") ~= nil then
                game.Workspace.Debree.Blood_shot_debree_for_client:Destroy();
            end;
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    task.spawn(function() --[[ Line: 162 ]]
                        -- upvalues: l_tick_0 (ref), v0 (ref), v42 (copy), v13 (ref), v14 (ref), v15 (ref), l_HumanoidRootPart_1 (copy), l_Character_1 (copy)
                        _G.Skills_Performance(script.Name, l_tick_0(), 2);
                        if v0.currentid == v42 and v13 ~= nil and v14 ~= nil then
                            local v46 = v13 + Vector3.new(0, 5, 0, 0);
                            local _ = Vector3.new(0, -40, 0, 0);
                            local v48 = workspace:Raycast(v46, Vector3.new(0, -40, 0, 0), v15);
                            if v48 ~= nil and v48.Instance ~= nil then
                                v13 = v48.Position;
                            end;
                            local v49 = l_HumanoidRootPart_1.CFrame - l_HumanoidRootPart_1.Position;
                            local v50 = CFrame.new(v13) * v49;
                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("dreasm_bda_damsdasdasd", l_Character_1, v50);
                        end;
                        task.wait(0.1);
                        if l_HumanoidRootPart_1 ~= nil and v0.currentid == v42 then
                            _G:Initiate_C("fleshblob_hand_efkansdkjasndl;", l_HumanoidRootPart_1.CFrame * CFrame.new(0, 2.5, -4));
                        end;
                    end);
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
                    for _, v55 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v55.Name == "Dream_tentacle_thingasdasd" then
                            v55:AdjustSpeed(1);
                        end;
                    end;
                end;
            end;
            if v40 ~= nil and v40:FindFirstChild("LastUsed") ~= nil then
                v40.LastUsed.Value = l_tick_0();
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
v0.Cancel = function(v56) --[[ Line: 225 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v17 (ref), v1 (copy)
    if v56 == nil then
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
                for _, v61 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v61.Name == "thunderclap_and_flash_bv" or v61.Name == "thunderclapandflashbg" then
                        v61:Destroy();
                    end;
                end;
                for _, v63 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v63.Name == "Dream_tentacle_thingasdasd" then
                        v63:Stop();
                    end;
                end;
            end;
        end;
        if v56 ~= nil and v56:FindFirstChild("LastUsed") ~= nil then
            v56.LastUsed.Value = l_tick_0();
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