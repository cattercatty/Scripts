return {
    Down = function(v0) --[[ Line: 3 ]]
        if v0 == nil then
            return;
        else
            print("Down : ", v0);
            return true;
        end;
    end, 
    Up = function(v1) --[[ Line: 15 ]]
        if v1 == nil then
            return;
        else
            print("Up : ", v1);
            return true;
        end;
    end, 
    Cancel = function(v2) --[[ Line: 28 ]]
        if v2 == nil then
            return;
        else
            print("Cancel : ", v2);
            return true;
        end;
    end
};