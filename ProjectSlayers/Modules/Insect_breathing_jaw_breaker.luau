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
local v10 = false;
local v11 = RaycastParams.new();
v11.FilterDescendantsInstances = {
    workspace.Map
};
v11.FilterType = Enum.RaycastFilterType.Whitelist;
v7.ChildAdded:Connect(function(v12) --[[ Line: 15 ]]
    -- upvalues: v0 (copy)
    if v12.Name == "Stun" or v12.Name == "RagDoll" or v12.Name == "KnockedOut" then
        v0.currentid = "";
    end;
end);
local v13 = false;
v0.Down = function(v14) --[[ Line: 21 ]]
    -- upvalues: v13 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v10 (ref), v1 (copy), l_tick_0 (copy), l_resume_0 (copy), l_create_0 (copy), v11 (copy), v7 (copy)
    if v14 == nil then
        return;
    else
        v13 = false;
        local v15 = false;
        if v14 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent == nil then
            return;
        else
            local v16 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil then
                v16 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v16 == false then
                v16 = nil;
            end;
            if v16 == nil then
                return;
            else
                v16 = v16.Value;
                if v16 == nil then
                    return;
                elseif l_get_item_health_0(v16, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v17 = _G.generateid();
                    v0.currentid = v17;
                    v10 = false;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v13 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(13, 17) == true and l_Character_0:FindFirstChild("Tamari_Arms") == nil then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                if v13 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                v10 = true;
                                v15 = true;
                                l_resume_0(l_create_0(function() --[[ Line: 56 ]]
                                    -- upvalues: v13 (ref), v1 (ref), l_Humanoid_0 (copy), l_HumanoidRootPart_0 (copy), l_Character_0 (copy), v0 (ref), v17 (copy), v11 (ref), v7 (ref), v10 (ref), v14 (copy), l_tick_0 (ref)
                                    if v13 == false then
                                        v1.Disabled = true;
                                    end;
                                    l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Insect.Jaw_Breaker):Play();
                                    task.wait(0.15);
                                    _G:Initiate_C("jaw_breaker_up_insect", l_HumanoidRootPart_0);
                                    task.wait(0.15);
                                    if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                        for _, v22 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                            if v22.Name == "air123123bp" then
                                                v22:Destroy();
                                            end;
                                        end;
                                    end;
                                    local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                    l_BodyVelocity_0.MaxForce = Vector3.new(0, 20000, 0, 0);
                                    game.Debris:AddItem(l_BodyVelocity_0, 2);
                                    l_BodyVelocity_0.Velocity = Vector3.new(0, 25, 0, 0);
                                    l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                    game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("jaw_breaker_damage", l_Character_0, l_HumanoidRootPart_0.CFrame);
                                    task.wait(0.6);
                                    if l_BodyVelocity_0 ~= nil then
                                        l_BodyVelocity_0:Destroy();
                                    end;
                                    if v0.currentid == v17 then
                                        local l_CFrame_0 = l_HumanoidRootPart_0.CFrame;
                                        local v25 = l_HumanoidRootPart_0.Position - Vector3.new(0, 20, 0, 0) + l_HumanoidRootPart_0.CFrame.lookVector * 4;
                                        local v26 = (v25 - l_HumanoidRootPart_0.Position) * 20;
                                        local v27 = workspace:Raycast(l_HumanoidRootPart_0.Position, v26, v11);
                                        if v27 ~= nil and v27.Instance ~= nil and v27.Position ~= nil then
                                            v25 = v27.Position + Vector3.new(0, l_Character_0:GetModelSize().Y / 2, 0);
                                        end;
                                        local l_BodyPosition_0 = Instance.new("BodyPosition");
                                        l_BodyPosition_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                                        l_BodyPosition_0.Position = v25;
                                        local v29 = l_HumanoidRootPart_0.CFrame - l_HumanoidRootPart_0.Position;
                                        l_HumanoidRootPart_0.CFrame = CFrame.new(v25) * v29;
                                        l_BodyPosition_0.Parent = l_HumanoidRootPart_0;
                                        local l_StringValue_0 = Instance.new("StringValue");
                                        l_StringValue_0.Name = "cant_move";
                                        l_StringValue_0.Parent = v7;
                                        game.Debris:AddItem(l_StringValue_0, 0.2);
                                        game.Debris:AddItem(l_BodyPosition_0, 0.2);
                                        local v31 = CFrame.new(v25) * v29;
                                        _G:Initiate_C("jaw_breaker_hit_insect", v31, l_CFrame_0);
                                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("jaw_breaker_damage", l_Character_0, l_HumanoidRootPart_0.CFrame, nil, true);
                                        task.wait(0.5);
                                    end;
                                    v10 = false;
                                    if v13 == false then
                                        v1.Disabled = false;
                                    end;
                                    if v14 ~= nil and v14:FindFirstChild("LastUsed") ~= nil then
                                        v14.LastUsed.Value = l_tick_0();
                                    end;
                                    _G.can_perf_air_tang = true;
                                end));
                            end;
                        end;
                    end;
                    return v15;
                end;
            end;
        end;
    end;
end;
v0.Up = function(_) --[[ Line: 139 ]]
    -- upvalues: v10 (ref)
    repeat
        task.wait();
    until v10 == false;
    return true;
end;
v0.Cancel = function(_) --[[ Line: 145 ]]
    -- upvalues: v10 (ref)
    repeat
        task.wait();
    until v10 == false;
    return true;
end;
return v0;