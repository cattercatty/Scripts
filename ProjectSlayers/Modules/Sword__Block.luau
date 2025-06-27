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
require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("quess3da"))[script] = function(v9) --[[ Line: 11 ]]
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
v1.start_block = function(_, _, v15) --[[ Line: 24 ]] --[[ Name: start_block ]]
    -- upvalues: v5 (ref), v2 (copy), v7 (copy), l_tick_0 (copy), l_script_FullName_0 (copy), v4 (copy)
    v5 = true;
    v2.Blocking = true;
    if game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil then
        local l_Humanoid_0 = game.Players.LocalPlayer.Character.Humanoid;
        if game.Players.LocalPlayer.Character:FindFirstChild("is_beast_katanas", true) ~= nil then
            l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Beast.Block_Idle):Play();
        else
            l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Sword.Block_Idle):Play();
        end;
    end;
    local v17 = os.clock();
    v7[v17] = l_tick_0();
    local _ = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S:FireServer("add_blocking", l_script_FullName_0, v17, v4, v15);
end;
v1.stop_block = function(_, v20) --[[ Line: 40 ]] --[[ Name: stop_block ]]
    -- upvalues: v1 (copy), v5 (ref), v2 (copy), l_tick_0 (copy), v4 (copy)
    v1.currentid = "";
    v5 = false;
    v2.Blocking = false;
    if game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil then
        local l_Humanoid_1 = game.Players.LocalPlayer.Character.Humanoid;
        for _, v23 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
            if v23.Name == "Block_Idle" then
                v23:Stop();
            end;
        end;
    end;
    if v20 ~= nil and v20:FindFirstChild("LastUsed") ~= nil then
        v20.LastUsed.Value = l_tick_0();
    end;
    local _ = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_:InvokeServer("remove_blocking", v4);
end;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
v4.ChildRemoved:Connect(function(v26) --[[ Line: 59 ]]
    -- upvalues: v5 (ref), v1 (copy)
    if v26.Name == "Blocking" and v5 == true then
        v1:stop_block();
    end;
end);
local v27 = nil;
v1.Down = function(v28) --[[ Line: 68 ]]
    -- upvalues: v27 (ref), v2 (copy), l_LocalPlayer_0 (copy), v1 (copy), v5 (ref), l_get_item_health_0 (copy)
    if v28 == nil then
        return;
    else
        local v29 = false;
        if v27 ~= nil then
            v27:Disconnect();
            v27 = nil;
        end;
        if v2:Check() == true and v28 ~= nil and v28.Parent ~= nil and v28.Parent.Parent ~= nil then
            local v30 = l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true).Parent:FindFirstChild("Id") or l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true) ~= nil and l_LocalPlayer_0.Character:FindFirstChild("CombatIsEquiped", true).Parent:FindFirstChild("Id");
            local v31 = _G.generateid();
            v1.currentid = v31;
            local l_Parent_0 = v28.Parent.Parent;
            if l_Parent_0 and l_Parent_0:IsA("Tool") then
                l_Parent_0:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 81 ]]
                    -- upvalues: v1 (ref), v31 (copy), v5 (ref)
                    if v1.currentid == v31 and v5 == true then
                        v1:stop_block();
                    end;
                end);
            end;
            if v30 ~= nil then
                v30 = v30.Value;
                if v30 then
                    local v33, _, v35 = l_get_item_health_0(v30, game.Players.LocalPlayer.Name);
                    if v35 ~= nil then
                        v27 = v35.Changed:Connect(function() --[[ Line: 95 ]]
                            -- upvalues: v35 (copy), v5 (ref), v1 (ref), v28 (copy)
                            if v35 ~= nil then
                                if v35.Value <= 0 and v5 == true then
                                    v1:stop_block(v28);
                                    return;
                                end;
                            elseif v5 == true then
                                v1:stop_block(v28);
                            end;
                        end);
                    end;
                    if v33 == true then
                        v1:start_block(v28, v30);
                        return true;
                    else
                        _G:Initiate_C2("splat");
                    end;
                end;
            end;
        end;
        return v29;
    end;
end;
v1.Up = function(v36) --[[ Line: 127 ]]
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
v1.Cancel = function(v37) --[[ Line: 136 ]]
    -- upvalues: v5 (ref), v1 (copy)
    if v37 == nil then
        return;
    else
        if v5 == true then
            v1:stop_block(v37);
        end;
        return true;
    end;
end;
return v1;