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
local _ = game:GetService("TweenService");
local _ = TweenInfo.new(0.03, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true, 0);
local l_get_item_health_0 = require(game.ReplicatedStorage.Modules.Server.Server_Modules:WaitForChild("get_item_health"));
local _ = TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
local v14 = {};
local v15 = "";
local v16 = {
    "Stun", 
    "KnockedOut", 
    "RagDoll"
};
v7.ChildAdded:Connect(function(v17) --[[ Line: 19 ]]
    -- upvalues: v16 (copy), v15 (ref), v14 (copy)
    if table.find(v16, v17.Name) ~= nil then
        if v15 ~= "" then
            for _, v19 in pairs(v14) do
                v19:Destroy();
            end;
        end;
        v15 = "";
    end;
end);
local v20 = false;
local v21 = false;
v0.Down = function(v22) --[[ Line: 31 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v20 (ref), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v8 (ref), v21 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy)
    local v23 = false;
    if v22 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
        return;
    elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
        return;
    else
        local l_Id_0 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
        if l_Id_0 == nil then
            return;
        else
            v20 = false;
            l_Id_0 = l_Id_0.Value;
            if l_Id_0 == nil then
                return;
            elseif l_get_item_health_0(l_Id_0, game.Players.LocalPlayer.Name) ~= true then
                return;
            else
                local v25 = _G.generateid();
                v0.currentid = v25;
                if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                    if v1:Check() ~= true then
                        v20 = true;
                    end;
                    local l_Character_0 = game.Players.LocalPlayer.Character;
                    if l_Character_0 ~= nil then
                        local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                        local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                        if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(80, 0) then
                            _G.Skills_Performance(script.Name, l_tick_0(), 5);
                            v23 = true;
                            if v20 == true then
                                _G.can_perf_air_tang = false;
                            end;
                            v8 = l_tick_0();
                            if v20 == false then
                                v1.Disabled = true;
                            end;
                            if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                for _, v30 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                    if v30:IsA("BodyVelocity") then
                                        v30:Destroy();
                                    end;
                                end;
                            end;
                            v21 = true;
                            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                            l_BodyVelocity_0.MaxForce = Vector3.new(10000, 0, 10000, 0);
                            l_BodyVelocity_0.Velocity = Vector3.new();
                            l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                            l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                            local l_BodyGyro_0 = Instance.new("BodyGyro");
                            l_BodyGyro_0.P = 20000;
                            l_BodyGyro_0.MaxTorque = Vector3.new(0, 1.0000000200408773E21, 0, 0);
                            l_BodyGyro_0.Name = "thunderclapandflashbg";
                            l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                            l_resume_0(l_create_0(function() --[[ Line: 83 ]]
                                -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                    l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                    l_RunService_0.RenderStepped:wait();
                                end;
                            end));
                            l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Akaza.Akaza_annihilation_type_tang):Play();
                            task.spawn(function() --[[ Line: 92 ]]
                                -- upvalues: l_Character_0 (copy), l_BodyVelocity_0 (copy), v0 (ref), v25 (copy), l_HumanoidRootPart_0 (copy)
                                _G:Initiate_C("Annihilation_Type_Initiate", l_Character_0);
                                task.wait(0.32);
                                if l_BodyVelocity_0 ~= nil and v0.currentid == v25 then
                                    _G:Initiate_C("Annihilation_Type_Dash", l_Character_0);
                                    while l_BodyVelocity_0 ~= nil and l_HumanoidRootPart_0 ~= nil and l_BodyVelocity_0.Parent == l_HumanoidRootPart_0 and l_BodyVelocity_0:FindFirstChild("Cancel") == nil and v0.currentid == v25 do
                                        l_BodyVelocity_0.Velocity = l_HumanoidRootPart_0.CFrame.lookVector * 75;
                                        task.wait();
                                    end;
                                end;
                            end);
                        end;
                    end;
                end;
                return v23;
            end;
        end;
    end;
end;
Lerp = function(v33, v34, v35) --[[ Line: 118 ]] --[[ Name: Lerp ]]
    return v33 + (v34 - v33) * v35;
end;
local v36 = 0;
local v37 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v38) --[[ Line: 121 ]]
    -- upvalues: v37 (copy), v36 (ref)
    if table.find(v37, v38.Name) ~= nil then
        v36 = "";
    end;
end);
local _ = math.random;
v0.Up = function(v40) --[[ Line: 123 ]]
    -- upvalues: v21 (ref), v36 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v15 (ref), v7 (copy), v20 (ref), v1 (copy)
    if v40 == nil then
        return;
    elseif v21 ~= true then
        return true;
    else
        v21 = false;
        local v41 = false;
        local v42 = _G.generateid();
        v36 = v42;
        repeat
            task.wait();
        until l_tick_0() - v8 >= 0.4;
        if v42 ~= v36 then
            v0.Cancel(v40);
            return true;
        else
            local v43 = _G.generateid();
            v0.currentid = v43;
            v15 = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                _G:Initiate_C("Annihilation_Type_Dash", l_Character_1, true);
                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    for _, v48 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                        if v48.Name == "Akaza_annihilation_type_tang" then
                            v48:Stop();
                        end;
                    end;
                    l_Humanoid_1:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Akaza.Akaza_Attempt_tang):Play();
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    if v0.currentid == v43 then
                        v41 = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("Akaza_Annihilation_Type_Damage", l_Character_1, l_HumanoidRootPart_1.CFrame);
                    end;
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        if l_thunderclap_and_flash_bv_0 ~= nil then
                            local l_StringValue_0 = Instance.new("StringValue");
                            l_StringValue_0.Name = "Cancel";
                            l_StringValue_0.Parent = l_thunderclap_and_flash_bv_0;
                            l_thunderclap_and_flash_bv_0.Velocity = Vector3.new();
                        end;
                        if l_thunderclapandflashbg_0 ~= nil then
                            local l_StringValue_1 = Instance.new("StringValue");
                            l_StringValue_1.Name = "Cancel";
                            l_StringValue_1.Parent = l_thunderclapandflashbg_0;
                        end;
                        l_thunderclap_and_flash_bv_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                        task.wait(0.1);
                        if l_thunderclap_and_flash_bv_0 ~= nil then
                            game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 0.1);
                        end;
                        if l_thunderclapandflashbg_0 ~= nil then
                            game.Debris:AddItem(l_thunderclapandflashbg_0, 0.1);
                        end;
                        if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                            l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                        end;
                    end;
                end;
            end;
            if v40 ~= nil and v40:FindFirstChild("LastUsed") ~= nil then
                v40.LastUsed.Value = l_tick_0();
            end;
            local v53 = v41 == true and 1.6 or 0.5;
            local v54 = l_tick_0();
            repeat
                task.wait(0.05);
            until v53 < l_tick_0() - v54 or v7:FindFirstChild("asdasdasdzxczxcannhilation") ~= nil;
            if v20 == false then
                v1.Disabled = false;
            end;
            if v20 == false then
                v1.Disabled = false;
            end;
            _G.can_perf_air_tang = true;
            return true;
        end;
    end;
end;
v0.Cancel = function(v55) --[[ Line: 205 ]]
    -- upvalues: v36 (ref), v21 (ref), v0 (copy), l_tick_0 (copy), v20 (ref), v1 (copy)
    if v55 == nil then
        return;
    else
        v36 = "";
        v21 = false;
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            _G:Initiate_C("Annihilation_Type_Dash", l_Character_2, true);
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                for _, v60 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v60.Name == "thunderclap_and_flash_bv" or v60.Name == "thunderclapandflashbg" then
                        v60:Destroy();
                    end;
                end;
                for _, v62 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v62.Name == "Akaza_annihilation_type_tang" then
                        v62:Stop();
                    end;
                end;
            end;
        end;
        if v55 ~= nil and v55:FindFirstChild("LastUsed") ~= nil then
            v55.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v20 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;