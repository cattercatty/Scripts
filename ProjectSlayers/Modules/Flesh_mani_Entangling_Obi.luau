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
local v22 = Vector3.new();
local v23 = false;
if game.Players.LocalPlayer.Character == nil then
    return;
else
    local function _() --[[ Line: 35 ]] --[[ Name: dmg ]]
        -- upvalues: v23 (ref), v22 (ref)
        if v23 == false then
            return;
        else
            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("Flesh_mani_Entangling_Obi_damage2", game.Players.LocalPlayer.Character, CFrame.new(v22));
            return;
        end;
    end;
    local v25 = false;
    det = function() --[[ Line: 42 ]] --[[ Name: det ]]
        -- upvalues: v25 (ref), v23 (ref), v22 (ref)
        if v25 == true then
            return;
        else
            v25 = true;
            if game.Players.LocalPlayer.Character == nil then
                return;
            else
                task.wait(0.05);
                if v23 ~= false then
                    game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("Flesh_mani_Entangling_Obi_damage2", game.Players.LocalPlayer.Character, CFrame.new(v22));
                end;
                _G:Initiate_C("Entangling Obi", game.Players.LocalPlayer.Character, nil, "Det");
                v25 = false;
                return;
            end;
        end;
    end;
    game.ReplicatedStorage:WaitForChild("mobile_tap_events"):WaitForChild("mobile_skill_tap").Event:Connect(function(v26) --[[ Line: 50 ]]
        if v26 == "Echoeing Whisper" and workspace.Debree:FindFirstChild("Entangling Obi " .. game.Players.LocalPlayer.Name .. " Trap") ~= nil then
            det();
        end;
    end);
    l_UserInputService_0.InputBegan:Connect(function(v27, v28) --[[ Line: 58 ]]
        -- upvalues: v20 (ref), l_LocalPlayer_0 (copy)
        if v28 == false and v20 ~= nil and v27.KeyCode.Name == game.ReplicatedStorage.Player_Data:FindFirstChild(l_LocalPlayer_0.Name).Keys:FindFirstChild(v20)["2"].Value and workspace.Debree:FindFirstChild("Entangling Obi " .. game.Players.LocalPlayer.Name .. " Trap") ~= nil then
            det();
        end;
    end);
    local v29 = RaycastParams.new();
    v29.FilterDescendantsInstances = {
        workspace.Map
    };
    v29.FilterType = Enum.RaycastFilterType.Include;
    v0.Down = function(v30) --[[ Line: 70 ]]
        -- upvalues: v25 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v15 (ref), v20 (ref), v8 (ref), v23 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_1 (copy), v16 (ref), v29 (copy), v22 (ref)
        if v30 == nil then
            return;
        else
            local v31 = false;
            if v25 == true then
                return;
            elseif workspace.Debree:FindFirstChild("Entangling Obi " .. game.Players.LocalPlayer.Name .. " Trap") ~= nil then
                return;
            elseif v30 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
                return;
            elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
                return;
            else
                local v32 = false;
                if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                    v32 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
                end;
                if v32 == false then
                    v32 = nil;
                end;
                if v32 == nil then
                    return;
                else
                    v32 = v32.Value;
                    if v32 == nil then
                        return;
                    elseif l_get_item_health_0(v32, game.Players.LocalPlayer.Name) ~= true then
                        return;
                    else
                        local v33 = _G.generateid();
                        v0.currentid = v33;
                        if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                            if v1:Check() ~= true then
                                v15 = true;
                            end;
                            local l_Character_0 = game.Players.LocalPlayer.Character;
                            if l_Character_0 ~= nil then
                                local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                                if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(0) == true then
                                    _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                    if v15 == true then
                                        _G.can_perf_air_tang = false;
                                    end;
                                    v20 = v30.Equiped_Key.Value;
                                    v31 = true;
                                    if v15 == false then
                                        v1.Disabled = true;
                                    end;
                                    v8 = l_tick_0();
                                    if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                        for _, v38 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                            if v38:IsA("BodyVelocity") then
                                                v38:Destroy();
                                            end;
                                        end;
                                    end;
                                    v23 = true;
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
                                    l_resume_0(l_create_0(function() --[[ Line: 127 ]]
                                        -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_1 (ref)
                                        while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                            l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                            l_RunService_1.RenderStepped:Wait();
                                        end;
                                    end));
                                    v8 = l_tick_0();
                                    l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.FleshM.Obi_entangling):Play();
                                    _G:Initiate_C("Entangling Obi", l_Character_0, l_HumanoidRootPart_0.CFrame, "PreStart");
                                    game.Debris:AddItem(l_BodyGyro_0, 0.6);
                                    game.Debris:AddItem(l_BodyVelocity_0, 0.6);
                                    v16 = _G.generateid();
                                    task.delay(0.35, function() --[[ Line: 142 ]]
                                        -- upvalues: v0 (ref), v33 (copy), l_HumanoidRootPart_0 (copy), v29 (ref), v22 (ref), l_Character_0 (copy)
                                        if v0.currentid == v33 then
                                            local v41, _, _ = _G.getmousepos(100, true, nil, nil, nil, l_HumanoidRootPart_0.Position);
                                            local v44 = v41 + Vector3.new(0, 10, 0, 0);
                                            local _ = Vector3.new(0, -25, 0, 0);
                                            local v46 = workspace:Raycast(v44, Vector3.new(0, -25, 0, 0), v29);
                                            if v46 ~= nil and v46.Instance ~= nil then
                                                v41 = v46.Position;
                                            end;
                                            v22 = v41;
                                            game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("Flesh_mani_Entangling_Obi_damage", l_Character_0, CFrame.new(v41));
                                            _G:Initiate_C("Entangling Obi", l_Character_0, l_HumanoidRootPart_0.CFrame, "Start", v41);
                                            local l_FirstChild_0 = workspace.Debree:FindFirstChild("Entangling Obi " .. game.Players.LocalPlayer.Name .. " Trap");
                                            task.delay(5.7, function() --[[ Line: 155 ]]
                                                -- upvalues: l_FirstChild_0 (copy)
                                                if l_FirstChild_0 ~= nil and l_FirstChild_0.Parent == workspace.Debree and l_FirstChild_0.Name == "Entangling Obi " .. game.Players.LocalPlayer.Name .. " Trap" then
                                                    det();
                                                end;
                                            end);
                                        end;
                                    end);
                                end;
                            end;
                        end;
                        return v31;
                    end;
                end;
            end;
        end;
    end;
    v0.Up = function(v48) --[[ Line: 173 ]]
        -- upvalues: v16 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), l_LocalPlayer_0 (copy), v15 (ref), v1 (copy)
        if v48 == nil then
            return;
        else
            local v49 = _G.generateid();
            v16 = v49;
            repeat
                wait();
            until l_tick_0() - v8 >= 0.6;
            if v49 ~= v16 then
                v0.Cancel(v48);
                return true;
            else
                v0.currentid = _G.generateid();
                local l_Character_1 = game.Players.LocalPlayer.Character;
                if l_Character_1 ~= nil then
                    if game.Workspace.Debree:FindFirstChild(l_LocalPlayer_0.Name .. "'s arrow") ~= nil then
                        for _, v52 in pairs(game.Workspace.Debree:GetChildren()) do
                            if v52.Name == l_LocalPlayer_0.Name .. "'s arrow" then
                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("remove_item", v52);
                                v52:Destroy();
                            end;
                        end;
                    end;
                    local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                    local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                    if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                        for _, v56 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                            if v56.Name == "thunderclap_and_flash_bv" or v56.Name == "thunderclapandflashbg" then
                                v56:Destroy();
                            end;
                        end;
                        for _, v58 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                            if v58.Name == "Dream_Man_Hypnosis" then
                                v58:Stop();
                            end;
                        end;
                    end;
                end;
                if v48 ~= nil and v48:FindFirstChild("LastUsed") ~= nil then
                    v48.LastUsed.Value = l_tick_0();
                end;
                if v15 == false then
                    v1.Disabled = false;
                end;
                _G.can_perf_air_tang = true;
                return true;
            end;
        end;
    end;
    v0.Cancel = function(v59) --[[ Line: 226 ]]
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
                        if v68.Name == "Dream_Man_Hypnosis" then
                            v68:Stop();
                        end;
                    end;
                end;
            end;
            if v59 ~= nil and v59:FindFirstChild("LastUsed") ~= nil then
                v59.LastUsed.Value = l_tick_0();
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
end;