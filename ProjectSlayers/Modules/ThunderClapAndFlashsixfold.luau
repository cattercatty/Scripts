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
        return false;
    elseif l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent == nil then
        return false;
    else
        local l_Id_0 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id");
        if l_Id_0 == nil then
            return false;
        else
            l_Id_0 = l_Id_0.Value;
            if l_Id_0 == nil then
                return false;
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
                        if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(20, 27) then
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
                            v16 = true;
                            local l_CFrame_0 = l_HumanoidRootPart_0.CFrame;
                            _G:Initiate_C("thunder_clap_six_fold_eff", l_CFrame_0);
                            l_resume_0(l_create_0(function() --[[ Line: 81 ]]
                                -- upvalues: l_BodyGyro_0 (copy), l_HumanoidRootPart_0 (copy), l_RunService_0 (ref)
                                while l_BodyGyro_0 ~= nil and l_BodyGyro_0.Parent ~= nil and l_BodyGyro_0:FindFirstChild("Cancel") == nil do
                                    l_BodyGyro_0.CFrame = CFrame.new(l_HumanoidRootPart_0.Position, _G.getmousepos());
                                    l_RunService_0.RenderStepped:wait();
                                end;
                            end));
                            local v32 = l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.ThunderBreathing.ThunderClapAndFlash);
                            v32:Play();
                            l_resume_0(l_create_0(function() --[[ Line: 97 ]]
                                -- upvalues: v0 (ref), v23 (copy), v32 (copy)
                                task.wait(0.45);
                                if v0.currentid == v23 then
                                    v32:AdjustSpeed(0);
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
Lerp = function(v33, v34, v35) --[[ Line: 116 ]] --[[ Name: Lerp ]]
    return v33 + (v34 - v33) * v35;
end;
local _ = math.random;
local v37 = RaycastParams.new();
v37.FilterDescendantsInstances = {
    workspace.Map
};
v37.FilterType = Enum.RaycastFilterType.Whitelist;
v0.Up = function(v38) --[[ Line: 123 ]]
    -- upvalues: v13 (ref), v19 (ref), l_tick_0 (copy), v8 (ref), v0 (copy), v7 (copy), v16 (ref), v37 (copy), l_LocalPlayer_0 (copy), v18 (ref), v1 (copy)
    if v38 == nil then
        return true;
    else
        local v39 = _G.generateid();
        v13 = v39;
        if v19 == true then
            repeat
                task.wait();
            until l_tick_0() - v8 >= 0.21;
        else
            repeat
                task.wait();
            until l_tick_0() - v8 >= 0.45;
        end;
        if v39 ~= v13 then
            v0.Cancel(v38);
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
                        local l_CFrame_1 = l_HumanoidRootPart_1.CFrame;
                        local _ = l_CFrame_1 * CFrame.new(0, 0, -100);
                        _G:Initiate_C("ThunderNClapDeparture", l_CFrame_1);
                        local l_BodyPosition_0 = Instance.new("BodyPosition");
                        l_BodyPosition_0.MaxForce = Vector3.new(10000, 10000, 10000, 0);
                        l_BodyPosition_0.Position = l_HumanoidRootPart_1.Position;
                        l_BodyPosition_0.Parent = l_HumanoidRootPart_1;
                        l_thunderclap_and_flash_bv_0.MaxForce = Vector3.new();
                        _G.Skills_Performance(script.Name, l_tick_0(), 2);
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("create", "BoolValue", v7, {
                            Name = "thunderclapandflash_clash"
                        }, 0.3);
                        for _, v50 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                            if v50.Name == "ThunderClapAndFlash" or v50.Name == "ThunderClapAndFlash2" then
                                v50:AdjustSpeed(1);
                            end;
                        end;
                        local l_l_CFrame_1_0 = l_CFrame_1;
                        if v16 == true and l_HumanoidRootPart_1 ~= nil then
                            local l_CFrame_2 = l_HumanoidRootPart_1.CFrame;
                            local v53 = l_HumanoidRootPart_1.CFrame * CFrame.new(0, 20, 0);
                            local v54 = v53 - v53.p;
                            local l_Position_0 = l_HumanoidRootPart_1.Position;
                            local v56 = (v53.p - l_HumanoidRootPart_1.Position).Unit * 22;
                            local v57 = workspace:Raycast(l_Position_0, v56, v37);
                            if v57 ~= nil and v57.Position ~= nil then
                                v53 = CFrame.new(v57.Position) * v54;
                            end;
                            for _ = 1, 6 do
                                if l_HumanoidRootPart_1 ~= nil then
                                    local v59 = v53 * CFrame.new(math.random(-5, 5) * 10, math.random(-5, 5) * 10, math.random(-5, 5) * 10);
                                    local l_p_0 = v53.p;
                                    local v61 = (v59.p - v53.p).Unit * 60;
                                    local v62 = workspace:Raycast(l_p_0, v61, v37);
                                    local v63 = v59 - v59.p;
                                    if v62 ~= nil and v62.Position ~= nil then
                                        v59 = CFrame.new(v62.Position) * v63;
                                    end;
                                    l_HumanoidRootPart_1.CFrame = v59;
                                    l_BodyPosition_0.Position = v59.p;
                                    local l_CFrame_3 = l_HumanoidRootPart_1.CFrame;
                                    _G:Initiate_C("thunder_clap6ix_n_flash_eff", l_l_CFrame_1_0.p, l_CFrame_3.p);
                                    l_l_CFrame_1_0 = l_CFrame_3;
                                end;
                                task.wait(0.015);
                            end;
                            if l_HumanoidRootPart_1 ~= nil then
                                l_HumanoidRootPart_1.CFrame = l_CFrame_2;
                                l_BodyPosition_0.Position = l_CFrame_2.p;
                            end;
                        end;
                        if v16 == false then
                            local v65 = l_CFrame_1 * CFrame.new(0, 0, -60);
                            local l_p_1 = l_CFrame_1.p;
                            local v67 = l_CFrame_1.lookVector * 65;
                            local v68 = workspace:Raycast(l_p_1, v67, v37);
                            if v68 ~= nil and v68.Instance ~= nil then
                                local v69 = v65 - v65.p;
                                v65 = CFrame.new(v68.Position) * v69 * CFrame.new(0, 1.5, 0);
                            end;
                            l_HumanoidRootPart_1.CFrame = v65;
                            l_BodyPosition_0.Position = v65.p;
                            task.wait();
                        else
                            local v70 = l_CFrame_1 * CFrame.new(0, 0, -90);
                            local l_p_2 = l_CFrame_1.p;
                            local v72 = l_CFrame_1.lookVector * 95;
                            local v73 = workspace:Raycast(l_p_2, v72, v37);
                            if v73 ~= nil and v73.Instance ~= nil then
                                local v74 = v70 - v70.p;
                                v70 = CFrame.new(v73.Position) * v74 * CFrame.new(0, 1.5, 0);
                            end;
                            l_HumanoidRootPart_1.CFrame = v70;
                            l_BodyPosition_0.Position = v70.p;
                            task.wait();
                            if l_HumanoidRootPart_1 ~= nil then
                                local l_CFrame_4 = l_HumanoidRootPart_1.CFrame;
                                _G:Initiate_C("thunder_clap6ix_n_flash_eff", l_l_CFrame_1_0.p, l_CFrame_4.p);
                            end;
                        end;
                        local v76 = false;
                        if l_Humanoid_1 ~= nil and v7:FindFirstChild("RagDoll") == nil and v7:FindFirstChild("KnockedOut") == nil and v7:FindFirstChild("ragDoll") == nil then
                            l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                        end;
                        v76 = true;
                        local l_CFrame_5 = l_HumanoidRootPart_1.CFrame;
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("six_fold_damage", l_LocalPlayer_0.Character, l_CFrame_5, l_CFrame_1);
                        _G:Initiate_C("ThunderNClap", l_CFrame_5, l_CFrame_1);
                        if l_BodyPosition_0 ~= nil then
                            l_BodyPosition_0:Destroy();
                        end;
                        if l_thunderclap_and_flash_bv_0 ~= nil then
                            l_thunderclap_and_flash_bv_0.MaxForce = Vector3.new(20000, 20000, 20000, 0);
                        end;
                        if v76 == true then
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
            if v38 ~= nil and v38:FindFirstChild("LastUsed") ~= nil then
                v38.LastUsed.Value = l_tick_0();
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
v0.Cancel = function(v78) --[[ Line: 307 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v18 (ref), v1 (copy)
    if v78 == nil then
        return true;
    else
        v0.currentid = _G.generateid();
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                _G:Initiate_C2("placement_thing", false);
                for _, v83 in pairs(l_HumanoidRootPart_2:GetChildren()) do
                    if v83.Name == "thunderclap_and_flash_bv" or v83.Name == "thunderclapandflashbg" then
                        v83:Destroy();
                    end;
                end;
                for _, v85 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v85.Name == "ThunderClapAndFlash" or v85.Name == "ThunderClapAndFlash2" then
                        v85:Stop();
                    end;
                end;
            end;
        end;
        if v78 ~= nil and v78:FindFirstChild("LastUsed") ~= nil then
            v78.LastUsed.Value = l_tick_0();
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