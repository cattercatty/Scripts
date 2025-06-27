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
local _ = TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
local _ = game:GetService("TweenService");
local v15 = nil;
local v16 = 0;
local v17 = false;
local v18 = nil;
local v19 = {};
Clear = function(v20) --[[ Line: 27 ]] --[[ Name: Clear ]]
    -- upvalues: v17 (ref), l_LocalPlayer_0 (copy), l_tick_0 (copy), v18 (ref), v19 (ref)
    if v17 == true then
        v17 = false;
        if l_LocalPlayer_0 ~= nil and l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart") ~= nil then
            local l_Character_0 = l_LocalPlayer_0.Character;
            local l_smoke_screen_activate_value_0 = l_LocalPlayer_0.Character.HumanoidRootPart:FindFirstChild("smoke_screen_activate_value");
            if l_smoke_screen_activate_value_0 ~= nil then
                l_smoke_screen_activate_value_0:Destroy();
            end;
            _G.Skills_Performance(script.Name, l_tick_0(), 6);
            if v20 == true then
                _G:Initiate_C("SmokeScreen_sound_breathing_effect", l_Character_0, "SmokeScreenUnregister");
            else
                local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                l_Humanoid_0.Animator:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Sound.sound_breathing_smoke_Screen_explode):Play();
                _G:Initiate_C("SmokeScreen_sound_breathing_effect", l_Character_0, "ExplodeThrow", v18);
                task.delay(0.15, function() --[[ Line: 43 ]]
                    -- upvalues: l_Character_0 (copy), l_HumanoidRootPart_0 (copy), l_Humanoid_0 (copy), v18 (ref)
                    if l_Character_0 == nil or l_HumanoidRootPart_0 == nil or l_Humanoid_0 == nil then
                        return;
                    else
                        _G:Initiate_C("SmokeScreen_sound_breathing_effect", l_Character_0, "Explode", v18);
                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("sound_breathing_smoke_screen_damage", l_Character_0, v18);
                        return;
                    end;
                end);
            end;
            for _, v26 in pairs(v19) do
                v26:Destroy();
            end;
            v19 = {};
        end;
    end;
end;
game:GetService("UserInputService").InputBegan:Connect(function(v27, v28) --[[ Line: 57 ]]
    -- upvalues: v15 (ref), l_LocalPlayer_0 (copy), v17 (ref), l_tick_0 (copy), v16 (ref)
    if v28 == false and v15 ~= nil and v27.KeyCode.Name == game.ReplicatedStorage.Player_Data:FindFirstChild(l_LocalPlayer_0.Name).Keys:FindFirstChild(v15)["2"].Value and v17 == true and l_tick_0() - v16 > 0.15 then
        Clear();
    end;
end);
game.ReplicatedStorage:WaitForChild("mobile_tap_events"):WaitForChild("mobile_skill_tap").Event:Connect(function(v29) --[[ Line: 66 ]]
    -- upvalues: l_tick_0 (copy), v16 (ref)
    if v29 == "Smoke Screen" and l_tick_0() - v16 > 0.15 then
        Clear();
    end;
end);
v0.Down = function(v30) --[[ Line: 74 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v16 (ref), v7 (copy), v19 (ref), v18 (ref), v17 (ref), v15 (ref), l_resume_0 (copy), l_create_0 (copy)
    if v30 == nil then
        return;
    else
        local v31 = false;
        if v30 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent == nil then
            return;
        else
            local v32 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil then
                v32 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id");
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
                    if v1:Check() == true then
                        local l_Character_1 = game.Players.LocalPlayer.Character;
                        if l_Character_1 ~= nil then
                            local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil and l_HumanoidRootPart_1:FindFirstChild("smoke_screen_activate_value") == nil and _G:StamBreath(15, 35) == true then
                                _G:Initiate_C("SmokeScreen_sound_breathing_effect", l_Character_1, "SmokeScreenUnregister");
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                v31 = true;
                                v16 = l_tick_0();
                                local l_BoolValue_0 = Instance.new("BoolValue");
                                l_BoolValue_0.Name = "Invisible2";
                                l_BoolValue_0.Parent = v7;
                                table.insert(v19, l_BoolValue_0);
                                game.Debris:AddItem(l_BoolValue_0, 4.5);
                                local l_BoolValue_1 = Instance.new("BoolValue");
                                l_BoolValue_1.Name = "dsieapera123asd";
                                l_BoolValue_1.Parent = v7;
                                table.insert(v19, l_BoolValue_1);
                                game.Debris:AddItem(l_BoolValue_1, 4.5);
                                local l_BoolValue_2 = Instance.new("BoolValue");
                                l_BoolValue_2.Name = "obscuringcloudsinvisiblityshit123asd";
                                l_BoolValue_2.Parent = v7;
                                table.insert(v19, l_BoolValue_2);
                                game.Debris:AddItem(l_BoolValue_2, 4.5);
                                l_Humanoid_1.Animator:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Sound.sound_breathing_smoke_Screen):Play();
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.MaxForce = Vector3.new(40000, 40000, 40000, 0);
                                l_BodyVelocity_0.Velocity = Vector3.new();
                                l_BodyVelocity_0.Name = "thunderclap_and_flash_bv";
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_1;
                                v18 = l_HumanoidRootPart_1.CFrame * CFrame.new(0, -2.5, -6);
                                game.Debris:AddItem(l_BodyVelocity_0, 0.35);
                                _G:Initiate_C("SmokeScreen_sound_breathing_effect", l_Character_1, "SmokeScreenThrow", v18);
                                task.delay(0.15, function() --[[ Line: 127 ]]
                                    -- upvalues: v0 (ref), v33 (copy), l_Character_1 (copy), v18 (ref)
                                    if v0.currentid == v33 then
                                        _G:Initiate_C("SmokeScreen_sound_breathing_effect", l_Character_1, "SmokeScreen", v18);
                                    end;
                                end);
                                v17 = true;
                                v15 = v30.Equiped_Key.Value;
                                local l_BoolValue_3 = Instance.new("BoolValue");
                                l_BoolValue_3.Name = "smoke_screen_activate_value";
                                l_BoolValue_3.Parent = l_HumanoidRootPart_1;
                                game.Debris:AddItem(l_BoolValue_3, 5);
                                l_resume_0(l_create_0(function() --[[ Line: 161 ]]
                                    -- upvalues: v17 (ref)
                                    wait(4);
                                    if v17 == true then
                                        Clear(true);
                                    end;
                                end));
                                if v30 ~= nil and v30:FindFirstChild("LastUsed") ~= nil then
                                    v30.LastUsed.Value = l_tick_0();
                                end;
                            end;
                        end;
                    end;
                    return v31;
                end;
            end;
        end;
    end;
end;
v0.Up = function(_) --[[ Line: 187 ]]
    return true;
end;
v0.Cancel = function(_) --[[ Line: 191 ]]
    return true;
end;
return v0;