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
local v11 = {};
local v12 = "";
local v13 = {
    "Stun", 
    "KnockedOut", 
    "RagDoll"
};
v7.ChildAdded:Connect(function(v14) --[[ Line: 18 ]]
    -- upvalues: v13 (copy), v12 (ref), v11 (copy)
    if table.find(v13, v14.Name) ~= nil then
        if v12 ~= "" then
            for _, v16 in pairs(v11) do
                v16:Destroy();
            end;
        end;
        v12 = "";
    end;
end);
local v17 = false;
v0.Down = function(v18) --[[ Line: 29 ]]
    -- upvalues: v17 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy)
    if v18 == nil then
        return;
    else
        local v19 = false;
        v17 = false;
        if v18 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent == nil then
            return;
        else
            local l_Id_0 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id");
            if l_Id_0 == nil then
                return;
            else
                l_Id_0 = l_Id_0.Value;
                if l_Id_0 == nil then
                    return;
                elseif l_get_item_health_0(l_Id_0, game.Players.LocalPlayer.Name) ~= true then
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
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(15, 25) then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                if v17 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v17 == false then
                                    v1.Disabled = true;
                                end;
                                if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                    l_HumanoidRootPart_0.air123123bp:Destroy();
                                end;
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                v19 = true;
                                v1.Disabled = true;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v26 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v26:IsA("BodyVelocity") then
                                            v26:Destroy();
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
                                l_resume_0(l_create_0(function() --[[ Line: 83 ]]
                                    -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                    while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil and l_BodyGyro_0:IsDescendantOf(workspace) do
                                        l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                        l_RunService_0.RenderStepped:wait();
                                    end;
                                end));
                                local v29 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.ThunderBreathing.Heat_Lightning);
                                v29:Play();
                                l_resume_0(l_create_0(function() --[[ Line: 92 ]]
                                    -- upvalues: v0 (ref), v21 (copy), v29 (copy)
                                    task.wait(0.3);
                                    if v0.currentid == v21 then
                                        v29:AdjustSpeed(0);
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
local v30 = 0;
local v31 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v32) --[[ Line: 110 ]]
    -- upvalues: v31 (copy), v30 (ref)
    if table.find(v31, v32.Name) ~= nil then
        v30 = "";
    end;
end);
v0.Up = function(v33) --[[ Line: 111 ]]
    -- upvalues: v30 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v12 (ref), l_resume_0 (copy), l_create_0 (copy), v7 (copy), v17 (ref), v1 (copy)
    if v33 == nil then
        return;
    else
        local v34 = _G.generateid();
        v30 = v34;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.3;
        if v34 ~= v30 then
            v0.Cancel(v33);
            return true;
        else
            v0.currentid = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            local v36 = _G.generateid();
            v12 = v36;
            if l_Character_1 ~= nil then
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
                    l_resume_0(l_create_0(function() --[[ Line: 132 ]]
                        -- upvalues: l_tick_0 (ref), v36 (copy), v12 (ref), l_HumanoidRootPart_1 (copy), l_Character_1 (copy)
                        task.wait(0.06);
                        _G.Skills_Performance(script.Name, l_tick_0(), 2);
                        task.wait(0.055);
                        if v36 == v12 then
                            local l_Position_0 = l_HumanoidRootPart_1.Position;
                            local v43 = _G.getmousepos(200);
                            _G:Initiate_C("shoot_water_Dragon", l_Character_1, l_Position_0, v43);
                        end;
                    end));
                    for _, v45 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v45.Name == "Heat_Lightning" then
                            v45:AdjustSpeed(1);
                        end;
                    end;
                    task.wait(0.7);
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
            if v33 ~= nil and v33:FindFirstChild("LastUsed") ~= nil then
                v33.LastUsed.Value = l_tick_0();
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
v0.Cancel = function(v46) --[[ Line: 178 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v17 (ref), v1 (copy)
    if v46 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v51 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v51.Name == "thunderclap_and_flash_bv" or v51.Name == "thunderclapandflashbg" then
                        v51:Destroy();
                    end;
                end;
                for _, v53 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v53.Name == "Heat_Lightning" then
                        v53:Stop();
                    end;
                end;
            end;
        end;
        if v46 ~= nil and v46:FindFirstChild("LastUsed") ~= nil then
            v46.LastUsed.Value = l_tick_0();
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