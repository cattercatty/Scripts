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
local v13 = 0;
local v14 = {
    "Stun"
};
v7.ChildAdded:Connect(function(v15) --[[ Line: 14 ]]
    -- upvalues: v14 (copy), v13 (ref)
    if table.find(v14, v15.Name) ~= nil then
        v13 = "";
    end;
end);
local v16 = false;
has_six_fold = function() --[[ Line: 16 ]] --[[ Name: has_six_fold ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v17 = false;
    if l_LocalPlayer_0 ~= nil then
        v17 = false;
        if game.ReplicatedStorage.Player_Data:FindFirstChild(l_LocalPlayer_0.Name) ~= nil then
            v17 = game.ReplicatedStorage.Player_Data:FindFirstChild(l_LocalPlayer_0.Name).unlocked_skills:FindFirstChild("Thunder clap and flash six fold") ~= nil;
        end;
    end;
    return v17;
end;
local v18 = false;
six_fold_transform_time = 1.5;
local v19 = false;
v0.Down = function(v20) --[[ Line: 22 ]]
    -- upvalues: v19 (ref), v18 (ref), l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v16 (ref), v8 (ref), l_resume_0 (copy), l_create_0 (copy), l_RunService_0 (copy)
    v19 = false;
    local v21 = false;
    v18 = false;
    if v20 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
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
                local v23 = _G.generateid();
                v0.currentid = v23;
                if v1:Check() == true or _G.previouslydidcomboasd123 ~= nil and _G.can_perf_air_tang == true and l_tick_0() - _G.previouslydidcomboasd123 <= 1 then
                    if v1:Check() ~= true then
                        v18 = true;
                    end;
                    local l_Character_0 = game.Players.LocalPlayer.Character;
                    if l_Character_0 ~= nil then
                        local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                        local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                        if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(13, 17) then
                            _G.Skills_Performance(script.Name, l_tick_0(), 5);
                            v21 = true;
                            if v18 == true then
                                _G.can_perf_air_tang = false;
                            end;
                            v16 = false;
                            _G:Initiate_C2("placement_thing", true);
                            if l_HumanoidRootPart_0:FindFirstChild("air123123bp") ~= nil then
                                l_HumanoidRootPart_0.air123123bp:Destroy();
                            end;
                            v8 = l_tick_0();
                            if v18 == false then
                                v1.Disabled = true;
                            end;
                            if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                for _, v28 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                    if v28:IsA("BodyVelocity") then
                                        v28:Destroy();
                                    end;
                                end;
                            end;
                            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                            l_BodyVelocity_0.MaxForce = Vector3.new(20000, 20000, 20000, 0);
                            l_BodyVelocity_0.Velocity = Vector3.new();
                            l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                            l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                            local l_BodyGyro_0 = Instance.new("BodyGyro");
                            l_BodyGyro_0.P = 20000;
                            l_BodyGyro_0.MaxTorque = Vector3.new(1.0000000200408773E21, 1.0000000200408773E21, 1.0000000200408773E21, 0);
                            l_BodyGyro_0.Name = "thunderclapandflashbg";
                            l_BodyGyro_0.Parent = l_HumanoidRootPart_0;
                            l_resume_0(l_create_0(function() --[[ Line: 76 ]]
                                -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                    l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                    l_RunService_0.RenderStepped:wait();
                                end;
                            end));
                            local v31 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.ThunderBreathing.ThunderClapAndFlash);
                            v31:Play();
                            l_resume_0(l_create_0(function() --[[ Line: 92 ]]
                                -- upvalues: v0 (ref), v23 (copy), v31 (copy)
                                task.wait(0.45);
                                if v0.currentid == v23 then
                                    v31:AdjustSpeed(0);
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
Lerp = function(v32, v33, v34) --[[ Line: 111 ]] --[[ Name: Lerp ]]
    return v32 + (v33 - v32) * v34;
end;
local _ = math.random;
local v36 = RaycastParams.new();
v36.FilterDescendantsInstances = {
    workspace.Map
};
v36.FilterType = Enum.RaycastFilterType.Whitelist;
v0.Up = function(v37) --[[ Line: 118 ]]
    -- upvalues: v13 (ref), v19 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v7 (copy), v16 (ref), v36 (copy), l_LocalPlayer_0 (copy), v18 (ref), v1 (copy)
    if v37 == nil then
        return;
    else
        local v38 = _G.generateid();
        v13 = v38;
        if v19 == true then
            repeat
                task.wait();
            until l_tick_0() - v8 >= 0.21;
        else
            repeat
                task.wait();
            until l_tick_0() - v8 >= 0.45;
        end;
        if v38 ~= v13 then
            v0.Cancel(v37);
            return true;
        else
            v0.currentid = _G.generateid();
            local l_Character_1 = game.Players.LocalPlayer.Character;
            if l_Character_1 ~= nil then
                local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                    local l_thunderclapandflashbg_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclapandflashbg");
                    if l_thunderclapandflashbg_0 ~= nil then
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "Cancel";
                        l_StringValue_0.Parent = l_thunderclapandflashbg_0;
                    end;
                    local l_thunderclap_and_flash_bv_0 = l_HumanoidRootPart_1:FindFirstChild("thunderclap_and_flash_bv");
                    if l_thunderclap_and_flash_bv_0 ~= nil then
                        _G:Initiate_C2("placement_thing", false);
                        local l_CFrame_0 = l_HumanoidRootPart_1.CFrame;
                        local _ = l_CFrame_0 * CFrame.new(0, 0, -100);
                        _G:Initiate_C("ThunderNClapDeparture", l_CFrame_0);
                        local l_BodyPosition_0 = Instance.new("BodyPosition");
                        l_BodyPosition_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                        l_BodyPosition_0.Position = l_HumanoidRootPart_1.Position;
                        l_BodyPosition_0.Parent = l_HumanoidRootPart_1;
                        l_thunderclap_and_flash_bv_0.MaxForce = Vector3.new();
                        _G.Skills_Performance(script.Name, l_tick_0(), 2);
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("create", "BoolValue", v7, {
                            Name = "thunderclapandflash_clash"
                        }, 0.3);
                        for _, v49 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                            if v49.Name == "ThunderClapAndFlash" or v49.Name == "ThunderClapAndFlash2" then
                                v49:AdjustSpeed(1);
                            end;
                        end;
                        local l_l_CFrame_0_0 = l_CFrame_0;
                        if v16 == true and l_HumanoidRootPart_1 ~= nil then
                            local l_CFrame_1 = l_HumanoidRootPart_1.CFrame;
                            local v52 = l_HumanoidRootPart_1.CFrame * CFrame.new(0, 20, 0);
                            local v53 = v52 - v52.p;
                            local l_Position_0 = l_HumanoidRootPart_1.Position;
                            local v55 = (v52.p - l_HumanoidRootPart_1.Position).Unit * 22;
                            local v56 = workspace:Raycast(l_Position_0, v55, v36);
                            if v56 ~= nil and v56.Position ~= nil then
                                v52 = CFrame.new(v56.Position) * v53;
                            end;
                            for _ = 1, 6 do
                                if l_HumanoidRootPart_1 ~= nil then
                                    local v58 = v52 * CFrame.new(math.random(-5, 5) * 10, math.random(-5, 5) * 10, math.random(-5, 5) * 10);
                                    local l_p_0 = v52.p;
                                    local v60 = (v58.p - v52.p).Unit * 60;
                                    local v61 = workspace:Raycast(l_p_0, v60, v36);
                                    local v62 = v58 - v58.p;
                                    if v61 ~= nil and v61.Position ~= nil then
                                        v58 = CFrame.new(v61.Position) * v62;
                                    end;
                                    l_HumanoidRootPart_1.CFrame = v58;
                                    l_BodyPosition_0.Position = v58.p;
                                    local l_CFrame_2 = l_HumanoidRootPart_1.CFrame;
                                    _G:Initiate_C("thunder_clap6ix_n_flash_eff", l_l_CFrame_0_0.p, l_CFrame_2.p);
                                    l_l_CFrame_0_0 = l_CFrame_2;
                                end;
                                task.wait(0.015);
                            end;
                            if l_HumanoidRootPart_1 ~= nil then
                                l_HumanoidRootPart_1.CFrame = l_CFrame_1;
                                l_BodyPosition_0.Position = l_CFrame_1.p;
                            end;
                        end;
                        if v16 == false then
                            local v64 = l_CFrame_0 * CFrame.new(0, 0, -60);
                            local l_p_1 = l_CFrame_0.p;
                            local v66 = l_CFrame_0.lookVector * 65;
                            local v67 = workspace:Raycast(l_p_1, v66, v36);
                            if v67 ~= nil and v67.Instance ~= nil then
                                local v68 = v64 - v64.p;
                                v64 = CFrame.new(v67.Position) * v68 * CFrame.new(0, 1.5, 0);
                            end;
                            l_HumanoidRootPart_1.CFrame = v64;
                            l_BodyPosition_0.Position = v64.p;
                            task.wait();
                        else
                            local v69 = l_CFrame_0 * CFrame.new(0, 0, -90);
                            local l_p_2 = l_CFrame_0.p;
                            local v71 = l_CFrame_0.lookVector * 95;
                            local v72 = workspace:Raycast(l_p_2, v71, v36);
                            if v72 ~= nil and v72.Instance ~= nil then
                                local v73 = v69 - v69.p;
                                v69 = CFrame.new(v72.Position) * v73 * CFrame.new(0, 1.5, 0);
                            end;
                            l_HumanoidRootPart_1.CFrame = v69;
                            l_BodyPosition_0.Position = v69.p;
                            task.wait();
                            if l_HumanoidRootPart_1 ~= nil then
                                local l_CFrame_3 = l_HumanoidRootPart_1.CFrame;
                                _G:Initiate_C("thunder_clap6ix_n_flash_eff", l_l_CFrame_0_0.p, l_CFrame_3.p);
                            end;
                        end;
                        local v75 = false;
                        if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                            l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                        end;
                        v75 = true;
                        local l_CFrame_4 = l_HumanoidRootPart_1.CFrame;
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("thunder_clap_and_flash_damage", l_LocalPlayer_0.Character, l_CFrame_4, l_CFrame_0);
                        _G:Initiate_C("ThunderNClap", l_CFrame_4, l_CFrame_0);
                        if l_BodyPosition_0 ~= nil then
                            l_BodyPosition_0:Destroy();
                        end;
                        if l_thunderclap_and_flash_bv_0 ~= nil then
                            l_thunderclap_and_flash_bv_0.MaxForce = Vector3.new(20000, 20000, 20000, 0);
                        end;
                        if v75 == true then
                            if v19 == true then
                                task.wait(0.75);
                            else
                                task.wait(1.15);
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
            end;
            if v37 ~= nil and v37:FindFirstChild("LastUsed") ~= nil then
                v37.LastUsed.Value = l_tick_0();
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
v0.Cancel = function(v77) --[[ Line: 301 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v18 (ref), v1 (copy)
    if v77 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                _G:Initiate_C2("placement_thing", false);
                for _, v82 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v82.Name == "thunderclap_and_flash_bv" or v82.Name == "thunderclapandflashbg" then
                        v82:Destroy();
                    end;
                end;
                for _, v84 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v84.Name == "ThunderClapAndFlash" or v84.Name == "ThunderClapAndFlash2" then
                        v84:Stop();
                    end;
                end;
            end;
        end;
        if v77 ~= nil and v77:FindFirstChild("LastUsed") ~= nil then
            v77.LastUsed.Value = l_tick_0();
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