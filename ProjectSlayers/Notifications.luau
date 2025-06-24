local v0 = loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/Scripts/refs/heads/main/ProjectSlayers/RichText2.luau"))();
local l_resume_0 = coroutine.resume;
local l_create_0 = coroutine.create;
cr = l_resume_0;
cc = l_create_0;
l_resume_0 = TweenInfo.new(0.55, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
l_create_0 = game:GetService("TweenService");
dothing = function(v3, v4) --[[ Line: 10 ]] --[[ Name: dothing ]]
    -- upvalues: l_create_0 (copy), l_resume_0 (copy), v0 (copy)
    if v3 ~= nil and game:GetService("Players").LocalPlayer.PlayerGui.Notification:FindFirstChild("Notifyframe") ~= nil then
        cr(cc(function() --[[ Line: 12 ]]
            -- upvalues: l_create_0 (ref), l_resume_0 (ref), v0 (ref), v3 (copy), v4 (copy)
            game:GetService("Players").LocalPlayer.PlayerGui.Notification.LocalScript.Sound:Play();
            local v5 = game:GetService("Players").LocalPlayer.PlayerGui.Notification.LocalScript.Ex:Clone();
            v5.Back.BackgroundTransparency = 1;
            l_create_0:Create(v5.Back, l_resume_0, {
                BackgroundTransparency = 0
            }):Play();
            v5.Parent = game:GetService("Players").LocalPlayer.PlayerGui.Notification.LocalScript.Parent.Notifyframe;
            v0:New(v5.Holder, v3, {
                TextScaled = true, 
                ContainerHorizontalAlignment = "Center", 
                TextStrokeTransparency = 1
            }):Animate(true);
            wait(v4 or 2);
            l_create_0:Create(v5.Holder, l_resume_0, {
                Position = UDim2.new(1, 0, 0, 0)
            }):Play();
            l_create_0:Create(v5.Back, l_resume_0, {
                BackgroundTransparency = 1
            }):Play();
            wait(0.55);
            v5:Destroy();
        end));
    end;
end;

return dothing
