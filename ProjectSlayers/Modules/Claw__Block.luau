local l_tick_0 = tick;
local v1 = {
    currentid = ""
};
local v2 = require(game.ReplicatedStorage.Modules.Client.character_handler);
local _ = game.ReplicatedStorage.Player_Data:WaitForChild(game.Players.LocalPlayer.Name);
local v4 = game.ReplicatedStorage.PlayerValues:WaitForChild(game.Players.LocalPlayer.Name);
local v5 = false;
local l_get_item_health_0 = require(game.ReplicatedStorage.Modules.Server.Server_Modules:WaitForChild("get_item_health"));
local v7 = {};
local l_script_FullName_0 = script:GetFullName();
require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("quess3da"))[script] = function(v9) --[[ Line: 12 ]]
    -- upvalues: v7 (copy), l_tick_0 (copy)
    local v10 = v7[v9] ~= nil;
    if v10 == true then
        v7[v9] = nil;
    end;
    for v11, v12 in pairs(v7) do
        if l_tick_0() - v12 >= 15 then
            v7[v11] = nil;
        end;
    end;
    return v10;
end;
v1.start_block = function(_, _, v15) --[[ Line: 25 ]] --[[ Name: start_block ]]
    -- upvalues: v5 (ref), v2 (copy), v7 (copy), l_tick_0 (copy), l_script_FullName_0 (copy), v4 (copy)
    v5 = true;
    v2.Blocking = true;
    if game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil then
        game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Claws.Block_Idle):Play();
    end;
    local v16 = os.clock();
    v7[v16] = l_tick_0();
    local _ = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("add_blocking", l_script_FullName_0, v16, v4, v15);
end;
v1.stop_block = function(_, v19) --[[ Line: 38 ]] --[[ Name: stop_block ]]
    -- upvalues: v1 (copy), v5 (ref), v2 (copy), l_tick_0 (copy), v4 (copy)
    v1.currentid = "";
    v5 = false;
    v2.Blocking = false;
    if game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil then
        local l_Humanoid_0 = game.Players.LocalPlayer.Character.Humanoid;
        for _, v22 in pairs(l_Humanoid_0:GetPlayingAnimationTracks()) do
            if v22.Name == "Block_Idle" then
                v22:Stop();
            end;
        end;
    end;
    if v19 ~= nil and v19:FindFirstChild("LastUsed") ~= nil then
        v19.LastUsed.Value = l_tick_0();
    end;
    local _ = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("remove_blocking", v4);
end;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
v4.ChildRemoved:Connect(function(v25) --[[ Line: 57 ]]
    -- upvalues: v5 (ref), v1 (copy)
    if v25.Name == "Blocking" and v5 == true then
        v1:stop_block();
    end;
end);
local v26 = nil;
v1.Down = function(v27) --[[ Line: 66 ]]
    -- upvalues: v26 (ref), v2 (copy), l_LocalPlayer_0 (copy), v1 (copy), v5 (ref), l_get_item_health_0 (copy)
    if v27 == nil then
        return;
    else
        local v28 = false;
        if v26 ~= nil then
            v26:Disconnect();
            v26 = nil;
        end;
        if v2:Check() == true and v27 ~= nil and v27.Parent ~= nil and v27.Parent.Parent ~= nil then
            local v29 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id") or l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id") or l_LocalPlayer_0.Character:FindFirstChild("ClawsIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("ClawsIsEquiped", true).Parent:FindFirstChild("Id");
            local v30 = _G.generateid();
            v1.currentid = v30;
            local l_Parent_0 = v27.Parent.Parent;
            if l_Parent_0 and l_Parent_0:IsA("Tool") then
                l_Parent_0:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 79 ]]
                    -- upvalues: v1 (ref), v30 (copy), v5 (ref)
                    if v1.currentid == v30 and v5 == true then
                        v1:stop_block();
                    end;
                end);
            end;
            if v29 ~= nil then
                v29 = v29.Value;
                if v29 then
                    local v32, _, v34 = l_get_item_health_0(v29, game.Players.LocalPlayer.Name);
                    if v34 ~= nil then
                        v26 = v34.Changed:Connect(function() --[[ Line: 93 ]]
                            -- upvalues: v34 (copy), v5 (ref), v1 (ref), v27 (copy)
                            if v34 ~= nil then
                                if v34.Value <= 0 and v5 == true then
                                    v1:stop_block(v27);
                                    return;
                                end;
                            elseif v5 == true then
                                v1:stop_block(v27);
                            end;
                        end);
                    end;
                    if v32 == true then
                        v1:start_block(v27, v29);
                        return true;
                    else
                        _G:Initiate_C2("splat");
                    end;
                end;
            end;
        end;
        return v28;
    end;
end;
v1.Up = function(v35) --[[ Line: 125 ]]
    -- upvalues: v5 (ref), v1 (copy)
    if v35 == nil then
        return;
    else
        if v5 == true then
            v1:stop_block(v35);
        end;
        return true;
    end;
end;
v1.Cancel = function(v36) --[[ Line: 134 ]]
    -- upvalues: v5 (ref), v1 (copy)
    if v36 == nil then
        return;
    else
        if v5 == true then
            v1:stop_block(v36);
        end;
        return true;
    end;
end;
return v1;