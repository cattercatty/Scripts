local v0 = {
    currentid = ""
};
local v1 = require(game.ReplicatedStorage.Modules.Client.character_handler);
local _ = coroutine.resume;
local _ = coroutine.create;
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
local v14 = RaycastParams.new();
v14.FilterDescendantsInstances = {
    workspace.Map
};
v14.FilterType = Enum.RaycastFilterType.Whitelist;
local _ = game:GetService("RunService");
local _ = game:GetService("TweenService");
local _ = TweenInfo.new(0.23, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
local v18 = false;
local _ = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Global"):WaitForChild("skills_custom_add_thing"))[script.Name];
local v20 = 0;
local v21 = RaycastParams.new();
v21.FilterDescendantsInstances = {
    workspace.Map
};
v21.FilterType = Enum.RaycastFilterType.Whitelist;
local v22 = 0;
local v23 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v24) --[[ Line: 37 ]]
    -- upvalues: v23 (copy), v22 (ref)
    if table.find(v23, v24.Name) ~= nil then
        v22 = "";
    end;
end);
v0.Down = function(v25) --[[ Line: 38 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v20 (ref), v18 (ref), v8 (ref), v22 (ref), v21 (copy)
    if v25 == nil then
        return;
    else
        local v26 = false;
        if v25 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v27 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v27 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v27 == false then
                v27 = nil;
            end;
            if v27 == nil then
                return;
            else
                v27 = v27.Value;
                if v27 == nil then
                    return;
                elseif l_get_item_health_0(v27, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    v0.currentid = _G.generateid();
                    if v1:Check() == true then
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(90) == true then
                                v1.Disabled = true;
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                v26 = true;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new();
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                game.Debris:AddItem(l_BodyVelocity_0, 2.6);
                                v20 = 0;
                                v18 = true;
                                v8 = l_tick_0();
                                v22 = _G.generateid();
                                local v32 = l_HumanoidRootPart_0.Position + Vector3.new(0, 2, 0, 0);
                                local _ = Vector3.new(0, -15, 0, 0);
                                local v34 = workspace:Raycast(v32, Vector3.new(0, -15, 0, 0), v21);
                                if v34 ~= nil and v34.Instance ~= nil then
                                    local l_Rotation_0 = l_HumanoidRootPart_0.CFrame.Rotation;
                                    l_HumanoidRootPart_0.CFrame = CFrame.new(v34.Position) * CFrame.new(0, l_Character_0:GetModelSize().Y / 2, 0) * l_Rotation_0;
                                end;
                                _G:Initiate_C("flesh_demon_spawn_effect", l_HumanoidRootPart_0);
                                task.wait(2.8);
                            end;
                        end;
                        if v25 ~= nil and v25:FindFirstChild("LastUsed") ~= nil then
                            v25.LastUsed.Value = l_tick_0();
                        end;
                        v1.Disabled = false;
                        _G.can_perf_air_tang = true;
                    end;
                    return false;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v36) --[[ Line: 107 ]]
    -- upvalues: v22 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v18 (ref), v1 (copy)
    if v36 == nil then
        return;
    else
        local v37 = _G.generateid();
        v22 = v37;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 2.8;
        if v37 ~= v22 then
            v0.Cancel(v36);
            return true;
        elseif v18 == false then
            return true;
        else
            v18 = false;
            v0.currentid = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                _G:Initiate_C("swamp_domain_mainasd", {
                    Character = l_Character_1
                }, true);
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    for _, v42 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                        if v42.Name == "thunderclap_and_flash_bv" or v42.Name == "thunderclapandflashbg" then
                            v42:Destroy();
                        end;
                    end;
                    for _, v44 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v44.Name == "swamp_on_ground_Double" then
                            v44:AdjustSpeed(1);
                        end;
                    end;
                end;
            end;
            if v36 ~= nil and v36:FindFirstChild("LastUsed") ~= nil then
                v36.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            v1.Disabled = false;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v45) --[[ Line: 150 ]]
    -- upvalues: v22 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v18 (ref), v1 (copy)
    if v45 == nil then
        return;
    else
        local v46 = _G.generateid();
        v22 = v46;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 2.8;
        if v46 ~= v22 then
            v0.Cancel(v45);
            return true;
        elseif v18 == false then
            return true;
        else
            v18 = false;
            v0.currentid = _G.generateid();
            local l_Character_2 = game.Players.LocalPlayer.Character;
            if l_Character_2 ~= nil then
                _G:Initiate_C("swamp_domain_mainasd", {
                    Character = l_Character_2
                }, true);
                local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                    for _, v51 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                        if v51.Name == "thunderclap_and_flash_bv" or v51.Name == "thunderclapandflashbg" then
                            v51:Destroy();
                        end;
                    end;
                    for _, v53 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                        if v53.Name == "swamp_on_ground_Double" then
                            v53:Stop();
                        end;
                    end;
                end;
            end;
            if v45 ~= nil and v45:FindFirstChild("LastUsed") ~= nil then
                v45.LastUsed.Value = l_tick_0();
            end;
            task.wait(0.3);
            v1.Disabled = false;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
return v0;