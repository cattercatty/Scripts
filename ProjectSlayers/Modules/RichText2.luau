local v0 = {};
local v1 = {
    Color = "TextColor3", 
    StrokeColor = "TextStrokeColor3", 
    ImageColor = "ImageColor3"
};
v0.ColorShortcuts = {};
v0.ColorShortcuts.White = Color3.new(1, 1, 1);
v0.ColorShortcuts.Black = Color3.new(0, 0, 0);
v0.ColorShortcuts.Red = Color3.new(1, 0.4, 0.4);
v0.ColorShortcuts.Green = Color3.new(0.4, 1, 0.4);
v0.ColorShortcuts.Blue = Color3.new(0.4, 0.4, 1);
v0.ColorShortcuts.Cyan = Color3.new(0.4, 0.85, 1);
v0.ColorShortcuts.Orange = Color3.new(1, 0.5, 0.2);
v0.ColorShortcuts.Yellow = Color3.new(1, 0.9, 0.2);
v0.ImageShortcuts = {};
v0.ImageShortcuts.Eggplant = 639588687;
v0.ImageShortcuts.Thinking = 955646496;
v0.ImageShortcuts.Sad = 947900188;
v0.ImageShortcuts.Happy = 414889555;
v0.ImageShortcuts.Despicable = 711674643;
local v2 = {
    ContainerHorizontalAlignment = "Left", 
    ContainerVerticalAlignment = "Center", 
    TextYAlignment = "Bottom", 
    TextScaled = true, 
    TextScaleRelativeTo = "Frame", 
    TextScale = 0.25, 
    TextSize = 20, 
    Font = "SourceSans", 
    TextColor3 = "White", 
    TextStrokeColor3 = "Black", 
    TextTransparency = 0, 
    TextStrokeTransparency = 1, 
    BackgroundTransparency = 1, 
    BorderSizePixel = 0, 
    ImageColor3 = "White", 
    ImageTransparency = 0, 
    ImageRectOffset = "0,0", 
    ImageRectSize = "0,0", 
    AnimateStepTime = 0, 
    AnimateStepGrouping = "Letter", 
    AnimateStepFrequency = 4, 
    AnimateYield = 0, 
    AnimateStyle = "Appear", 
    AnimateStyleTime = 0.5, 
    AnimateStyleNumPeriods = 3, 
    AnimateStyleAmplitude = 0.5
};
local v24 = {
    Appear = function(v3) --[[ Line: 226 ]] --[[ Name: Appear ]]
        v3.Visible = true;
    end, 
    Fade = function(v4, v5, v6) --[[ Line: 230 ]] --[[ Name: Fade ]]
        v4.Visible = true;
        if v4:IsA("TextLabel") then
            v4.TextTransparency = 1 - v5 * (1 - v6.TextTransparency);
            return;
        else
            if v4:IsA("ImageLabel") then
                v4.ImageTransparency = 1 - v5 * (1 - v6.ImageTransparency);
            end;
            return;
        end;
    end, 
    Wiggle = function(v7, v8, v9) --[[ Line: 239 ]] --[[ Name: Wiggle ]]
        v7.Visible = true;
        local v10 = v9.InitialSize.Y.Offset * (1 - v8) * v9.AnimateStyleAmplitude;
        v7.Position = v9.InitialPosition + UDim2.new(0, 0, 0, math.sin(v8 * 3.141592653589793 * 2 * v9.AnimateStyleNumPeriods) * v10 / 2);
    end, 
    Swing = function(v11, v12, v13) --[[ Line: 245 ]] --[[ Name: Swing ]]
        v11.Visible = true;
        local v14 = 90 * (1 - v12) * v13.AnimateStyleAmplitude;
        v11.Rotation = math.sin(v12 * 3.141592653589793 * 2 * v13.AnimateStyleNumPeriods) * v14;
    end, 
    Spin = function(v15, v16, v17) --[[ Line: 251 ]] --[[ Name: Spin ]]
        v15.Visible = true;
        v15.Position = v17.InitialPosition + UDim2.new(0, v17.InitialSize.X.Offset / 2, 0, v17.InitialSize.Y.Offset / 2);
        v15.AnchorPoint = Vector2.new(0.5, 0.5);
        v15.Rotation = v16 * v17.AnimateStyleNumPeriods * 360;
    end, 
    Rainbow = function(v18, v19, v20) --[[ Line: 258 ]] --[[ Name: Rainbow ]]
        v18.Visible = true;
        local v21 = Color3.fromHSV(v19 * v20.AnimateStyleNumPeriods % 1, 1, 1);
        if v18:IsA("TextLabel") then
            local v22 = getColorFromString(v20.TextColor3);
            v18.TextColor3 = Color3.new(v21.r + v19 * (v22.r - v21.r), v21.g + v19 * (v22.g - v21.g), v21.b + v19 * (v22.b - v21.b));
            return;
        else
            local v23 = getColorFromString(v20.ImageColor3);
            v18.ImageColor3 = Color3.new(v21.r + v19 * (v23.r - v21.r), v21.g + v19 * (v23.g - v21.g), v21.b + v19 * (v23.b - v21.b));
            return;
        end;
    end
};
local l_TextService_0 = game:GetService("TextService");
local l_RunService_0 = game:GetService("RunService");
local v27 = 0;
getLayerCollector = function(v28) --[[ Line: 277 ]] --[[ Name: getLayerCollector ]]
    if not v28 then
        return nil;
    elseif v28:IsA("LayerCollector") then
        return v28;
    elseif v28 and v28.Parent then
        return getLayerCollector(v28.Parent);
    else
        return nil;
    end;
end;
shallowCopy = function(v29) --[[ Line: 289 ]] --[[ Name: shallowCopy ]]
    local v30 = {};
    for v31, v32 in pairs(v29) do
        v30[v31] = v32;
    end;
    return v30;
end;
getColorFromString = function(v33) --[[ Line: 297 ]] --[[ Name: getColorFromString ]]
    -- upvalues: v0 (copy)
    if v0.ColorShortcuts[v33] then
        return v0.ColorShortcuts[v33];
    else
        local v34, v35, v36 = v33:match("(%d+),(%d+),(%d+)");
        return Color3.new(v34 / 255, v35 / 255, v36 / 255);
    end;
end;
getVector2FromString = function(v37) --[[ Line: 306 ]] --[[ Name: getVector2FromString ]]
    local v38, v39 = v37:match("(%d+),(%d+)");
    return Vector2.new(v38, v39);
end;
setHorizontalAlignment = function(v40, v41) --[[ Line: 311 ]] --[[ Name: setHorizontalAlignment ]]
    if v41 == "Left" then
        v40.AnchorPoint = Vector2.new(0, 0);
        v40.Position = UDim2.new(0, 0, 0, 0);
        return;
    elseif v41 == "Center" then
        v40.AnchorPoint = Vector2.new(0.5, 0);
        v40.Position = UDim2.new(0.5, 0, 0, 0);
        return;
    else
        if v41 == "Right" then
            v40.AnchorPoint = Vector2.new(1, 0);
            v40.Position = UDim2.new(1, 0, 0, 0);
        end;
        return;
    end;
end;
v0.New = function(_, v43, v44, v45, v46, v47) --[[ Line: 324 ]] --[[ Name: New ]]
    -- upvalues: v1 (copy), v2 (copy), l_TextService_0 (copy), v0 (copy), v27 (ref), l_RunService_0 (copy), v24 (copy)
    for _, v49 in pairs(v43:GetChildren()) do
        v49:Destroy();
    end;
    if v46 == nil then
        v46 = true;
    end;
    local v50 = {};
    local v51 = {};
    if v47 then
        v44 = v47.Text;
        v45 = v47.StartingProperties;
    end;
    local v52 = {};
    local v53 = {};
    local v54 = {};
    local v55 = 0;
    local v56 = false;
    local l_TextLabel_0 = Instance.new("TextLabel");
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    local v59 = getLayerCollector(v43);
    l_TextLabel_0.AutoLocalize = false;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    v61 = function(v66, v67) --[[ Line: 352 ]] --[[ Name: applyMarkup ]]
        -- upvalues: v1 (ref), v51 (copy), v50 (ref), v60 (ref), v52 (copy), v2 (ref), v64 (ref)
        v66 = v1[v66] or v66;
        if v67 == "/" then
            if v51[v66] then
                v67 = v51[v66];
            else
                warn("Attempt to default <" .. v66 .. "> to value with no default");
            end;
        end;
        if tonumber(v67) then
            v67 = tonumber(v67);
        elseif v67 == "false" or v67 == "true" then
            v67 = v67 == "true";
        end;
        v50[v66] = v67;
        if not v60(v66, v67) then
            if v66 == "ContainerHorizontalAlignment" and v52[#v52] then
                setHorizontalAlignment(v52[#v52].Container, v67);
            elseif not v2[v66] then
                if v66 == "Img" then
                    v64(v67);
                else
                    return false;
                end;
            end;
        end;
        return true;
    end;
    v60 = function(v68, v69, v70) --[[ Line: 383 ]] --[[ Name: applyProperty ]]
        -- upvalues: l_TextLabel_0 (copy), l_ImageLabel_0 (copy)
        local v71 = nil;
        local v72 = false;
        local l_pairs_0 = pairs;
        local v74 = v70 and {
            v70
        } or {
            l_TextLabel_0, 
            l_ImageLabel_0
        };
        for _, v76 in l_pairs_0(v74) do
            if pcall(function() --[[ Line: 387 ]]
                -- upvalues: v71 (ref), v76 (copy), v68 (copy)
                v71 = typeof(v76[v68]);
            end) then
                if v71 == "Color3" then
                    v76[v68] = getColorFromString(v69);
                elseif v71 == "Vector2" then
                    v76[v68] = getVector2FromString(v69);
                else
                    v76[v68] = v69;
                end;
                v72 = true;
            end;
        end;
        return v72;
    end;
    for v77, v78 in pairs(v2) do
        v61(v77, v78);
        v51[v1[v77] or v77] = v50[v1[v77] or v77];
    end;
    local l_pairs_1 = pairs;
    local v80 = v45 or {};
    for v81, v82 in l_pairs_1(v80) do
        v61(v81, v82);
        v51[v1[v81] or v81] = v50[v1[v81] or v81];
    end;
    if v47 then
        v50 = v47.OverflowPickupProperties;
        for v83, v84 in pairs(v50) do
            v61(v83, v84);
        end;
    end;
    l_pairs_1 = function() --[[ Line: 420 ]] --[[ Name: getTextSize ]]
        -- upvalues: v50 (ref), v59 (copy), v43 (copy)
        if v50.TextScaled == true then
            local v85 = nil;
            if v50.TextScaleRelativeTo == "Screen" then
                v85 = v59.AbsoluteSize.Y;
            elseif v50.TextScaleRelativeTo == "Frame" then
                v85 = v43.AbsoluteSize.Y;
            end;
            return (math.min(v50.TextScale * v85, 100));
        else
            return v50.TextSize;
        end;
    end;
    v80 = 0;
    local function v92() --[[ Line: 436 ]] --[[ Name: newLine ]]
        -- upvalues: v52 (copy), v80 (ref), v46 (ref), v50 (ref), v59 (copy), v43 (copy), v56 (ref), v53 (copy), v55 (ref)
        local v86 = v52[#v52];
        if v86 then
            v80 = v80 + v86.Size.Y.Offset;
            if not v46 then
                local l_v80_0 = v80;
                local v88;
                if v50.TextScaled == true then
                    local v89 = nil;
                    if v50.TextScaleRelativeTo == "Screen" then
                        v89 = v59.AbsoluteSize.Y;
                    elseif v50.TextScaleRelativeTo == "Frame" then
                        v89 = v43.AbsoluteSize.Y;
                    end;
                    v88 = math.min(v50.TextScale * v89, 100);
                else
                    v88 = v50.TextSize;
                end;
                if l_v80_0 + v88 > v43.AbsoluteSize.Y then
                    v56 = true;
                    return;
                end;
            end;
        end;
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Name = string.format("Line%03d", #v52 + 1);
        l_Frame_0.Size = UDim2.new(0, 0, 0, 0);
        l_Frame_0.BackgroundTransparency = 1;
        local v91 = Instance.new("Frame", l_Frame_0);
        v91.Name = "Container";
        v91.Size = UDim2.new(0, 0, 0, 0);
        v91.BackgroundTransparency = 1;
        setHorizontalAlignment(v91, v50.ContainerHorizontalAlignment);
        l_Frame_0.Parent = v43;
        table.insert(v52, l_Frame_0);
        v53[#v52] = {};
        v55 = 0;
    end;
    v92();
    local function _(v93) --[[ Line: 462 ]] --[[ Name: addFrameProperties ]]
        -- upvalues: v54 (copy), v50 (ref)
        v54[v93] = shallowCopy(v50);
        v54[v93].InitialSize = v93.Size;
        v54[v93].InitialPosition = v93.Position;
        v54[v93].InitialAnchorPoint = v93.AnchorPoint;
    end;
    v62 = function(v95, v96, v97, v98) --[[ Line: 469 ]] --[[ Name: formatLabel ]]
        -- upvalues: v52 (copy), v50 (ref), v55 (ref), v43 (copy), v53 (copy), v92 (copy), v54 (copy)
        local v99 = v52[#v52];
        local v100 = tostring(v50.TextYAlignment);
        if v100 == "Top" then
            v95.Position = UDim2.new(0, v55, 0, 0);
            v95.AnchorPoint = Vector2.new(0, 0);
        elseif v100 == "Center" then
            v95.Position = UDim2.new(0, v55, 0.5, 0);
            v95.AnchorPoint = Vector2.new(0, 0.5);
        elseif v100 == "Bottom" then
            v95.Position = UDim2.new(0, v55, 1, 0);
            v95.AnchorPoint = Vector2.new(0, 1);
        end;
        v55 = v55 + v97;
        if v55 > v43.AbsoluteSize.X and v55 ~= v97 then
            v95:Destroy();
            local v101 = v53[#v52][#v53[#v52]];
            if v101:IsA("TextLabel") and v101.Text == " " then
                v99.Container.Size = UDim2.new(0, v55 - v97 - v101.Size.X.Offset, 1, 0);
                v101:Destroy();
                table.remove(v53[#v52]);
            end;
            v92();
            v98();
            return;
        else
            v95.Size = UDim2.new(0, v97, 0, v96);
            v99.Container.Size = UDim2.new(0, v55, 1, 0);
            v99.Size = UDim2.new(1, 0, 0, (math.max(v99.Size.Y.Offset, v96)));
            v95.Name = string.format("Group%03d", #v53[#v52] + 1);
            v95.Parent = v99.Container;
            table.insert(v53[#v52], v95);
            v54[v95] = shallowCopy(v50);
            v54[v95].InitialSize = v95.Size;
            v54[v95].InitialPosition = v95.Position;
            v54[v95].InitialAnchorPoint = v95.AnchorPoint;
            v50.AnimateYield = 0;
            return;
        end;
    end;
    v63 = function(v102) --[[ Line: 509 ]] --[[ Name: printText ]]
        -- upvalues: v92 (copy), v55 (ref), v50 (ref), v59 (copy), v43 (copy), l_TextService_0 (ref), l_TextLabel_0 (copy), v54 (copy), v62 (ref), v56 (ref), v63 (ref)
        if v102 == "\n" then
            v92();
            return;
        elseif v102 == " " and v55 == 0 then
            return;
        else
            local v103;
            if v50.TextScaled == true then
                local v104 = nil;
                if v50.TextScaleRelativeTo == "Screen" then
                    v104 = v59.AbsoluteSize.Y;
                elseif v50.TextScaleRelativeTo == "Frame" then
                    v104 = v43.AbsoluteSize.Y;
                end;
                v103 = math.min(v50.TextScale * v104, 100);
            else
                v103 = v50.TextSize;
            end;
            local l_X_0 = l_TextService_0:GetTextSize(v102, v103, l_TextLabel_0.Font, Vector2.new(v59.AbsoluteSize.X, v103)).X;
            local v106 = l_TextLabel_0:Clone();
            v106.TextScaled = false;
            v106.TextSize = v103;
            v106.Text = v102;
            v106.TextTransparency = 1;
            v106.TextStrokeTransparency = 1;
            v106.TextWrapped = false;
            local v107 = 0;
            local v108 = 1;
            for v109, v110 in utf8.graphemes(v102) do
                local v111 = string.sub(v102, v109, v110);
                local l_X_1 = l_TextService_0:GetTextSize(v111, v103, l_TextLabel_0.Font, Vector2.new(v59.AbsoluteSize.X, v103)).X;
                local v113 = l_TextLabel_0:Clone();
                v113.Text = v111;
                v113.TextScaled = false;
                v113.TextSize = v103;
                v113.Position = UDim2.new(0, v107, 0, 0);
                v113.Size = UDim2.new(0, l_X_1 + 1, 0, v103);
                v113.Name = string.format("Char%03d", v108);
                v113.Parent = v106;
                v113.Visible = false;
                v54[v113] = shallowCopy(v50);
                v54[v113].InitialSize = v113.Size;
                v54[v113].InitialPosition = v113.Position;
                v54[v113].InitialAnchorPoint = v113.AnchorPoint;
                v107 = v107 + l_X_1;
                v108 = v108 + 1;
            end;
            v62(v106, v103, l_X_0, function() --[[ Line: 548 ]]
                -- upvalues: v56 (ref), v63 (ref), v102 (copy)
                if not v56 then
                    v63(v102);
                end;
            end);
            return;
        end;
    end;
    v64 = function(v114) --[[ Line: 551 ]] --[[ Name: printImage ]]
        -- upvalues: v50 (ref), v59 (copy), v43 (copy), l_ImageLabel_0 (copy), v0 (ref), v62 (ref), v56 (ref), v64 (ref)
        local v115;
        if v50.TextScaled == true then
            local v116 = nil;
            if v50.TextScaleRelativeTo == "Screen" then
                v116 = v59.AbsoluteSize.Y;
            elseif v50.TextScaleRelativeTo == "Frame" then
                v116 = v43.AbsoluteSize.Y;
            end;
            v115 = math.min(v50.TextScale * v116, 100);
        else
            v115 = v50.TextSize;
        end;
        local v117 = l_ImageLabel_0:Clone();
        if v0.ImageShortcuts[v114] then
            v117.Image = typeof(v0.ImageShortcuts[v114]) == "number" and "rbxassetid://" .. v0.ImageShortcuts[v114] or v0.ImageShortcuts[v114];
        else
            v117.Image = "rbxassetid://" .. v114;
        end;
        v117.Size = UDim2.new(0, v115, 0, v115);
        v117.Visible = false;
        v62(v117, v115, v115, function() --[[ Line: 565 ]]
            -- upvalues: v56 (ref), v64 (ref), v114 (copy)
            if not v56 then
                v64(v114);
            end;
        end);
    end;
    v65 = function(v118) --[[ Line: 568 ]] --[[ Name: printSeries ]]
        -- upvalues: v61 (ref), v63 (ref)
        for _, v120 in pairs(v118) do
            local v121, v122 = string.match(v120, "<(.+)=(.+)>");
            if v121 and v122 then
                if not v61(v121, v122) then
                    warn("Could not apply markup: ", v120);
                end;
            else
                v63(v120);
            end;
        end;
    end;
    local v123 = 1;
    local v124 = #v44;
    local v125 = {};
    if v47 then
        v123 = v47.OverflowPickupIndex;
    end;
    while v123 and v123 <= v124 do
        local v126, v127 = string.find(v44, "<.->", v123);
        local v128, v129 = string.find(v44, "[ \t\n]", v123);
        local v130 = nil;
        local v131 = nil;
        local v132 = nil;
        if v126 and v127 and (not v128 or v126 < v128) then
            v130 = v126;
            v131 = v127;
        else
            v130 = v128 or v124 + 1;
            v131 = v129 or v124 + 1;
            v132 = true;
        end;
        local v133 = v123 < v130 and string.sub(v44, v123, v130 - 1) or nil;
        local v134 = v130 <= v124 and string.sub(v44, v130, v131) or nil;
        table.insert(v125, v133);
        if v132 then
            v65(v125);
            if not v56 then
                v65({
                    v134
                });
                if v56 then
                    v123 = v130;
                    break;
                else
                    v125 = {};
                end;
            else
                break;
            end;
        else
            table.insert(v125, v134);
        end;
        v123 = v131 + 1;
    end;
    if not v56 then
        v65(v125);
    end;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.HorizontalAlignment = v50.ContainerHorizontalAlignment;
    l_UIListLayout_0.VerticalAlignment = v50.ContainerVerticalAlignment;
    l_UIListLayout_0.Parent = v43;
    local v136 = 0;
    local l_X_2 = v43.AbsoluteSize.X;
    local v138 = 0;
    for _, v140 in pairs(v52) do
        v136 = v136 + v140.Size.Y.Offset;
        local l_Container_0 = v140.Container;
        local v142 = nil;
        local v143 = nil;
        if l_Container_0.AnchorPoint.X == 0 then
            v142 = l_Container_0.Position.X.Offset;
            v143 = l_Container_0.Size.X.Offset;
        elseif l_Container_0.AnchorPoint.X == 0.5 then
            v142 = v140.AbsoluteSize.X / 2 - l_Container_0.Size.X.Offset / 2;
            v143 = v140.AbsoluteSize.X / 2 + l_Container_0.Size.X.Offset / 2;
        elseif l_Container_0.AnchorPoint.X == 1 then
            v142 = v140.AbsoluteSize.X - l_Container_0.Size.X.Offset;
            v143 = v140.AbsoluteSize.X;
        end;
        l_X_2 = math.min(l_X_2, v142);
        v138 = math.max(v138, v143);
    end;
    v27 = v27 + 1;
    local v144 = false;
    local v145 = false;
    local v146 = false;
    local v147 = "TextAnimation" .. v27;
    local v148 = {};
    local function v155() --[[ Line: 666 ]] --[[ Name: updateAnimations ]]
        -- upvalues: v145 (ref), v148 (ref), v144 (ref), l_RunService_0 (ref), v147 (copy), v24 (ref)
        if v145 and #v148 == 0 or v144 then
            v144 = true;
            l_RunService_0:UnbindFromRenderStep(v147);
            v148 = {};
            return;
        else
            local v149 = tick();
            for v150 = #v148, 1, -1 do
                local v151 = v148[v150];
                local l_Settings_0 = v151.Settings;
                local v153 = v24[l_Settings_0.AnimateStyle];
                if not v153 then
                    warn("No animation style found for: ", l_Settings_0.AnimateStyle, ", defaulting to Appear");
                    v153 = v24.Appear;
                end;
                local v154 = math.min((v149 - v151.Start) / l_Settings_0.AnimateStyleTime, 1);
                v153(v151.Char, v154, l_Settings_0);
                if v154 >= 1 then
                    table.remove(v148, v150);
                end;
            end;
            return;
        end;
    end;
    local function v159(v156) --[[ Line: 692 ]] --[[ Name: setFrameToDefault ]]
        -- upvalues: v54 (copy), v60 (ref)
        v156.Position = v54[v156].InitialPosition;
        v156.Size = v54[v156].InitialSize;
        v156.AnchorPoint = v54[v156].InitialAnchorPoint;
        for v157, v158 in pairs(v54[v156]) do
            v60(v157, v158, v156);
        end;
    end;
    local function v164(v160, v161) --[[ Line: 701 ]] --[[ Name: setGroupVisible ]]
        -- upvalues: v159 (copy)
        v160.Visible = v161;
        for _, v163 in pairs(v160:GetChildren()) do
            v163.Visible = v161;
            if v161 then
                v159(v163);
            end;
        end;
        if v161 and v160:IsA("ImageLabel") then
            v159(v160);
        end;
    end;
    local function v193(v165) --[[ Line: 714 ]] --[[ Name: animate ]]
        -- upvalues: v144 (ref), l_RunService_0 (ref), v147 (copy), v155 (copy), v53 (copy), v164 (copy), v148 (ref), v146 (ref), v54 (copy), v145 (ref)
        v144 = false;
        l_RunService_0:BindToRenderStep(v147, Enum.RenderPriority.Last.Value, v155);
        local v166 = nil;
        local v167 = nil;
        local v168 = nil;
        local v169 = nil;
        for _, v171 in pairs(v53) do
            for _, v173 in pairs(v171) do
                v164(v173, false);
            end;
        end;
        local function _(v174, v175) --[[ Line: 729 ]] --[[ Name: animateCharacter ]]
            -- upvalues: v148 (ref)
            table.insert(v148, {
                Char = v174, 
                Settings = v175, 
                Start = tick()
            });
        end;
        local function _() --[[ Line: 734 ]] --[[ Name: yield ]]
            -- upvalues: v146 (ref), v169 (ref), v168 (ref), v167 (ref)
            if not v146 and v169 % v168 == 0 and v167 >= 0 then
                local v177 = v167 > 0 and v167 or nil;
                wait(v177);
            end;
        end;
        for _, v180 in pairs(v53) do
            for _, v182 in pairs(v180) do
                local v183 = v54[v182];
                if v183.AnimateStepGrouping ~= v166 or v183.AnimateStepFrequency ~= v168 then
                    v169 = 0;
                end;
                v166 = v183.AnimateStepGrouping;
                v167 = v183.AnimateStepTime;
                v168 = v183.AnimateStepFrequency;
                if v183.AnimateYield > 0 then
                    wait(v183.AnimateYield);
                end;
                if v166 == "Word" or v166 == "All" then
                    if v182:IsA("TextLabel") then
                        v182.Visible = true;
                        for _, v185 in pairs(v182:GetChildren()) do
                            local v186 = v54[v185];
                            table.insert(v148, {
                                Char = v185, 
                                Settings = v186, 
                                Start = tick()
                            });
                        end;
                    else
                        table.insert(v148, {
                            Char = v182, 
                            Settings = v183, 
                            Start = tick()
                        });
                    end;
                    if v166 == "Word" then
                        v169 = v169 + 1;
                        if not v146 and v169 % v168 == 0 and v167 >= 0 then
                            local v187 = v167 > 0 and v167 or nil;
                            wait(v187);
                        end;
                    end;
                elseif v166 == "Letter" then
                    if v182:IsA("TextLabel") then
                        v182.Visible = true;
                        local _ = v182.Text;
                        local v189 = 1;
                        while true do
                            local l_v182_FirstChild_0 = v182:FindFirstChild(string.format("Char%03d", v189));
                            if l_v182_FirstChild_0 then
                                local v191 = v54[l_v182_FirstChild_0];
                                table.insert(v148, {
                                    Char = l_v182_FirstChild_0, 
                                    Settings = v191, 
                                    Start = tick()
                                });
                                v169 = v169 + 1;
                                if not v146 and v169 % v168 == 0 and v167 >= 0 then
                                    v191 = v167 > 0 and v167 or nil;
                                    wait(v191);
                                end;
                                if v144 then
                                    return;
                                else
                                    v189 = v189 + 1;
                                end;
                            else
                                break;
                            end;
                        end;
                    else
                        table.insert(v148, {
                            Char = v182, 
                            Settings = v183, 
                            Start = tick()
                        });
                        v169 = v169 + 1;
                        if not v146 and v169 % v168 == 0 and v167 >= 0 then
                            local v192 = v167 > 0 and v167 or nil;
                            wait(v192);
                        end;
                    end;
                else
                    warn("Invalid step grouping: ", v166);
                end;
                if v144 then
                    return;
                end;
            end;
        end;
        v145 = true;
        if v165 then
            while #v148 > 0 do
                l_RunService_0.RenderStepped:Wait();
            end;
        end;
    end;
    local v194 = {
        Overflown = v56, 
        OverflowPickupIndex = v123, 
        StartingProperties = v45, 
        OverflowPickupProperties = v50, 
        Text = v44
    };
    if v47 then
        v47.NextTextObject = v194;
    end;
    v194.ContentSize = Vector2.new(v138 - l_X_2, v136);
    v194.Animate = function(v195, v196) --[[ Line: 836 ]] --[[ Name: Animate ]]
        -- upvalues: v193 (copy)
        if v196 then
            v193();
        else
            coroutine.wrap(v193)();
        end;
        if v195.NextTextObject then
            v195.NextTextObject:Animate(v196);
        end;
    end;
    v194.Show = function(v197, v198) --[[ Line: 847 ]] --[[ Name: Show ]]
        -- upvalues: v146 (ref), v144 (ref), v53 (copy), v164 (copy)
        if v198 then
            v146 = true;
        else
            v144 = true;
            for _, v200 in pairs(v53) do
                for _, v202 in pairs(v200) do
                    v164(v202, true);
                end;
            end;
        end;
        if v197.NextTextObject then
            v197.NextTextObject:Show(v198);
        end;
    end;
    v194.Hide = function(v203) --[[ Line: 863 ]] --[[ Name: Hide ]]
        -- upvalues: v144 (ref), v53 (copy), v164 (copy)
        v144 = true;
        for _, v205 in pairs(v53) do
            for _, v207 in pairs(v205) do
                v164(v207, false);
            end;
        end;
        if v203.NextTextObject then
            v203.NextTextObject:Hide();
        end;
    end;
    return v194;
end;
v0.ContinueOverflow = function(_, v209, v210) --[[ Line: 879 ]] --[[ Name: ContinueOverflow ]]
    -- upvalues: v0 (copy)
    return v0:New(v209, nil, nil, false, v210);
end;
return v0;
