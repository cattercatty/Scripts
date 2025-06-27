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
local v11 = false;
local v12 = false;
local v13 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Global"):WaitForChild("skills_custom_add_thing"))[script.Name];
local v14 = 0;
v0.Down = function(v15) --[[ Line: 18 ]]
    -- upvalues: v12 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v14 (ref), v11 (ref), v8 (ref), l_resume_0 (copy), l_create_0 (copy), v7 (copy), v13 (copy), l_RunService_0 (copy)
    if v15 == nil then
        return;
    else
        local v16 = false;
        v12 = false;
        if v15 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local l_Id_0 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
            if l_Id_0 == nil then
                return;
            else
                l_Id_0 = l_Id_0.Value;
                if l_Id_0 == nil then
                    return;
                elseif l_get_item_health_0(l_Id_0, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    local v18 = _G.generateid();
                    v0.currentid = v18;
                    if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                        if v1:Check() ~= true then
                            v12 = true;
                        end;
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(15, 0) then
                                v14 = 0;
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v16 = true;
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                v11 = true;
                                if v12 == true then
                                    _G.can_perf_air_tang = false;
                                end;
                                if v12 == false then
                                    v1.Disabled = true;
                                end;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v23 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v23:IsA("BodyVelocity") then
                                            v23:Destroy();
                                        end;
                                    end;
                                end;
                                local v24 = false;
                                local v25 = false;
                                local v26 = false;
                                do
                                    local l_v24_0, l_v25_0, l_v26_0 = v24, v25, v26;
                                    l_resume_0(l_create_0(function() --[[ Line: 68 ]]
                                        -- upvalues: l_v25_0 (ref), v18 (copy), v0 (ref), v7 (ref), v14 (ref), v13 (ref), l_v24_0 (ref), l_v26_0 (ref), l_Character_0 (copy), l_HumanoidRootPart_0 (copy), v11 (ref), v15 (copy)
                                        while l_v25_0 == false do
                                            task.wait();
                                            if v18 == v0.currentid and v7 ~= nil and v14 < v13 and game.Players.LocalPlayer ~= nil and game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and v7:FindFirstChild("Stamina") ~= nil and v7.Stamina.Value > 2 then
                                                _G:RemoveStam(2);
                                                if l_v24_0 == false then
                                                    l_v24_0 = nil;
                                                end;
                                                if l_v26_0 == true then
                                                    game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("akaza_chaotic_type_damage", l_Character_0, l_HumanoidRootPart_0.CFrame);
                                                end;
                                                v14 = v14 + 1;
                                                task.wait(0.125);
                                            else
                                                l_v25_0 = true;
                                                if v11 == true then
                                                    v0.Up(v15);
                                                    return;
                                                else
                                                    break;
                                                end;
                                            end;
                                        end;
                                    end));
                                    local l_BodyGyro_0 = Instance.new("BodyGyro");
                                    l_BodyGyro_0.P = 20000;
                                    l_BodyGyro_0.MaxTorque = Vector3.new(1.0000000200408773E21, 1.0000000200408773E21, 1.0000000200408773E21, 0);
                                    l_BodyGyro_0.Name = "thunderslashesgyro";
                                    l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                                    l_resume_0(l_create_0(function() --[[ Line: 106 ]]
                                        -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                        while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                            l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                            l_RunService_0.RenderStepped:Wait();
                                        end;
                                    end));
                                    l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Akaza.akaza_chaotic_type_wind_up):Play();
                                    _G:Initiate_C("chaotic_type_start", l_Character_0);
                                    task.delay(0.32, function() --[[ Line: 117 ]]
                                        -- upvalues: v18 (copy), v0 (ref), l_v26_0 (ref), l_Character_0 (copy), l_Humanoid_0 (copy)
                                        if v18 == v0.currentid then
                                            l_v26_0 = true;
                                            _G:Initiate_C("Chaotic_Type_Barrage", l_Character_0);
                                            l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Akaza.akaza_chaotic_type_loop):Play();
                                        end;
                                    end);
                                end;
                            end;
                        end;
                    end;
                    return v16;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v31) --[[ Line: 139 ]]
    -- upvalues: v11 (ref), v0 (copy), l_resume_0 (copy), l_create_0 (copy), v7 (copy), l_tick_0 (copy), v12 (ref), v1 (copy)
    if v31 == nil then
        return;
    elseif v11 == false then
        return true;
    else
        v11 = false;
        local v32 = _G.generateid();
        v0.currentid = v32;
        local l_Character_1 = game.Players.LocalPlayer.Character;
        if l_Character_1 ~= nil then
            local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
            _G:Initiate_C("Chaotic_Type_Barrage", l_Character_1, true);
            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                local v36 = l_Humanoid_1:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Akaza.akaza_chaotic_type_end);
                v36:Play();
                v36:AdjustSpeed(1.35);
                if l_HumanoidRootPart_1:FindFirstChild("thunderclapting") ~= nil then
                    for _, v38 in pairs(l_HumanoidRootPart_1:GetChildren()) do
                        if v38.Name == "thunderclapting" then
                            v38:Destroy();
                        end;
                    end;
                end;
                l_resume_0(l_create_0(function() --[[ Line: 160 ]]
                    -- upvalues: l_HumanoidRootPart_1 (copy), l_Humanoid_1 (copy), v32 (copy), v0 (ref), l_Character_1 (copy)
                    task.wait(0.255);
                    if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil and v32 == v0.currentid then
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("akaza_chaotic_type_damage", l_Character_1, l_HumanoidRootPart_1.CFrame, true);
                        _G:Initiate_C("chaotic_type_last", l_Character_1);
                    end;
                end));
                local l_thunderslashesgyro_0 = l_HumanoidRootPart_1:FindFirstChild("thunderslashesgyro");
                local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                if l_thunderclap_and_flash_bv_0 ~= nil then
                    game.Debris:AddItem(l_thunderclap_and_flash_bv_0, 0.26);
                end;
                if l_thunderslashesgyro_0 ~= nil then
                    game.Debris:AddItem(l_thunderslashesgyro_0, 0.26);
                end;
                if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                    l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                end;
                for _, v42 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v42.Name == "akaza_chaotic_type_loop" then
                        v42:Stop();
                    end;
                end;
            end;
        end;
        if v31 and v31 ~= nil and v31:FindFirstChild("LastUsed") ~= nil then
            v31.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.5);
        if v12 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
v0.Cancel = function(v43) --[[ Line: 207 ]]
    -- upvalues: v11 (ref), v0 (copy), l_tick_0 (copy), v12 (ref), v1 (copy)
    if v43 == nil then
        return;
    elseif v11 == false then
        return true;
    else
        v11 = false;
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            _G:Initiate_C("Chaotic_Type_Barrage", l_Character_2, true);
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                if l_HumanoidRootPart_2:FindFirstChild("thunderclapting") ~= nil then
                    for _, v48 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                        if v48.Name == "thunderclapting" then
                            v48:Destroy();
                        end;
                    end;
                end;
                for _, v50 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v50.Name == "thunderclap_and_flash_bv" or v50.Name == "thunderslashesgyro" then
                        v50:Destroy();
                    end;
                end;
                for _, v52 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v52.Name == "akaza_chaotic_type_loop" then
                        v52:Stop();
                    end;
                end;
            end;
        end;
        if v43 and v43 ~= nil and v43:FindFirstChild("LastUsed") ~= nil then
            v43.LastUsed.Value = l_tick_0();
        end;
        task.wait(0.3);
        if v12 == false then
            v1.Disabled = false;
        end;
        _G.can_perf_air_tang = true;
        return true;
    end;
end;
return v0;