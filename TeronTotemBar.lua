MAX_PARTY_MEMBERS = 5;
MAX_RAID_MEMBERS = 40;
EMPTY_ICON = "Interface\\Buttons\\UI-GroupLoot-Pass-Up"

--default values for the totem bar
TTB_currentEarthTotemIndex = 1
TTB_currentFireTotemIndex = 1
TTB_currentWaterTotemIndex = 1
TTB_currentAirTotemIndex = 1
TTB_elementOrder = {"Earth", "Fire", "Water", "Air"}
TTB_nextElementIndex = 1
TTB_Self_Header_TextFrame = nil;
TTB_general_offset = -10;

--default values for the totem bar
TeronTotemBar_Options = {
    Earth = { 
        max = 6, 
        shown = 1 
    }, -- was 5
    Fire = { 
        max = 6, 
        shown = 1 
    }, -- was 5
    Water = { 
        max = 6, 
        shown = 1 
    }, -- was 5
    Air = { 
        max = 8, 
        shown = 1 
    }, -- was 7
    Tot_Rec = {
        max = 1,
        shown = 1,
    },
    Order = {
        first = "Earth",
        second = "Fire",
        third = "Water",
        fourth = "Air",
        number_of_totems = 4,
        fifth = "Totemic_Recall",
    },
    SavedTotemIndexes = {
        Earth = nil,
        Fire = nil,
        Water = nil,
        Air = nil,
    },
    Frame_Icons_Options = {
        general_offset = 0,
        offset_x = 50,
        offset_y = 50,

    },
    BuffBar_Button_Handlers_Options = {
        number_of_buttons = 5,
        number_of_paddings = 6,
        button_width = 100,
        button_height = 40,
        offset_x = 5,
    },
    -- Frame options
    Assignment_Frame_Lock = false,
    BuffBar_Frame_Lock = false,
    TeronTotemBar_DebugMode = false,
    TeronTotemFrameHidden = true,
    TeronTotemBarOrientation = false, -- false = horizontal, true = vertical (still in development)
}

local Totem_Types = {"Earth", "Fire", "Water", "Air", "Totemic_Recall"};

--Tables containing the totem data for each element
local Earth_Totems = {
    { 
        button = "TeronTotemBar_Earth_Totem_Empty", 
        name = nil, icon = EMPTY_ICON, 
        duration = 0, 
        cooldown = 0, 
        buff = false 
    },
    {
        button = "TeronTotemBar_Earth_Totem_1",
        name = "Stoneskin Totem",
        icon = "Interface\\Icons\\Spell_Nature_StoneSkinTotem",
        duration = 120,
        cooldown = 0,
        buff = true,
    },
    {
        button = "TeronTotemBar_Earth_Totem_2",
        name = "Earthbind Totem",
        icon = "Interface\\Icons\\Spell_Nature_StrengthOfEarthTotem02",
        duration = 45,
        cooldown = 15,
        buff = false,
    },
    {
        button = "TeronTotemBar_Earth_Totem_3",
        name = "Stoneclaw Totem",
        icon = "Interface\\Icons\\Spell_Nature_StoneClawTotem",
        duration = 15,
        cooldown = 30,
        buff = false,
    },
    {
        button = "TeronTotemBar_Earth_Totem_4",
        name = "Strength of Earth Totem",
        icon = "Interface\\Icons\\Spell_Nature_EarthBindTotem",
        duration = 120,
        cooldown = 0,
        buff = true,
    },
    {
        button = "TeronTotemBar_Earth_Totem_5",
        name = "Tremor Totem",
        icon = "Interface\\Icons\\Spell_Nature_TremorTotem",
        duration = 120,
        cooldown = 0,
        buff = false,
    }
};
local Fire_Totems = {
    { 
        button = "TeronTotemBar_Fire_Totem_Empty", 
        name = nil, icon = EMPTY_ICON, 
        duration = 0, 
        cooldown = 0, 
        buff = false 
    },
    {
        button = "TeronTotemBar_Fire_Totem_1",
        name = "Flametongue Totem",
        icon = "Interface\\Icons\\Spell_Nature_GuardianWard",
        duration = 120,
        cooldown = 0,
        buff = true,
    },
    {
        button = "TeronTotemBar_Fire_Totem_2",
        name = "Magma Totem",
        icon = "Interface\\Icons\\Spell_Fire_SelfDestruct",
        duration = 20,
        cooldown = 0,
        buff = false,
    },
    {
        button = "TeronTotemBar_Fire_Totem_3",
        name = "Searing Totem",
        icon = "Interface\\Icons\\Spell_Fire_SearingTotem",
        duration = 55,
        cooldown = 0,
        buff = false,
    },
    {
        button = "TeronTotemBar_Fire_Totem_4",
        name = "Fire Nova Totem",
        icon = "Interface\\Icons\\Spell_Fire_SealOfFire",
        duration = 5,
        cooldown = 15,
        buff = false,
    },
    {
        button = "TeronTotemBar_Fire_Totem_5",
        name = "Frost Resistance Totem",
        icon = "Interface\\Icons\\Spell_FrostResistanceTotem_01",
        duration = 120,
        cooldown = 0,
        buff = true,
    }
};
local Water_Totems = {
    { 
        button = "TeronTotemBar_Water_Totem_Empty", 
        name = nil, 
        icon = EMPTY_ICON, 
        duration = 0, 
        cooldown = 0, 
        buff = false 
    },
    {
        button = "TeronTotemBar_Water_Totem_1",
        name = "Healing Stream Totem",
        icon = "Interface\\Icons\\INV_Spear_04",
        duration = 60,
        cooldown = 0,
        buff = true,
    },
    {
        button = "TeronTotemBar_Water_Totem_2",
        name = "Mana Spring Totem",
        icon = "Interface\\Icons\\Spell_Nature_ManaRegenTotem",
        duration = 60,
        cooldown = 0,
        buff = true,
    },
    {
        button = "TeronTotemBar_Water_Totem_3",
        name = "Poison Cleansing Totem",
        icon = "Interface\\Icons\\Spell_Nature_PoisonCleansingTotem",
        duration = 120,
        cooldown = 0,
        buff = false,
    },
    {
        button = "TeronTotemBar_Water_Totem_4",
        name = "Disease Cleansing Totem",
        icon = "Interface\\Icons\\Spell_Nature_DiseaseCleansingTotem",
        duration = 120,
        cooldown = 0,
        buff = false,
    },
    {
        button = "TeronTotemBar_Water_Totem_5",
        name = "Fire Resistance Totem",
        icon = "Interface\\Icons\\Spell_FireResistanceTotem_01",
        duration = 120,
        cooldown = 0,
        buff = true,
    },
};
local Air_Totems = {
    { 
        button = "TeronTotemBar_Air_Totem_Empty", 
        name = nil, 
        icon = EMPTY_ICON, 
        duration = 0, 
        cooldown = 0, 
        buff = false 
    },
    {
        button = "TeronTotemBar_Air_Totem_1",
        name = "Windfury Totem",
        icon = "Interface\\Icons\\Spell_Nature_Windfury",
        duration = 120,
        cooldown = 0,
        buff = true,
    },
    {
        button = "TeronTotemBar_Air_Totem_2",
        name = "Grace of Air Totem",
        icon = "Interface\\Icons\\Spell_Nature_InvisibilityTotem",
        duration = 120,
        cooldown = 0,
        buff = true,
    },
    {
        button = "TeronTotemBar_Air_Totem_3",
        name = "Grounding Totem",
        icon = "Interface\\Icons\\Spell_Nature_GroundingTotem",
        duration = 45,
        cooldown = 13,
        buff = true,
    },
    {
        button = "TeronTotemBar_Air_Totem_4",
        name = "Windwall Totem",
        icon = "Interface\\Icons\\Spell_Nature_EarthBind",
        duration = 120,
        cooldown = 0,
        buff = true,
    },
    {
        button = "TeronTotemBar_Air_Totem_5",
        name = "Nature Resistance Totem",
        icon = "Interface\\Icons\\Spell_Nature_NatureResistanceTotem",
        duration = 120,
        cooldown = 0,
        buff = true,
    },
    {
        button = "TeronTotemBar_Air_Totem_6",
        name = "Sentry Totem",
        icon = "Interface\\Icons\\Spell_Nature_SentryTotem",
        duration = 300,
        cooldown = 0,
        buff = true,
    },
    {
        button = "TeronTotemBar_Air_Totem_7",
        name = "Tranquil Air Totem",
        icon = "Interface\\Icons\\Spell_Nature_TranquilAirTotem",
        duration = 120,
        cooldown = 0,
        buff = true,
    },
};
local recall_Totems = {
    {
        button = "TeronTotemBar_Totemic_Recall",
        name = "Totemic Recall",
        icon = "Interface\\Icons\\Spell_Shaman_TotemRecall",
        duration = 0,
        cooldown = 6,
        buff = false,
    },
};

--MAIN FRAME (assignment frame)

--create the  main frame for assigning totems
TeronTotemFrame = CreateFrame("Frame", "TeronTotemBar", UIParent);
TeronTotemFrame:SetWidth(350);
TeronTotemFrame:SetHeight(60);
TeronTotemFrame:SetFrameStrata("DIALOG");
TeronTotemFrame:SetPoint("CENTER", 0, 0);
--TeronTotemFrame:SetClampedToScreen(true);
TeronTotemFrame:EnableMouseWheel(true);
TeronTotemFrame:EnableMouse(true);
TeronTotemFrame:SetMovable(true);
--events for assignment frame
TeronTotemFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
TeronTotemFrame:RegisterEvent("PARTY_MEMBERS_CHANGED");
TeronTotemFrame:RegisterEvent("ADDON_LOADED");
TeronTotemFrame:SetScript("OnEvent", function()
    TeronTotemFrame_OnEvent();
end);
--register for dragging
TeronTotemFrame:RegisterForDrag("LeftButton");
TeronTotemFrame:SetScript("OnMouseDown", function()
    if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
        print("ASSIGNMENT FRAME - MOUSE DOWN");
    end
    if arg1 == "LeftButton" and TeronTotemBar_Options.Assignment_Frame_Lock == false then
        TeronTotemFrame_MouseDown();
    end
end);
TeronTotemFrame:SetScript("OnMouseUp", function()
    if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
        print("ASSIGNMENT FRAME - MOUSE UP");
    end
    if arg1 == "LeftButton" and TeronTotemBar_Options.Assignment_Frame_Lock == false then
        TeronTotemFrame_MouseUp();
    end
end);

--ASSIGNMENT FRAME

--create the totem buff bar frame
TeronTotemBuffBarFrame = CreateFrame("Frame", "TeronTotemBuffBar", UIParent);
TeronTotemBuffBarFrame:SetHeight(50);
-- 6 buttons, 5px padding, 100px width per button
TeronTotemBuffBarFrame:SetWidth((TeronTotemBar_Options.BuffBar_Button_Handlers_Options.number_of_paddings * TeronTotemBar_Options.BuffBar_Button_Handlers_Options.offset_x) + (TeronTotemBar_Options.BuffBar_Button_Handlers_Options.number_of_buttons * TeronTotemBar_Options.BuffBar_Button_Handlers_Options.button_width)); 
TeronTotemBuffBarFrame:SetPoint("CENTER", 0, 100);
TeronTotemBuffBarFrame:EnableMouse(true);
TeronTotemBuffBarFrame:SetMovable(true);
--events for buff bar
TeronTotemBuffBarFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
TeronTotemBuffBarFrame:RegisterEvent("ADDON_LOADED");
TeronTotemBuffBarFrame:SetScript("OnEvent", function()
    TeronTotemBuffBarFrame_OnEvent();
end);
--register for dragging
TeronTotemBuffBarFrame:RegisterForDrag("LeftButton");
TeronTotemBuffBarFrame:SetScript("OnMouseDown", function()
    if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
        print("BUFF BAR FRAME - MOUSE DOWN");
    end
    if arg1 == "LeftButton" and TeronTotemBar_Options.BuffBar_Frame_Lock == false then
        TeronTotemBuffBar_MouseDown();
    end
end);
TeronTotemBuffBarFrame:SetScript("OnMouseUp", function()
    if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
        print("BUFF BAR FRAME - MOUSE UP");
    end
    if arg1 == "LeftButton" and TeronTotemBar_Options.BuffBar_Frame_Lock == false then
        TeronTotemBuffBar_MouseUp();
    end
end);
TeronTotemBuffBarFrame:SetScript("OnUpdate", function()
    TeronTotemBuffBar_OnUpdate();
end);

--FUNCTION TO INITIALIZE THE CONFIGURATION

--if the SavedVariables table is not created (or contains old data), create it (overwrite it)
function InitConfig()
    if TeronTotemBar_Options.Earth.max == nil then
        TeronTotemBar_Options.Earth.max = 6;
    end
    if TeronTotemBar_Options.Earth.shown == nil then
        TeronTotemBar_Options.Earth.shown = 1;
    end
    if TeronTotemBar_Options.Fire.max == nil then
        TeronTotemBar_Options.Fire.max = 6;
    end
    if TeronTotemBar_Options.Fire.shown == nil then
        TeronTotemBar_Options.Fire.shown = 1;
    end
    if TeronTotemBar_Options.Water.max == nil then
        TeronTotemBar_Options.Water.max = 6;
    end
    if TeronTotemBar_Options.Water.shown == nil then
        TeronTotemBar_Options.Water.shown = 1;
    end
    if TeronTotemBar_Options.Air.max == nil then
        TeronTotemBar_Options.Air.max = 8;
    end
    if TeronTotemBar_Options.Air.shown == nil then
        TeronTotemBar_Options.Air.shown = 1;
    end
    if TeronTotemBar_Options.Tot_Rec.max == nil then
        TeronTotemBar_Options.Tot_Rec.max = 1;
    end
    if TeronTotemBar_Options.Tot_Rec.shown == nil then
        TeronTotemBar_Options.Tot_Rec.shown = 1;
    end
    if TeronTotemBar_Options.Order.first == nil then
        TeronTotemBar_Options.Order.first = "Earth";
    end
    if TeronTotemBar_Options.Order.second == nil then
        TeronTotemBar_Options.Order.second = "Fire";
    end
    if TeronTotemBar_Options.Order.third == nil then
        TeronTotemBar_Options.Order.third = "Water";
    end
    if TeronTotemBar_Options.Order.fourth == nil then
        TeronTotemBar_Options.Order.fourth = "Air";
    end
    if TeronTotemBar_Options.Order.fifth == nil then
        TeronTotemBar_Options.Order.fifth = "Totemic_Recall";
    end
    if TeronTotemBar_Options.Order.number_of_totems == nil then
        TeronTotemBar_Options.Order.number_of_totems = 4;
    end
    if TeronTotemBar_Options.SavedTotemIndexes == nil then
        TeronTotemBar_Options.SavedTotemIndexes = {
            Earth = 1,
            Fire = 1,
            Water = 1,
            Air = 1,
        }
    end
    if TeronTotemBar_Options.Frame_Icons_Options == nil then
        TeronTotemBar_Options.Frame_Icons_Options = {
            general_offset = 0,
            offset_x = 50,
            offset_y = 50,
        }
    end
    if TeronTotemBar_Options.BuffBar_Button_Handlers_Options == nil then
        TeronTotemBar_Options.BuffBar_Button_Handlers_Options = {
            number_of_buttons = 5,
            number_of_paddings = 6,
            button_width = 100,
            button_height = 40,
            offset_x = 5,
        }
    end
    if TeronTotemBar_Saved == nil then
        TeronTotemBar_Saved = {
            Earth = {},
            Fire = {},
            Water = {},
            Air = {},
        }
    end
    if TeronTotemBar_Options.TeronTotemBar_DebugMode == nil then
        TeronTotemBar_Options.TeronTotemBar_DebugMode = false;
    end
    if TeronTotemBar_Options.TeronTotemFrameHidden == nil then
        TeronTotemBar_Options.TeronTotemFrameHidden = true;
    end
end

--END OF CONFIGURATION

-- This will be your SavedVariables table
TeronTotemBar_Saved = TeronTotemBar_Saved or {} 

--Creates headers for each element
function CreateTotemHeaderButtons()
    local offset_x = 50;
    local offset_y = 60;
    local button_size = 40;
    local anchor = "CENTER";

    --Earth Header
    EarthHeader = CreateFrame("Button", "TeronTotemBar_Earth_Header", TeronTotemFrame);
    EarthHeader:SetWidth(button_size);
    EarthHeader:SetHeight(button_size);
    EarthHeader:SetPoint(anchor, TTB_general_offset, TeronTotemBar_Options.Frame_Icons_Options.offset_y);
    EarthHeader:SetNormalTexture("Interface\\Icons\\Spell_Nature_EarthShock");

    --Fire Header
    FireHeader = CreateFrame("Button", "TeronTotemBar_Fire_Header", TeronTotemFrame);
    FireHeader:SetWidth(button_size);
    FireHeader:SetHeight(button_size);
    FireHeader:SetPoint(anchor, EarthHeader , TeronTotemBar_Options.Frame_Icons_Options.offset_x, 0);
    FireHeader:SetNormalTexture("Interface\\Icons\\Spell_Fire_FlameShock");

    --Water Header
    WaterHeader = CreateFrame("Button", "TeronTotemBar_Water_Header", TeronTotemFrame);
    WaterHeader:SetWidth(button_size);
    WaterHeader:SetHeight(button_size);
    WaterHeader:SetPoint(anchor, FireHeader, TeronTotemBar_Options.Frame_Icons_Options.offset_x, 0);
    WaterHeader:SetNormalTexture("Interface\\Icons\\Spell_Frost_FrostShock");

    --Air Header
    AirHeader = CreateFrame("Button", "TeronTotemBar_Air_Header", TeronTotemFrame);
    AirHeader:SetWidth(button_size);
    AirHeader:SetHeight(button_size);
    AirHeader:SetPoint(anchor, WaterHeader, TeronTotemBar_Options.Frame_Icons_Options.offset_x, 0);
    AirHeader:SetNormalTexture("Interface\\Icons\\Spell_Nature_Cyclone");

end

function Create_Player_Names()

    
end

--create player headers
function CreatePlayerHeaders()
    TTB_Self_Header_TextFrame = TeronTotemFrame:CreateFontString("TeronTotemBar_Self_Header_TextFrame", "BACKGROUND");
    TTB_Self_Header_TextFrame:SetPoint("LEFT", 10, 0);
    TTB_Self_Header_TextFrame:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
    TTB_Self_Header_TextFrame:SetText(UnitName("player"));

end

--function to create the buttons for each element
function CreateElementButtons()
    local buttton_size = 40;
    local offset_x = 50;
    local offset_y = 50;
    local anchor = "CENTER";

    --Earth Button
    EarthButton = CreateFrame("Button", "TeronTotemBar_Earth_Button", TeronTotemFrame);
    EarthButton:SetWidth(buttton_size);
    EarthButton:SetHeight(buttton_size);
    EarthButton:SetPoint(anchor, TTB_general_offset, 0);
    EarthButton:SetNormalTexture(Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].icon);
    EarthButton:EnableMouseWheel(true);
    EarthButton:SetScript("OnMouseWheel", function()
--        TeronTotemBar_Options.SavedTotemIndexes.Earth = TTB_currentEarthTotemIndex;
        --mouse scroll event for earth totems
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM EARTH TOTEM DELTA: " .. arg1);
        end
        if arg1 > 0 then 
            TeronTotemBar_Options.SavedTotemIndexes.Earth = TeronTotemBar_Options.SavedTotemIndexes.Earth + 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Earth > TeronTotemBar_Options.Earth.max + 1 then
                TeronTotemBar_Options.SavedTotemIndexes.Earth = 1;
            end
        elseif arg1 < 0 then
            TeronTotemBar_Options.SavedTotemIndexes.Earth = TeronTotemBar_Options.SavedTotemIndexes.Earth - 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Earth < 1 then
                TeronTotemBar_Options.SavedTotemIndexes.Earth = TeronTotemBar_Options.Earth.max + 1;
            end
        end
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM EARTH TOTEM INDEX: " .. TeronTotemBar_Options.SavedTotemIndexes.Earth);
        end
        UpdateEarthButtonIcon();
    end);

    --Fire Button
    FireButton = CreateFrame("Button", "TeronTotemBar_Fire_Button", TeronTotemFrame);
    FireButton:SetWidth(buttton_size);
    FireButton:SetHeight(buttton_size);
    FireButton:SetPoint(anchor, EarthButton, TeronTotemBar_Options.Frame_Icons_Options.offset_x, 0);
    FireButton:SetNormalTexture(Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].icon);
    FireButton:EnableMouseWheel(true);
    FireButton:SetScript("OnMouseWheel", function()
--        TeronTotemBar_Options.SavedTotemIndexes.Fire = TTB_currentFireTotemIndex;
        --mouse scroll event for fire totems
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM FIRE TOTEM DELTA: " .. arg1);
        end
        if arg1 > 0 then
            TeronTotemBar_Options.SavedTotemIndexes.Fire = TeronTotemBar_Options.SavedTotemIndexes.Fire + 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Fire > TeronTotemBar_Options.Fire.max + 1 then
                TeronTotemBar_Options.SavedTotemIndexes.Fire = 1;
            end
        elseif arg1 < 0 then
            TeronTotemBar_Options.SavedTotemIndexes.Fire = TeronTotemBar_Options.SavedTotemIndexes.Fire - 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Fire < 1 then
                TeronTotemBar_Options.SavedTotemIndexes.Fire = TeronTotemBar_Options.Fire.max + 1;
            end
        end
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM FIRE TOTEM INDEX: " .. TeronTotemBar_Options.SavedTotemIndexes.Fire);
        end
        UpdateFireButtonIcon();
    end);

    --Water Button
    WaterButton = CreateFrame("Button", "TeronTotemBar_Water_Button", TeronTotemFrame);
    WaterButton:SetWidth(buttton_size);
    WaterButton:SetHeight(buttton_size);
    WaterButton:SetPoint(anchor, FireButton, TeronTotemBar_Options.Frame_Icons_Options.offset_x, 0);
    WaterButton:SetNormalTexture(Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].icon);
    WaterButton:EnableMouseWheel(true);
    WaterButton:SetScript("OnMouseWheel", function()
--        TeronTotemBar_Options.SavedTotemIndexes.Water = TTB_currentWaterTotemIndex;
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM WATER TOTEM DELTA: " .. arg1);
        end
        if arg1 > 0 then
            TeronTotemBar_Options.SavedTotemIndexes.Water = TeronTotemBar_Options.SavedTotemIndexes.Water + 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Water > TeronTotemBar_Options.Water.max + 1 then
                TeronTotemBar_Options.SavedTotemIndexes.Water = 1;
            end
        elseif arg1 < 0 then
            TeronTotemBar_Options.SavedTotemIndexes.Water = TeronTotemBar_Options.SavedTotemIndexes.Water - 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Water < 1 then
                TeronTotemBar_Options.SavedTotemIndexes.Water = TeronTotemBar_Options.Water.max + 1;
            end
        end
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM WATER TOTEM INDEX: " .. TeronTotemBar_Options.SavedTotemIndexes.Water);
        end
        UpdateWaterButtonIcon();
    end);

    --Air Button
    AirButton = CreateFrame("Button", "TeronTotemBar_Air_Button", TeronTotemFrame);
    AirButton:SetWidth(buttton_size);
    AirButton:SetHeight(buttton_size);
    AirButton:SetPoint(anchor, WaterButton, TeronTotemBar_Options.Frame_Icons_Options.offset_x, 0);
    AirButton:SetNormalTexture(Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].icon);
    AirButton:EnableMouseWheel(true);
    AirButton:SetScript("OnMouseWheel", function()
--        TeronTotemBar_Options.SavedTotemIndexes.Air = TTB_currentAirTotemIndex;
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM AIR TOTEM DELTA: " .. arg1);
        end
        if arg1 > 0 then
            TeronTotemBar_Options.SavedTotemIndexes.Air = TeronTotemBar_Options.SavedTotemIndexes.Air + 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Air > TeronTotemBar_Options.Air.max + 1 then
                TeronTotemBar_Options.SavedTotemIndexes.Air = 1;
            end
        elseif arg1 < 0 then
            TeronTotemBar_Options.SavedTotemIndexes.Air = TeronTotemBar_Options.SavedTotemIndexes.Air - 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Air < 1 then
                TeronTotemBar_Options.SavedTotemIndexes.Air = TeronTotemBar_Options.Air.max + 1;
            end
        end
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM AIR TOTEM INDEX: " .. TeronTotemBar_Options.SavedTotemIndexes.Air);
        end
        UpdateAirButtonIcon();
    end);
    
end

--new function
--creates the button holders for each element buff button on the personal buff bar
function CreateBuffButtonHolders()
    local button_height = 40;

    --Earth Buff Button Holder
    EarthBuffButtonHolder = CreateFrame("Button", "TeronTotemBuffBar_Earth_ButtonHolder", TeronTotemBuffBarFrame);
    EarthBuffButtonHolder:SetWidth(TeronTotemBar_Options.BuffBar_Button_Handlers_Options.button_width);
    EarthBuffButtonHolder:SetHeight(TeronTotemBar_Options.BuffBar_Button_Handlers_Options.button_height);
    EarthBuffButtonHolder:SetPoint("LEFT", TeronTotemBar_Options.BuffBar_Button_Handlers_Options.offset_x, 0);
    EarthBuffButtonHolder:EnableMouse(true);
    EarthBuffButtonHolder:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
    });
    EarthBuffButtonHolder:SetBackdropColor(0.5, 0.5, 0.5, 0.8); -- Default color
    EarthBuffButtonHolder:SetScript("OnClick", function()
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("Earth Buff Button Holder Clicked");
        end
        if arg1 == "LeftButton" then
            if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
                print(arg1);
            end
            if Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].name == nil then
                UIErrorsFrame:AddMessage("No Earth Totem Selected", 1, 0, 0, 1, 5);
            end
            CastSpellByName(Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].name);
        end
    end);

    --Fire Buff Button Holder
    FireBuffButtonHolder = CreateFrame("Button", "TeronTotemBuffBar_Fire_ButtonHolder", TeronTotemBuffBarFrame);
    FireBuffButtonHolder:SetWidth(TeronTotemBar_Options.BuffBar_Button_Handlers_Options.button_width);
    FireBuffButtonHolder:SetHeight(TeronTotemBar_Options.BuffBar_Button_Handlers_Options.button_height);
    FireBuffButtonHolder:SetPoint("LEFT", EarthBuffButtonHolder, "RIGHT", TeronTotemBar_Options.BuffBar_Button_Handlers_Options.offset_x, 0);
    FireBuffButtonHolder:EnableMouse(true);
    FireBuffButtonHolder:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
    });
    FireBuffButtonHolder:SetScript("OnClick", function()
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("Fire Buff Button Holder Clicked");
        end
        if arg1 == "LeftButton" then
            if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
                print(arg1);
            end
            if Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].name == nil then
                UIErrorsFrame:AddMessage("No Fire Totem Selected", 1, 0, 0, 1, 5);
                return;
            end
            CastSpellByName(Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].name);
        end
    end);

    --Water Buff Button Holder
    WaterBuffButtonHolder = CreateFrame("Button", "TeronTotemBuffBar_Water_ButtonHolder", TeronTotemBuffBarFrame);
    WaterBuffButtonHolder:SetWidth(TeronTotemBar_Options.BuffBar_Button_Handlers_Options.button_width);
    WaterBuffButtonHolder:SetHeight(TeronTotemBar_Options.BuffBar_Button_Handlers_Options.button_height);
    WaterBuffButtonHolder:SetPoint("LEFT", FireBuffButtonHolder, "RIGHT", TeronTotemBar_Options.BuffBar_Button_Handlers_Options.offset_x, 0);
    WaterBuffButtonHolder:EnableMouse(true);
    WaterBuffButtonHolder:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
    });
    WaterBuffButtonHolder:SetScript("OnClick", function()
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("Water Buff Button Holder Clicked");
        end
        if arg1 == "LeftButton" then
            if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
                print(arg1);
            end
            if Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].name == nil then
                UIErrorsFrame:AddMessage("No Water Totem Selected", 1, 0, 0, 1, 5);
                return;
            end
            CastSpellByName(Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].name);    
        end
    end);

    --Air Buff Button Holder
    AirBuffButtonHolder = CreateFrame("Button", "TeronTotemBuffBar_Air_ButtonHolder", TeronTotemBuffBarFrame);
    AirBuffButtonHolder:SetWidth(TeronTotemBar_Options.BuffBar_Button_Handlers_Options.button_width);
    AirBuffButtonHolder:SetHeight(TeronTotemBar_Options.BuffBar_Button_Handlers_Options.button_height);
    AirBuffButtonHolder:SetPoint("LEFT", WaterBuffButtonHolder, "RIGHT", TeronTotemBar_Options.BuffBar_Button_Handlers_Options.offset_x, 0);
    AirBuffButtonHolder:EnableMouse(true);
    AirBuffButtonHolder:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
    });
    AirBuffButtonHolder:SetScript("OnClick", function()
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("Air Buff Button Holder Clicked");
        end
        if arg1 == "LeftButton" then
            if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
                print(arg1);
            end
            if not Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].name == nil then
                UIErrorsFrame:AddMessage("No Air Totem Selected", 1, 0, 0, 1, 5);
                return;
            end
            CastSpellByName(Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].name);
        end
    end);

    --Totemic Recall Button Holder
    TotemicRecallBuffButtonHolder = CreateFrame("Button", "TeronTotemBuffBar_Totemic_Recall_ButtonHolder", TeronTotemBuffBarFrame);
    TotemicRecallBuffButtonHolder:SetWidth(TeronTotemBar_Options.BuffBar_Button_Handlers_Options.button_width);
    TotemicRecallBuffButtonHolder:SetHeight(TeronTotemBar_Options.BuffBar_Button_Handlers_Options.button_height);
    TotemicRecallBuffButtonHolder:SetPoint("LEFT", AirBuffButtonHolder, "RIGHT", TeronTotemBar_Options.BuffBar_Button_Handlers_Options.offset_x, 0);
    TotemicRecallBuffButtonHolder:EnableMouse(true);
    TotemicRecallBuffButtonHolder:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
    });
    TotemicRecallBuffButtonHolder:SetScript("OnClick", function()
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("Totemic Recall Buff Button Holder Clicked");
        end
        if arg1 == "LeftButton" then
            if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
                print(arg1);
            end
            CastSpellByName(recall_Totems[1].name);
        end
    end);

end

--buff buttons (outside the main assignment frame)
function CreateBuffButtons()
    local button_size = 20;
    local offset_x = 10;

    --Earth Buff Button
    EarthBuffButton = CreateFrame("Button", "TeronTotemBuffBar_Earth_Button", EarthBuffButtonHolder);
    EarthBuffButton:SetWidth(button_size);
    EarthBuffButton:SetHeight(button_size);
    EarthBuffButton:SetPoint("LEFT", offset_x, 0);
    EarthBuffButton:SetNormalTexture(Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].icon);

    --Fire Buff Button
    FireBuffButton = CreateFrame("Button", "TeronTotemBuffBar_Fire_Button", FireBuffButtonHolder);
    FireBuffButton:SetWidth(button_size);
    FireBuffButton:SetHeight(button_size);
    FireBuffButton:SetPoint("LEFT", offset_x, 0);
    FireBuffButton:SetNormalTexture(Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].icon);
    
    --Water Buff Button
    WaterBuffButton = CreateFrame("Button", "TeronTotemBuffBar_Water_Button", WaterBuffButtonHolder);
    WaterBuffButton:SetWidth(button_size);
    WaterBuffButton:SetHeight(button_size);
    WaterBuffButton:SetPoint("LEFT", offset_x, 0);
    WaterBuffButton:SetNormalTexture(Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].icon);
    
    --Air Buff Button
    AirBuffButton = CreateFrame("Button", "TeronTotemBuffBar_Air_Button", AirBuffButtonHolder);
    AirBuffButton:SetWidth(button_size);
    AirBuffButton:SetHeight(button_size);
    AirBuffButton:SetPoint("LEFT", offset_x, 0);
    AirBuffButton:SetNormalTexture(Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].icon);
    
    --Totemic Recall Button (cast spell on click)
    TotemicRecallBuffButton = CreateFrame("Button", "TeronTotemBuffBar_Totemic_Recall_Button", TotemicRecallBuffButtonHolder);
    TotemicRecallBuffButton:SetWidth(button_size);
    TotemicRecallBuffButton:SetHeight(button_size);
    TotemicRecallBuffButton:SetPoint("CENTER", 0, 0);
    TotemicRecallBuffButton:SetNormalTexture(recall_Totems[1].icon);
end


--LOADS THE FRAMES AND THEIR RESPECTIVE ELEMENTS AND SCRIPTS
--TeronTotemBar_OnLoad is called when the addon is loaded
function TeronTotemBar_OnLoad()
    local _,class = UnitClass("player")
    if class == "SHAMAN" then

        --sets main frame visibility + backdrop
        getglobal("TeronTotemBar"):Hide(); --Hidden by default
        TeronTotemFrame:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            tileSize = 16,
            edgeSize = 16,
        });
        TeronTotemFrame:SetBackdropColor(0.1, 0, 0.7, 0.8); -- Set the background color

        --UNUSED CODE FOR HIDING/SHOWING THE FRAME
        --if TeronTotemBar_Options.TeronTotemFrameHidden == true then
        --    getglobal("TeronTotemBar"):Hide();
        --else
        --    getglobal("TeronTotemBar"):Show();
        --end
        --getglobal("TeronTotemBar"):Show();
     
        --Register for slash commands
        SLASH_TERONTOTEMBAR1 = "/ttb";
        SLASH_TERONTOTEMBAR2 = "/terontotembar";
        SlashCmdList["TERONTOTEMBAR"] = function (msg)
            TeronTotemBar_SlashCommands(msg);
        end

    else
        TeronTotemFrame:Hide();
        UIErrorsFrame:AddMessage("TeronTotemBar: You are not a Shaman!");
    end
end

--TeronTotemBar_OnLoad is called when the addon is loaded
function TeronTotemBuffBar_OnLoad()
    local _,class = UnitClass("player")
    if class == "SHAMAN" then
        --sets buff bar frame visibility + backdrop
        getglobal("TeronTotemBuffBar"):Show(); --Hidden by default
        TeronTotemBuffBarFrame:SetBackdrop({
            --bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            tileSize = 16,
            edgeSize = 16,
        });
    else
        TeronTotemBuffBarFrame:Hide();
        UIErrorsFrame:AddMessage("TeronTotemBar: You are not a Shaman!");
    end
end
--END OF FRAME LOADS

--FRAME MOVEMENT HANDLERS
--assignment frame movement handlers
function TeronTotemFrame_MouseDown()
    if TeronTotemBar_Options.Assignment_Frame_Lock == false then
        TeronTotemFrame:StartMoving()
        TeronTotemFrame.isMoving = true
        TeronTotemFrame.startPosX = TeronTotemFrame:GetLeft()
        TeronTotemFrame.startPosY = TeronTotemFrame:GetTop()
    end
end
function TeronTotemFrame_MouseUp()
    if (TeronTotemFrame.isMoving) then
        TeronTotemFrame:StopMovingOrSizing()
        TeronTotemFrame.isMoving = false
    end
    if TeronTotemBar_Options.Assignment_Frame_Lock == false then
        if
            abs(TeronTotemFrame.startPosX - TeronTotemFrame:GetLeft()) < 2 and
                abs(TeronTotemFrame.startPosY - TeronTotemFrame:GetTop()) < 2
        then
            TeronTotemFrame:Show()
        end
    else
        TeronTotemFrame:Show()
    end
    
end

--buff bar frame movement handlers
function TeronTotemBuffBar_MouseDown()
    if TeronTotemBar_Options.BuffBar_Frame_Lock == false then
        TeronTotemBuffBarFrame:StartMoving()
        TeronTotemBuffBarFrame.isMoving = true
        TeronTotemBuffBarFrame.startPosX = TeronTotemBuffBarFrame:GetLeft()
        TeronTotemBuffBarFrame.startPosY = TeronTotemBuffBarFrame:GetTop()
    end
end
function TeronTotemBuffBar_MouseUp()
    if (TeronTotemBuffBarFrame.isMoving) then
        TeronTotemBuffBarFrame:StopMovingOrSizing()
        TeronTotemBuffBarFrame.isMoving = false
    end
    if TeronTotemBar_Options.BuffBar_Frame_Lock == false then
        if
            abs(TeronTotemBuffBarFrame.startPosX - TeronTotemBuffBarFrame:GetLeft()) < 2 and
                abs(TeronTotemBuffBarFrame.startPosY - TeronTotemBuffBarFrame:GetTop()) < 2
        then
            TeronTotemBuffBarFrame:Show()
        end
    else
        TeronTotemBuffBarFrame:Show()
    end    
end
--END OF FRAME MOVEMENT HANDLERS

--EVENT HANDLER FOR THE MAIN ASSIGNMENT FRAME
function TeronTotemFrame_OnEvent()
    local _,class = UnitClass("player")
    if class == "SHAMAN" then
        if event == "PLAYER_ENTERING_WORLD" then
            UIErrorsFrame:AddMessage("TeronTotem Assignment Frame Loaded", 1.0, 0.0, 0.0, 1.0, UIERRORS_HOLD_TIME);
        elseif event == "ADDON_LOADED" and arg1 == "TeronTotemBar" then
            if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
                print("TeronTotemBar Addon Loaded");
            end
            InitConfig();
            TeronTotemBar_OnLoad();
            --loads the different elements of the assignment frame
            CreateTotemHeaderButtons();
            CreateElementButtons();
            CreatePlayerHeaders();
        elseif event == "PARTY_MEMBERS_CHANGED" then
            StoreAllSham_Party();
        end
    else
        return;
    end
end

--EVENT HANDLER FOR THE BUFF BAR FRAME
function TeronTotemBuffBarFrame_OnEvent()
    local _,class = UnitClass("player")
    if class == "SHAMAN" then
        if event == "PLAYER_ENTERING_WORLD" then
            UIErrorsFrame:AddMessage("TeronTotem Buff Bar Loaded", 1.0, 0.0, 0.0, 1.0, UIERRORS_HOLD_TIME);
        elseif event == "ADDON_LOADED" and arg1 == "TeronTotemBar" then
            if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
                print("TeronTotemBar Addon Loaded");
            end
            TeronTotemBuffBar_OnLoad();
            --loads the different elements of the buff bar
            CreateBuffButtonHolders();
            CreateBuffButtons();
        end
    else 
        return;
    end
end
function TeronTotemBuffBar_OnUpdate()
    local TTB_buff;
    EarthBuffButtonHolder:SetBackdropColor(1, 0, 0, 1); -- Red if buff is not active
    FireBuffButtonHolder:SetBackdropColor(1, 0, 0, 1); -- Red if buff is not active
    WaterBuffButtonHolder:SetBackdropColor(1, 0, 0, 1); -- Red if buff is not active
    AirBuffButtonHolder:SetBackdropColor(1, 0, 0, 1); -- Red if buff is not active

    --check if the buff is active and color the button accordingly
    for TTB_index = 1, 40 do
        TTB_buff = UnitBuff("player", TTB_index)
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true and TTB_buff then
            print("Checking Earth Totem Buff: " .. TTB_buff);
        end
        if TTB_buff and (TTB_buff == Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].icon) then
            EarthBuffButtonHolder:SetBackdropColor(0, 1, 0, 1); -- Green if buff is active
        end
        if TTB_buff and (TTB_buff == Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].icon) then
            FireBuffButtonHolder:SetBackdropColor(0, 1, 0, 1); -- Green if buff is active

        end
        if TTB_buff and (TTB_buff == Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].icon) then
            WaterBuffButtonHolder:SetBackdropColor(0, 1, 0, 1); -- Green if buff is active
        end
        if TTB_buff and (TTB_buff == Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].icon) then
            AirBuffButtonHolder:SetBackdropColor(0, 1, 0, 1); -- Green if buff is active
        end
        if not TTB_buff then 
            break; -- Exit the loop if any buff is found
        end
    end
end
--END OF EVENT HANDLER FOR THE BUFF BAR FRAME

--SLASH COMMANDS HANDLER
--list of slash commands
function TeronTotemBar_SlashCommands(msg)
    if msg == "show" then
        TeronTotemFrame:Show();
        UIErrorsFrame:AddMessage("TeronTotemBar: Assignment frame is now shown.");
    elseif msg == "hide" then
        TeronTotemFrame:Hide();
        UIErrorsFrame:AddMessage("TeronTotemBar: Assignment frame is now hidden.");
    elseif msg == "lock" then
        TeronTotemBar_Options.Assignment_Frame_Lock = true;
        TeronTotemBar_Options.BuffBar_Frame_Lock = true;
        UIErrorsFrame:AddMessage("TeronTotemBar: Frame is now locked.");
    elseif msg == "unlock" then
        TeronTotemBar_Options.Assignment_Frame_Lock = false;
        TeronTotemBar_Options.BuffBar_Frame_Lock = false;
        UIErrorsFrame:AddMessage("TeronTotemBar: Frame is now unlocked.");
    elseif msg == "debug" then
        TeronTotemBar_Options.TeronTotemBar_DebugMode = not TeronTotemBar_Options.TeronTotemBar_DebugMode;
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            UIErrorsFrame:AddMessage("TeronTotemBar: Debug mode is now on!");
        elseif TeronTotemBar_Options.TeronTotemBar_DebugMode == false then
            UIErrorsFrame:AddMessage("TeronTotemBar: Debug mode is now off!");
        end
--    elseif msg == "reset" then
--        TeronTotemFrame:SetPoint("CENTER", 0, 0);
--    elseif msg == "cast" then
--        CastNextElementTotem();
    elseif msg == "help" then
        --list of slash commands
        print("TeronTotemBar list of slash commands:");
        print("/ttb show - shows the assignment frame");
        print("/ttb hide - hides the assignment frame");
        print("/ttb lock - locks both the assignment and buff frames in place");
        print("/ttb unlock - unlocks both the assignment and buff frames");
        print("/ttb debug - enables/disables the debug mode for TeronTotemBar");
    end
end
--END OF SLASH COMMANDS HANDLER

--Get the current time
function GetNow()
    return GetTime()
end

--custom function to get the spell ID by name from the spellbook
function GetSpellByName(name)
   local spid=nil;
   for j=1,1024 do 
       local n=GetSpellName(j,BOOKTYPE_SPELL);
       if n and strfind(n,name) then spid=j; break; end 
   end 
   return spid;
end

function PlayerHasBuff(buffName)
    for i = 1, 40 do
        local name = UnitBuff("player", i)
        if not name then 
            break 
        end
        if name == buffName then
            return true
        end
    end
    return false
end

--UPDATE HANDLERS FOR THE BUTTON ICONS
function UpdateEarthButtonIcon()
    EarthButton:SetNormalTexture(Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].icon);
    --hides the old buff buttons on the buff bar
    EarthBuffButton:Hide();
    FireBuffButton:Hide();
    WaterBuffButton:Hide();
    AirBuffButton:Hide();
    --cretaes the new buff buttons with the newly assigned totems
    CreateBuffButtons();
end
function UpdateFireButtonIcon()
    FireButton:SetNormalTexture(Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].icon);
    --hides the old buff buttons on the buff bar
    FireBuffButton:Hide();
    EarthBuffButton:Hide();
    WaterBuffButton:Hide();
    AirBuffButton:Hide();
    --creates the new buff buttons with the newly assigned totems
    CreateBuffButtons();
end
function UpdateWaterButtonIcon()
    WaterButton:SetNormalTexture(Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].icon);
    --hides the old buff buttons on the buff bar
    WaterBuffButton:Hide();
    EarthBuffButton:Hide();
    FireBuffButton:Hide();
    AirBuffButton:Hide();
    --creates the new buff buttons with the newly assigned totems
    CreateBuffButtons();
end
function UpdateAirButtonIcon()
    AirButton:SetNormalTexture(Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].icon);
    --hides the old buff buttons on the buff bar
    AirBuffButton:Hide();
    EarthBuffButton:Hide();
    FireBuffButton:Hide();
    WaterBuffButton:Hide();
    --creates the new buff buttons with the newly assigned totems
    CreateBuffButtons();
end

-- Gets the current totem for the specified element
function GetCurrentTotem(element)
    if element == "Earth" then
        return Earth_Totems[TTB_currentEarthTotemIndex], "Earth", TTB_currentEarthTotemIndex
    elseif element == "Fire" then
        return Fire_Totems[TTB_currentFireTotemIndex], "Fire", TTB_currentFireTotemIndex
    elseif element == "Water" then
        return Water_Totems[TTB_currentWaterTotemIndex], "Water", TTB_currentWaterTotemIndex
    elseif element == "Air" then
        return Air_Totems[TTB_currentAirTotemIndex], "Air", TTB_currentAirTotemIndex
    end
end
--END OF UPDATE HANDLERS FOR THE BUTTON ICONS

--casting all totems in order
function CastNextElementTotem()
    local checked = 0
    local maxTotems = TeronTotemBar_Options.Order.number_of_totems

    while checked < maxTotems do
        local element = TTB_elementOrder[TTB_nextElementIndex]
        local totem, elementType, totemIndex = GetCurrentTotem(element)

        -- Check for empty slot
        if not (totem and totem.name) then
            TTB_nextElementIndex = TTB_nextElementIndex + 1
            if TTB_nextElementIndex > maxTotems then
                TTB_nextElementIndex = 1
            end
            checked = checked + 1
        else
            -- Check if spell is known
            local spellSlot = GetSpellByName(totem.name)
            if not spellSlot then
                UIErrorsFrame:AddMessage(totem.name .. " is not known!", 1, 0, 0)
                TTB_nextElementIndex = TTB_nextElementIndex + 1
                if TTB_nextElementIndex > maxTotems then
                    TTB_nextElementIndex = 1
                end
                checked = checked + 1
            else
                -- Check cooldown
                local start, duration, enabled = GetSpellCooldown(spellSlot, BOOKTYPE_SPELL)
                if enabled == 1 and duration > 0 and (start + duration - GetNow()) > 0 then
                    TTB_nextElementIndex = TTB_nextElementIndex + 1
                    if TTB_nextElementIndex > maxTotems then
                        TTB_nextElementIndex = 1
                    end
                    checked = checked + 1
                else
                    -- Check duration (from SavedVariables)
                    local saved = TeronTotemBar_Saved[elementType] or {}
                    local expireTime = saved[totemIndex] and saved[totemIndex].expireTime or 0
                    local now = GetNow()
                    if expireTime <= now then
                        -- Totem duration expired, can recast
                        CastSpellByName(totem.name)
                        TeronTotemBar_Saved[elementType] = TeronTotemBar_Saved[elementType] or {}
                        TeronTotemBar_Saved[elementType][totemIndex] = {
                            castTime = now,
                            expireTime = now + (totem.duration or 0),
                        }
                        TTB_nextElementIndex = TTB_nextElementIndex + 1
                        if TTB_nextElementIndex > maxTotems then
                            TTB_nextElementIndex = 1
                        end
                        return -- Stop after casting one totem
                    else
                        -- Totem is still active, skip to next
                        TTB_nextElementIndex = TTB_nextElementIndex + 1
                        if TTB_nextElementIndex > maxTotems then
                            TTB_nextElementIndex = 1
                        end
                        checked = checked + 1
                    end
                end
            end
        end
    end

    UIErrorsFrame:AddMessage("No available totems to cast!", 1, 0.5, 0)
end

function StoreAllSham_Party()
    local max_party_members = GetNumPartyMembers();
    for groupindex = 1, max_party_members do
        local unit = "party" .. groupindex
        if UnitExists(unit) then
            local name = UnitName(unit)
            local class = select(2, UnitClass(unit))
            if class == "SHAMAN" then
                TeronShamansInGroup = {
                    ["name"] = name,
                    ["unit"] = unit,
                    ["class"] = class,
                }
            end
        end
    end
end

