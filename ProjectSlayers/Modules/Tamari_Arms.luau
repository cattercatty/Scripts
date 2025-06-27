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
Clear = function() --[[ Line: 25 ]] --[[ Name: Clear ]]
    -- upvalues: v17 (ref)
    if v17 == true then
        v17 = false;
        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("Disactivate_Tamari_Arms", game.Players.LocalPlayer.Character);
    end;
end;
game:GetService("UserInputService").InputBegan:Connect(function(v18, v19) --[[ Line: 39 ]]
    -- upvalues: v15 (ref), l_LocalPlayer_0 (copy), v17 (ref), l_tick_0 (copy), v16 (ref)
    if v19 == false and v15 ~= nil and v18.KeyCode.Name == game.ReplicatedStorage.Player_Data:FindFirstChild(l_LocalPlayer_0.Name).Keys:FindFirstChild(v15)["2"].Value and v17 == true and l_tick_0() - v16 > 1 then
        Clear();
    end;
end);
local v20 = 0;
local l_Skills_Modules_Handler_0 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Server"):WaitForChild("Skills_Modules_Handler"));
game.ReplicatedStorage.Remotes:WaitForChild("skill_proof_checker").OnClientEvent:Connect(function(v22, v23) --[[ Line: 50 ]]
    -- upvalues: v20 (ref), l_Skills_Modules_Handler_0 (copy)
    if v22 == "tamarichecker" and v23 ~= v20 then
        l_Skills_Modules_Handler_0:Kick(game.Players.LocalPlayer, " tried to hack skills");
    end;
end);
v0.Down = function(v24) --[[ Line: 57 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v16 (ref), v17 (ref), v15 (ref), v20 (ref), l_resume_0 (copy), l_create_0 (copy)
    if v24 == nil then
        return;
    else
        local v25 = false;
        if v24 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) == nil then
            return;
        elseif l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent == nil then
            return;
        else
            local v26 = false;
            if l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil then
                v26 = l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
            end;
            if v26 == false then
                v26 = nil;
            end;
            if v26 == nil then
                return;
            else
                v26 = v26.Value;
                if v26 == nil then
                    return;
                elseif l_get_item_health_0(v26, game.Players.LocalPlayer.Name) ~= true then
                    return;
                else
                    v0.currentid = _G.generateid();
                    if v1:Check() == true then
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:Stamina(45) == true and l_Character_0:FindFirstChild("Tamari_Arms") == nil then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v25 = true;
                                v16 = l_tick_0();
                                v17 = true;
                                v15 = v24.Equiped_Key.Value;
                                local v30 = os.clock();
                                v20 = v30;
                                game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("Tamari_Arms_Activate", l_Character_0, v30);
                                l_resume_0(l_create_0(function() --[[ Line: 110 ]]
                                    -- upvalues: v17 (ref)
                                    wait(40);
                                    if v17 == true then
                                        Clear();
                                    end;
                                end));
                                if v24 ~= nil and v24:FindFirstChild("LastUsed") ~= nil then
                                    v24.LastUsed.Value = l_tick_0();
                                end;
                            end;
                        end;
                    end;
                    return v25;
                end;
            end;
        end;
    end;
end;
v0.Up = function(_) --[[ Line: 136 ]]
    return true;
end;
v0.Cancel = function(_) --[[ Line: 140 ]]
    return true;
end;
return v0;