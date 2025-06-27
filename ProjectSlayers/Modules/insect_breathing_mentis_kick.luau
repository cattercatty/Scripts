local v0 = {
    currentid = ""
};
local v1 = require(game.ReplicatedStorage.Modules.Client.character_handler);
local _ = coroutine.resume;
local _ = coroutine.create;
local _ = game:GetService("RunService");
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
v7.ChildAdded:Connect(function(v14) --[[ Line: 16 ]]
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
v0.Down = function(v17) --[[ Line: 26 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_get_item_health_0 (copy), v0 (copy), v1 (copy), l_tick_0 (copy), v7 (copy), v8 (ref)
    if v17 == nil then
        return;
    else
        local v18 = false;
        if v17 == nil or l_LocalPlayer_0.Character == nil or l_LocalPlayer_0.Character ~= nil and l_LocalPlayer_0.Character:FindFirstChild("SwordIsEquiped", true) == nil then
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
                    v0.currentid = _G.generateid();
                    if v1:Check() == true then
                        local l_Character_0 = game.Players.LocalPlayer.Character;
                        if l_Character_0 ~= nil then
                            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                            if l_HumanoidRootPart_0 ~= nil and l_Humanoid_0 ~= nil and _G:StamBreath(10, 35) then
                                _G.Skills_Performance(script.Name, l_tick_0(), 5);
                                v18 = true;
                                if v7:FindFirstChild("moveslow") ~= nil then
                                    v7.moveslow:Destroy();
                                end;
                                local l_StringValue_0 = Instance.new("StringValue");
                                l_StringValue_0.Name = "moveslow";
                                l_StringValue_0.Parent = v7;
                                _G.Skills_Performance(script.Name, l_tick_0(), 1);
                                v1.Disabled = true;
                                v8 = l_tick_0();
                                if l_HumanoidRootPart_0:FindFirstChildOfClass("BodyVelocity") ~= nil then
                                    for _, v25 in pairs(l_HumanoidRootPart_0:GetChildren()) do
                                        if v25:IsA("BodyVelocity") then
                                            v25:Destroy();
                                        end;
                                    end;
                                end;
                                l_Humanoid_0:LoadAnimation(game.ReplicatedStorage.Animations.Moves.Insect.mentis_kick_1):Play();
                            end;
                        end;
                    end;
                    return v18;
                end;
            end;
        end;
    end;
end;
v0.Up = function(v26) --[[ Line: 77 ]]
    -- upvalues: l_tick_0 (copy), v8 (ref), v0 (copy), v12 (ref), v7 (copy), v1 (copy)
    if v26 == nil then
        return;
    else
        repeat
            wait();
        until l_tick_0() - v8 >= 0.3;
        v0.currentid = _G.generateid();
        v12 = _G.generateid();
        _G.Skills_Performance(script.Name, l_tick_0(), 4);
        local l_Character_1 = game.Players.LocalPlayer.Character;
        if l_Character_1 ~= nil then
            local l_HumanoidRootPart_1 = l_Character_1:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_1 ~= nil and l_Humanoid_1 ~= nil then
                if v7:FindFirstChild("moveslow") ~= nil then
                    v7.moveslow:Destroy();
                end;
                for _, v31 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                    if v31.Name == "mentis_kick_1" then
                        v31:Stop();
                    end;
                end;
            end;
        end;
        if v26 ~= nil and v26:FindFirstChild("LastUsed") ~= nil then
            v26.LastUsed.Value = l_tick_0();
        end;
        wait(0.3);
        v1.Disabled = false;
        return true;
    end;
end;
v0.Cancel = function(v32) --[[ Line: 116 ]]
    -- upvalues: v0 (copy), l_tick_0 (copy), v7 (copy), v1 (copy)
    if v32 == nil then
        return;
    else
        v0.currentid = _G.generateid();
        _G.Skills_Performance(script.Name, l_tick_0(), 4);
        local l_Character_2 = game.Players.LocalPlayer.Character;
        if l_Character_2 ~= nil then
            local l_HumanoidRootPart_2 = l_Character_2:FindFirstChild("HumanoidRootPart");
            local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
            if l_HumanoidRootPart_2 ~= nil and l_Humanoid_2 ~= nil then
                if v7:FindFirstChild("moveslow") ~= nil then
                    v7.moveslow:Destroy();
                end;
                for _, v37 in pairs(l_Humanoid_2:GetPlayingAnimationTracks()) do
                    if v37.Name == "mentis_kick_1" then
                        v37:Stop();
                    end;
                end;
            end;
        end;
        if v32 ~= nil and v32:FindFirstChild("LastUsed") ~= nil then
            v32.LastUsed.Value = l_tick_0();
        end;
        wait(0.3);
        v1.Disabled = false;
        return true;
    end;
end;
return v0;