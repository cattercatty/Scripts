local l_tick_0 = tick;
local v1 = {
    currentid = ""
};
local v2 = require(game.ReplicatedStorage.Modules.Client.character_handler);
local _ = game.ReplicatedStorage.Player_Data:WaitForChild(game.Players.LocalPlayer.Name);
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v5 = {};
local _ = TweenInfo.new(3, Enum.EasingStyle.Back, Enum.EasingDirection.In, -1, true, 0);
local _ = game:GetService("TweenService");
v1.Down = function(v8) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), v1 (copy), l_LocalPlayer_0 (copy)
    if v8 == nil then
        return;
    else
        local v9 = false;
        if v2:Check() == true and v2.Swimming == false and v8 ~= nil and v8.Parent ~= nil and v8.Parent.Parent ~= nil then
            v1.currentid = _G.generateid();
            v2.Breathing = true;
            if l_LocalPlayer_0.Character ~= nil then
                local v10 = l_LocalPlayer_0.Character:FindFirstChild("Humanoid"):LoadAnimation(game.ReplicatedStorage.Animations.Extras.Breathing_aniamtion_generate);
                v10.Priority = Enum.AnimationPriority.Idle;
                v10:Play();
                v10.KeyframeReached:Connect(function(v11) --[[ Line: 35 ]]
                    -- upvalues: l_LocalPlayer_0 (ref)
                    if v11 == "In" or v11 == "Out" then
                        local l_Head_0 = l_LocalPlayer_0.Character:FindFirstChild("Head");
                        if l_Head_0 ~= nil then
                            local l_FakeHead_0 = l_Head_0:FindFirstChild("FakeHead");
                            if l_FakeHead_0 ~= nil then
                                local l_Mouth_0 = l_FakeHead_0:FindFirstChild("Mouth");
                                if l_Mouth_0 ~= nil and l_Mouth_0:FindFirstChild("InitialValue") ~= nil then
                                    _G:Initiate_C("mouthanim", v11, l_Mouth_0.InitialValue);
                                end;
                            end;
                        end;
                    end;
                end);
            end;
            v9 = true;
        end;
        return v9;
    end;
end;
v1.Up = function(v15) --[[ Line: 62 ]]
    -- upvalues: v2 (copy), l_tick_0 (copy), l_LocalPlayer_0 (copy), v5 (copy)
    if v15 == nil then
        return;
    else
        v2.Breathing = false;
        if v15 ~= nil and v15:FindFirstChild("LastUsed") ~= nil then
            v15.LastUsed.Value = l_tick_0();
        end;
        if l_LocalPlayer_0 ~= nil and l_LocalPlayer_0.Character ~= nil then
            local l_Humanoid_0 = l_LocalPlayer_0.Character:FindFirstChild("Humanoid");
            for _, v18 in pairs(l_Humanoid_0:GetPlayingAnimationTracks()) do
                if v18.Name == "Breathing_aniamtion_generate" then
                    v18:Stop();
                end;
            end;
        end;
        for _, v20 in pairs(v5) do
            v20:Cancel();
        end;
        return true;
    end;
end;
v1.Cancel = function(v21) --[[ Line: 82 ]]
    -- upvalues: v2 (copy), l_tick_0 (copy), l_LocalPlayer_0 (copy), v5 (copy)
    if v21 == nil then
        return;
    else
        v2.Breathing = false;
        if v21 ~= nil and v21:FindFirstChild("LastUsed") ~= nil then
            v21.LastUsed.Value = l_tick_0();
        end;
        if l_LocalPlayer_0 ~= nil and l_LocalPlayer_0.Character ~= nil then
            local l_Humanoid_1 = l_LocalPlayer_0.Character:FindFirstChild("Humanoid");
            for _, v24 in pairs(l_Humanoid_1:GetPlayingAnimationTracks()) do
                if v24.Name == "Breathing_aniamtion_generate" then
                    v24:Stop();
                end;
            end;
        end;
        for _, v26 in pairs(v5) do
            v26:Cancel();
        end;
        return true;
    end;
end;
return v1;