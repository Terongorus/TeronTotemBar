MAX_PARTY_MEMBERS = 5;
MAX_RAID_MEMBERS = 40;
EMPTY_ICON = "Interface\\Buttons\\UI-GroupLoot-Pass-Up"

--default values for the totem bar
TTB_currentEarthTotemIndex = nil; --current index for the earth totem
TTB_currentFireTotemIndex = nil; --current index for the fire totem
TTB_currentWaterTotemIndex = nil; --current index for the water totem
TTB_currentAirTotemIndex = nil; --current index for the air totem
TTB_elementOrder = {"Earth", "Fire", "Water", "Air"}
TTB_nextElementIndex = 1
TTB_Self_Header_TextFrame = nil;
TTB_general_offset = 150; --general offset for the totem bar
TTB_Icons_Offset_X = 100;
TTB_Icons_Offset_Y = 60;
TTB_Weapon_Enhancement_Timer = nil; --timer for the weapon enhancement
TTB_Current_Weapon_Enhancement = nil; --current weapon enhancement

--default values for the totem bar
TeronTotemBar_Options = {
    Earth = { 
        max = 6, 
        shown = 1, 
    }, -- was 5
    Fire = { 
        max = 6, 
        shown = 1, 
    }, -- was 5
    Water = { 
        max = 6, 
        shown = 1, 
    }, -- was 5
    Air = { 
        max = 8, 
        shown = 1, 
    }, -- was 7
    Weapon_Enhancements = {
        max = 5,
        shown = 1,
    },
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
    SavedWeaponEnhancement = nil, -- used to save the weapon enhancement for the player
    Frame_Icons_Options = {
        general_offset = 0,
        offset_x = 100,
        offset_y = 50,
    },
    BuffBar_Button_Handlers_Options = {
        number_of_buttons = 6,
        number_of_paddings = 7,
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
    TeronTotemBar_StoneMagmaMode = false,
}

local Totem_Types = {"Earth", "Fire", "Water", "Air", "Totemic_Recall"};

--Tables containing the totem data for each element
local Earth_Totems = {
    { 
        button = "TeronTotemBar_Earth_Totem_Empty", 
        name = nil, 
        icon = EMPTY_ICON, 
        duration = 0, 
        cooldown = nil, 
        buff = false 
    },
    {
        button = "TeronTotemBar_Earth_Totem_1",
        name = "Stoneskin Totem",
        icon = "Interface\\Icons\\Spell_Nature_StoneSkinTotem",
        duration = 120,
        cooldown = nil,
        buff = true,
    },
    {
        --
        button = "TeronTotemBar_Earth_Totem_2",
        name = "Earthbind Totem",
        icon = "Interface\\Icons\\Spell_Nature_StrengthOfEarthTotem02",
        duration = 45,
        cooldown = 15,
        buff = false,
    },
    {
        --correct values
        button = "TeronTotemBar_Earth_Totem_3",
        name = "Stoneclaw Totem",
        icon = "Interface\\Icons\\Spell_Nature_StoneClawTotem",
        duration = 15,
        cooldown = 30,
        buff = false,
    },
    {
        --correct values
        button = "TeronTotemBar_Earth_Totem_4",
        name = "Strength of Earth Totem",
        icon = "Interface\\Icons\\Spell_Nature_EarthBindTotem",
        duration = 120,
        cooldown = nil,
        buff = true,
    },
    {
        --correct values
        button = "TeronTotemBar_Earth_Totem_5",
        name = "Tremor Totem",
        icon = "Interface\\Icons\\Spell_Nature_TremorTotem",
        duration = 120,
        cooldown = nil,
        buff = false,
    }
};
local Fire_Totems = {
    { 
        button = "TeronTotemBar_Fire_Totem_Empty", 
        name = nil, 
        icon = EMPTY_ICON, 
        duration = 0, 
        cooldown = nil, 
        buff = false 
    },
    {
        button = "TeronTotemBar_Fire_Totem_1",
        name = "Flametongue Totem",
        icon = "Interface\\Icons\\Spell_Nature_GuardianWard",
        duration = 120,
        cooldown = nil,
        buff = true,
    },
    {
        button = "TeronTotemBar_Fire_Totem_2",
        name = "Magma Totem",
        icon = "Interface\\Icons\\Spell_Fire_SelfDestruct",
        duration = 20,
        cooldown = nil,
        buff = false,
    },
    {
        button = "TeronTotemBar_Fire_Totem_3",
        name = "Searing Totem",
        icon = "Interface\\Icons\\Spell_Fire_SearingTotem",
        duration = 55,
        cooldown = nil,
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
        cooldown = nil,
        buff = true,
    }
};
local Water_Totems = {
    { 
        button = "TeronTotemBar_Water_Totem_Empty", 
        name = nil, 
        icon = EMPTY_ICON, 
        duration = 0, 
        cooldown = nil, 
        buff = false 
    },
    {
        button = "TeronTotemBar_Water_Totem_1",
        name = "Healing Stream Totem",
        icon = "Interface\\Icons\\INV_Spear_04",
        duration = 60,
        cooldown = nil,
        buff = true,
    },
    {
        button = "TeronTotemBar_Water_Totem_2",
        name = "Mana Spring Totem",
        icon = "Interface\\Icons\\Spell_Nature_ManaRegenTotem",
        duration = 60,
        cooldown = nil,
        buff = true,
    },
    {
        button = "TeronTotemBar_Water_Totem_3",
        name = "Poison Cleansing Totem",
        icon = "Interface\\Icons\\Spell_Nature_PoisonCleansingTotem",
        duration = 120,
        cooldown = nil,
        buff = false,
    },
    {
        button = "TeronTotemBar_Water_Totem_4",
        name = "Disease Cleansing Totem",
        icon = "Interface\\Icons\\Spell_Nature_DiseaseCleansingTotem",
        duration = 120,
        cooldown = nil,
        buff = false,
    },
    {
        button = "TeronTotemBar_Water_Totem_5",
        name = "Fire Resistance Totem",
        icon = "Interface\\Icons\\Spell_FireResistanceTotem_01",
        duration = 120,
        cooldown = nil,
        buff = true,
    },
};
local Air_Totems = {
    { 
        button = "TeronTotemBar_Air_Totem_Empty", 
        name = nil, 
        icon = EMPTY_ICON, 
        duration = 0, 
        cooldown = nil, 
        buff = false 
    },
    {
        button = "TeronTotemBar_Air_Totem_1",
        name = "Windfury Totem",
        icon = "Interface\\Icons\\Spell_Nature_Windfury",
        duration = 120,
        cooldown = nil,
        buff = true,
    },
    {
        button = "TeronTotemBar_Air_Totem_2",
        name = "Grace of Air Totem",
        icon = "Interface\\Icons\\Spell_Nature_InvisibilityTotem",
        duration = 120,
        cooldown = nil,
        buff = true,
    },
    {
        button = "TeronTotemBar_Air_Totem_3",
        name = "Grounding Totem",
        icon = "Interface\\Icons\\Spell_Nature_GroundingTotem",
        duration = 45,
        cooldown = 15,
        buff = true,
    },
    {
        button = "TeronTotemBar_Air_Totem_4",
        name = "Windwall Totem",
        icon = "Interface\\Icons\\Spell_Nature_EarthBind",
        duration = 120,
        cooldown = nil,
        buff = true,
    },
    {
        button = "TeronTotemBar_Air_Totem_5",
        name = "Nature Resistance Totem",
        icon = "Interface\\Icons\\Spell_Nature_NatureResistanceTotem",
        duration = 120,
        cooldown = nil,
        buff = true,
    },
    {
        button = "TeronTotemBar_Air_Totem_6",
        name = "Sentry Totem",
        icon = "Interface\\Icons\\Spell_Nature_RemoveCurse",
        duration = 300,
        cooldown = nil,
        buff = true,
    },
    {
        button = "TeronTotemBar_Air_Totem_7",
        name = "Tranquil Air Totem",
        icon = "Interface\\Icons\\Spell_Nature_Brilliance",
        duration = 120,
        cooldown = nil,
        buff = true,
    },
};
local WeaponEnhancements = {
    {
        button = "TeronTotemBar_WeaponEnhancement_Empty",
        name = nil,
        icon = EMPTY_ICON,
        duration = 0,
        cooldown = nil,
        buff = false,
    },
    {
        button = "TeronTotemBar_WeaponEnhancement_1",
        name = "Rockbiter Weapon",
        icon = "Interface\\Icons\\Spell_Nature_RockBiter",
        duration = 3600,
        cooldown = nil,
        buff = true,
    },
    {
        button = "TeronTotemBar_WeaponEnhancement_2",
        name = "Flametongue Weapon",
        icon = "Interface\\Icons\\Spell_Fire_FlameTounge",
        duration = 3600,
        cooldown = nil,
        buff = true,
    },
    {
        button = "TeronTotemBar_WeaponEnhancement_3",
        name = "Frostbrand Weapon",
        icon = "Interface\\Icons\\Spell_Frost_FrostBrand",
        duration = 3600,
        cooldown = nil,
        buff = true,
    },
    {
        button = "TeronTotemBar_WeaponEnhancement_4",
        name = "Windfury Weapon",
        icon = "Interface\\Icons\\Spell_Nature_Cyclone",
        duration = 3600,
        cooldown = nil,
        buff = true,
    },
}
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


--ASSIGNMENT FRAME HOLDER (contains the assignments for the player and for each shaman in the group)

TeronTotemAssignmentFrameHolder = CreateFrame("Frame", "TeronTotemAssignmentFrameHolder", UIParent);
TeronTotemAssignmentFrameHolder:SetWidth((2*TTB_general_offset + 4*TTB_Icons_Offset_X) + 20); -- 100px for the left padding, 5 buttons of 100px each, and 100px for the right padding
TeronTotemAssignmentFrameHolder:SetHeight(400);
TeronTotemAssignmentFrameHolder:SetFrameStrata("DIALOG");
TeronTotemAssignmentFrameHolder:SetPoint("CENTER", 0, 0);
TeronTotemAssignmentFrameHolder:EnableMouse(true);
TeronTotemAssignmentFrameHolder:SetMovable(true);
--events for assignment frame holder
TeronTotemAssignmentFrameHolder:RegisterEvent("PLAYER_ENTERING_WORLD");
TeronTotemAssignmentFrameHolder:RegisterEvent("ADDON_LOADED");
TeronTotemAssignmentFrameHolder:SetScript("OnEvent", function()
    TeronTotemAssignmentFrameHolder_OnEvent();

end);
TeronTotemAssignmentFrameHolder:SetScript("OnMouseDown", function()
    if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
        print("ASSIGNMENT FRAME HOLDER - MOUSE DOWN");
    end
    if arg1 == "LeftButton" and TeronTotemBar_Options.Assignment_Frame_Lock == false then
        TeronTotemAssignmentFrameHolder_OnMouseDown();
    end
end);
TeronTotemAssignmentFrameHolder:SetScript("OnMouseUp", function()
    if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
        print("ASSIGNMENT FRAME HOLDER - MOUSE UP");
    end
    if arg1 == "LeftButton" and TeronTotemBar_Options.Assignment_Frame_Lock == false then
        TeronTotemAssignmentFrameHolder_OnMouseUp();
    end
end);

--MAIN FRAME (assignment frame)

--create the  main frame for assigning totems
TeronTotemFrame = CreateFrame("Frame", "TeronTotemBar", TeronTotemAssignmentFrameHolder);
TeronTotemFrame:SetWidth(2*TTB_general_offset + 4*TTB_Icons_Offset_X);
TeronTotemFrame:SetHeight(60);
TeronTotemFrame:SetPoint("CENTER", 0, 50);
--TeronTotemFrame:SetClampedToScreen(true);
TeronTotemFrame:EnableMouseWheel(true);
--TeronTotemFrame:EnableMouse(true);
--TeronTotemFrame:SetMovable(true);
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

--BUFF BAR FRAME

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
    TeronTotemBuffBar_OnUpdate(arg1, arg2);
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
    if TeronTotemBar_Options.Weapon_Enhancements.max == nil then
        TeronTotemBar_Options.Weapon_Enhancements.max = 5;
    end
    if TeronTotemBar_Options.Weapon_Enhancements.shown == nil then
        TeronTotemBar_Options.Weapon_Enhancements.shown = 1;
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
    if TeronTotemBar_Options.SavedTotemIndexes.Earth == nil or TeronTotemBar_Options.SavedTotemIndexes.Earth > TeronTotemBar_Options.Earth.max then
        TeronTotemBar_Options.SavedTotemIndexes.Earth = 1; -- default to first Earth totem
    end
    if TeronTotemBar_Options.SavedTotemIndexes.Fire == nil or TeronTotemBar_Options.SavedTotemIndexes.Fire > TeronTotemBar_Options.Fire.max then
        TeronTotemBar_Options.SavedTotemIndexes.Fire = 1; -- default to first Fire totem
    end
    if TeronTotemBar_Options.SavedTotemIndexes.Water == nil or TeronTotemBar_Options.SavedTotemIndexes.Water > TeronTotemBar_Options.Water.max then
        TeronTotemBar_Options.SavedTotemIndexes.Water = 1; -- default to first Water totem
    end
    if TeronTotemBar_Options.SavedTotemIndexes.Air == nil or TeronTotemBar_Options.SavedTotemIndexes.Air > TeronTotemBar_Options.Air.max then
        TeronTotemBar_Options.SavedTotemIndexes.Air = 1; -- default to first Air totem
    end
    if TeronTotemBar_Options.Frame_Icons_Options == nil then
        TeronTotemBar_Options.Frame_Icons_Options = {
            general_offset = 0,
            offset_x = 100,
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
    if TeronTotemBar_Options.TeronTotemBar_StoneMagmaMode == nil then
        TeronTotemBar_Options.TeronTotemBar_StoneMagmaMode = false;
    end
    if TeronTotemBar_Options.SavedWeaponEnhancement == nil then
        TeronTotemBar_Options.SavedWeaponEnhancement = 1; -- default to Empty Weapon Enhancement
    end
end

--END OF CONFIGURATION

-- This will be your SavedVariables table
TeronTotemBar_Saved = TeronTotemBar_Saved or {} 

--CREATION OF THE DIFFERENT KEY ELEMENTS OF THE ADDON
--Creates headers for each element
function CreateTotemHeaderButtons()
    local button_size = 40;
    local anchor = "LEFT";

    --Earth Header
    EarthHeader = CreateFrame("Button", "TeronTotemBar_Earth_Header", TeronTotemFrame);
    EarthHeader:SetWidth(button_size);
    EarthHeader:SetHeight(button_size);
    EarthHeader:SetPoint(anchor, TTB_general_offset, TTB_Icons_Offset_Y);
    EarthHeader:SetNormalTexture("Interface\\Icons\\Spell_Nature_EarthShock");

    --Fire Header
    FireHeader = CreateFrame("Button", "TeronTotemBar_Fire_Header", TeronTotemFrame);
    FireHeader:SetWidth(button_size);
    FireHeader:SetHeight(button_size);
    FireHeader:SetPoint(anchor, EarthHeader , TTB_Icons_Offset_X, 0);
    FireHeader:SetNormalTexture("Interface\\Icons\\Spell_Fire_FlameShock");

    --Water Header
    WaterHeader = CreateFrame("Button", "TeronTotemBar_Water_Header", TeronTotemFrame);
    WaterHeader:SetWidth(button_size);
    WaterHeader:SetHeight(button_size);
    WaterHeader:SetPoint(anchor, FireHeader, TTB_Icons_Offset_X, 0);
    WaterHeader:SetNormalTexture("Interface\\Icons\\Spell_Frost_FrostShock");

    --Air Header
    AirHeader = CreateFrame("Button", "TeronTotemBar_Air_Header", TeronTotemFrame);
    AirHeader:SetWidth(button_size);
    AirHeader:SetHeight(button_size);
    AirHeader:SetPoint(anchor, WaterHeader, TTB_Icons_Offset_X, 0);
    AirHeader:SetNormalTexture("Interface\\Icons\\Spell_Nature_Cyclone");

    --Weapon Enhancement Header
    WeaponEnhancementHeader = CreateFrame("Button", "TeronTotemBar_WeaponEnhancement_Header", TeronTotemFrame);
    WeaponEnhancementHeader:SetWidth(button_size);
    WeaponEnhancementHeader:SetHeight(button_size);
    WeaponEnhancementHeader:SetPoint(anchor, AirHeader, TTB_Icons_Offset_X, 0);
    WeaponEnhancementHeader:SetNormalTexture("Interface\\Icons\\Ability_ThunderBolt");
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
    local button_size = 40;
    local anchor = "LEFT";

    --Earth Button
    EarthButton = CreateFrame("Button", "TeronTotemBar_Earth_Button", TeronTotemFrame);
    EarthButton:SetWidth(button_size);
    EarthButton:SetHeight(button_size);
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
            if TeronTotemBar_Options.SavedTotemIndexes.Earth > TeronTotemBar_Options.Earth.max then
                TeronTotemBar_Options.SavedTotemIndexes.Earth = 1;
            end
        elseif arg1 < 0 then
            TeronTotemBar_Options.SavedTotemIndexes.Earth = TeronTotemBar_Options.SavedTotemIndexes.Earth - 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Earth < 1 then
                TeronTotemBar_Options.SavedTotemIndexes.Earth = TeronTotemBar_Options.Earth.max;
            end
        end
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM EARTH TOTEM INDEX: " .. TeronTotemBar_Options.SavedTotemIndexes.Earth);
        end
        UpdateEarthButtonIcon();
    end);

    --Fire Button
    FireButton = CreateFrame("Button", "TeronTotemBar_Fire_Button", TeronTotemFrame);
    FireButton:SetWidth(button_size);
    FireButton:SetHeight(button_size);
    FireButton:SetPoint(anchor, EarthButton, TTB_Icons_Offset_X, 0);
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
            if TeronTotemBar_Options.SavedTotemIndexes.Fire > TeronTotemBar_Options.Fire.max then
                TeronTotemBar_Options.SavedTotemIndexes.Fire = 1;
            end
        elseif arg1 < 0 then
            TeronTotemBar_Options.SavedTotemIndexes.Fire = TeronTotemBar_Options.SavedTotemIndexes.Fire - 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Fire < 1 then
                TeronTotemBar_Options.SavedTotemIndexes.Fire = TeronTotemBar_Options.Fire.max;
            end
        end
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM FIRE TOTEM INDEX: " .. TeronTotemBar_Options.SavedTotemIndexes.Fire);
        end
        UpdateFireButtonIcon();
    end);

    --Water Button
    WaterButton = CreateFrame("Button", "TeronTotemBar_Water_Button", TeronTotemFrame);
    WaterButton:SetWidth(button_size);
    WaterButton:SetHeight(button_size);
    WaterButton:SetPoint(anchor, FireButton, TTB_Icons_Offset_X, 0);
    WaterButton:SetNormalTexture(Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].icon);
    WaterButton:EnableMouseWheel(true);
    WaterButton:SetScript("OnMouseWheel", function()
--        TeronTotemBar_Options.SavedTotemIndexes.Water = TTB_currentWaterTotemIndex;
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM WATER TOTEM DELTA: " .. arg1);
        end
        if arg1 > 0 then
            TeronTotemBar_Options.SavedTotemIndexes.Water = TeronTotemBar_Options.SavedTotemIndexes.Water + 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Water > TeronTotemBar_Options.Water.max then
                TeronTotemBar_Options.SavedTotemIndexes.Water = 1;
            end
        elseif arg1 < 0 then
            TeronTotemBar_Options.SavedTotemIndexes.Water = TeronTotemBar_Options.SavedTotemIndexes.Water - 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Water < 1 then
                TeronTotemBar_Options.SavedTotemIndexes.Water = TeronTotemBar_Options.Water.max;
            end
        end
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM WATER TOTEM INDEX: " .. TeronTotemBar_Options.SavedTotemIndexes.Water);
        end
        UpdateWaterButtonIcon();
    end);

    --Air Button
    AirButton = CreateFrame("Button", "TeronTotemBar_Air_Button", TeronTotemFrame);
    AirButton:SetWidth(button_size);
    AirButton:SetHeight(button_size);
    AirButton:SetPoint(anchor, WaterButton, TTB_Icons_Offset_X, 0);
    AirButton:SetNormalTexture(Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].icon);
    AirButton:EnableMouseWheel(true);
    AirButton:SetScript("OnMouseWheel", function()
--        TeronTotemBar_Options.SavedTotemIndexes.Air = TTB_currentAirTotemIndex;
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM AIR TOTEM DELTA: " .. arg1);
        end
        if arg1 > 0 then
            TeronTotemBar_Options.SavedTotemIndexes.Air = TeronTotemBar_Options.SavedTotemIndexes.Air + 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Air > TeronTotemBar_Options.Air.max then
                TeronTotemBar_Options.SavedTotemIndexes.Air = 1;
            end
        elseif arg1 < 0 then
            TeronTotemBar_Options.SavedTotemIndexes.Air = TeronTotemBar_Options.SavedTotemIndexes.Air - 1;
            if TeronTotemBar_Options.SavedTotemIndexes.Air < 1 then
                TeronTotemBar_Options.SavedTotemIndexes.Air = TeronTotemBar_Options.Air.max;
            end
        end
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM AIR TOTEM INDEX: " .. TeronTotemBar_Options.SavedTotemIndexes.Air);
        end
        UpdateAirButtonIcon();
    end);
    
    --Weapon Enhancement Button
    WeaponEnhancementButton = CreateFrame("Button", "TeronTotemBar_WeaponEnhancement_Button", TeronTotemFrame);
    WeaponEnhancementButton:SetWidth(button_size);
    WeaponEnhancementButton:SetHeight(button_size);
    WeaponEnhancementButton:SetPoint(anchor, AirButton, TTB_Icons_Offset_X, 0);
    WeaponEnhancementButton:SetNormalTexture(WeaponEnhancements[TeronTotemBar_Options.SavedWeaponEnhancement].icon);
    WeaponEnhancementButton:EnableMouseWheel(true);
    WeaponEnhancementButton:SetScript("OnMouseWheel", function()
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM WEAPON ENHANCEMENT DELTA: " .. arg1);
        end
        if arg1 > 0 then
            TeronTotemBar_Options.SavedWeaponEnhancement = TeronTotemBar_Options.SavedWeaponEnhancement + 1;
            if TeronTotemBar_Options.SavedWeaponEnhancement > TeronTotemBar_Options.Weapon_Enhancements.max then
                TeronTotemBar_Options.SavedWeaponEnhancement = 1;
            end
        elseif arg1 < 0 then
            TeronTotemBar_Options.SavedWeaponEnhancement = TeronTotemBar_Options.SavedWeaponEnhancement - 1;
            if TeronTotemBar_Options.SavedWeaponEnhancement < 1 then
                TeronTotemBar_Options.SavedWeaponEnhancement = TeronTotemBar_Options.Weapon_Enhancements.max;
            end
        end
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("TERONSTORM WEAPON ENHANCEMENT INDEX: " .. TeronTotemBar_Options.SavedWeaponEnhancement);
        end
        UpdateWeaponEnhancementButtonIcon();
    end);
end

--new function
--creates the button holders for each element buff button on the personal buff bar
function CreateBuffButtonHolders()
    local button_height = 40;
    local d_insets = 4;

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
        insets = { left = d_insets, right = d_insets, top = d_insets, bottom = d_insets },
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
            if ((TTB_duration_Earth == 0 or TTB_duration_Earth == nil) and (TTB_cooldown_Earth == 0 or TTB_cooldown_Earth == nil)) or TTB_currentEarthTotemIndex == TeronTotemBar_Options.SavedTotemIndexes.Earth then
                CastSpellByName(Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].name);
                TTB_currentEarthTotemIndex = TeronTotemBar_Options.SavedTotemIndexes.Earth;
                TTB_duration_Earth = Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].duration;
            else
                UIErrorsFrame:AddMessage("Earth Totem is already active or on cooldown!", 1, 0, 0, 1, 5);
            end
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
        insets = { left = d_insets, right = d_insets, top = d_insets, bottom = d_insets },
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
            if ((TTB_duration_Fire == 0 or TTB_duration_Fire == nil) and (TTB_cooldown_Fire == 0 or TTB_cooldown_Fire == nil)) or TTB_currentFireTotemIndex == TeronTotemBar_Options.SavedTotemIndexes.Fire then
                CastSpellByName(Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].name);
                TTB_currentFireTotemIndex = TeronTotemBar_Options.SavedTotemIndexes.Fire;
                TTB_duration_Fire = Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].duration;
            else
                UIErrorsFrame:AddMessage("Fire Totem is already active or on cooldown!", 1, 0, 0, 1, 5);
            end
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
        insets = { left = d_insets, right = d_insets, top = d_insets, bottom = d_insets },
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
            if ((TTB_duration_Water == 0 or TTB_duration_Water == nil) and (TTB_cooldown_Water == 0 or TTB_cooldown_Water == nil)) or TTB_currentWaterTotemIndex == TeronTotemBar_Options.SavedTotemIndexes.Water then
                CastSpellByName(Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].name);
                TTB_currentWaterTotemIndex = TeronTotemBar_Options.SavedTotemIndexes.Water;
                TTB_duration_Water = Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].duration;
            else
                UIErrorsFrame:AddMessage("Water Totem is already active or on cooldown!", 1, 0, 0, 1, 5);
            end
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
        insets = { left = d_insets, right = d_insets, top = d_insets, bottom = d_insets },
    });
    AirBuffButtonHolder:SetScript("OnClick", function()
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("Air Buff Button Holder Clicked");
        end
        if arg1 == "LeftButton" then
            if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
                print(arg1);
            end
            if Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].name == nil then
                UIErrorsFrame:AddMessage("No Air Totem Selected", 1, 0, 0, 1, 5);
                return;
            end
            if ((TTB_duration_Air == 0 or TTB_duration_Air == nil) and (TTB_cooldown_Air == 0 or TTB_cooldown_Air == nil)) or TTB_currentAirTotemIndex == TeronTotemBar_Options.SavedTotemIndexes.Air then
                CastSpellByName(Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].name);
                TTB_currentAirTotemIndex = TeronTotemBar_Options.SavedTotemIndexes.Air;
                TTB_duration_Air = Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].duration;
            else
                UIErrorsFrame:AddMessage("Air Totem is already active or on cooldown!", 1, 0, 0, 1, 5);
            end
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
        insets = { left = d_insets, right = d_insets, top = d_insets, bottom = d_insets },
    });
    TotemicRecallBuffButtonHolder:SetScript("OnClick", function ()
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("Totemic Recall Buff Button Holder Clicked");
        end
        if arg1 == "LeftButton" then
            if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
                print(arg1);
            end
            if (TTB_recall_totem_CD == 0 or TTB_recall_totem_CD == nil) and (GetSpellCooldown(GetSpellByName(recall_Totems[1].name), BOOKTYPE_SPELL) == 0) then
                CastSpellByName(recall_Totems[1].name);
                TTB_recall_totem_CD = recall_Totems[1].cooldown + 1; -- Add 1 second to cooldown to avoid issues with the spell not being ready immediately
            
                TTB_duration_Earth = nil; -- Reset Earth Totem duration
                --TTB_cooldown_Earth = nil; -- Reset Earth Totem cooldown
                getglobal("TeronTotemBuffBar_Earth_ButtonHolder_Duration"):SetText("D: 0:00"); -- Reset Earth Font String
                --EarthCooldownText:SetText("CD: 0"); -- Reset Earth Cooldown Text
                TTB_duration_Fire = nil; -- Reset Fire Totem duration
                --TTB_cooldown_Fire = nil; -- Reset Fire Totem cooldown
                getglobal("TeronTotemBuffBar_Fire_ButtonHolder_Duration"):SetText("D: 0:00"); -- Reset Fire Font String
                --FireCooldownText:SetText("CD: 0"); -- Reset Fire Cooldown Text
                TTB_duration_Water = nil; -- Reset Water Totem duration
                --TTB_cooldown_Water = nil; -- Reset Water Totem cooldown
                getglobal("TeronTotemBuffBar_Water_ButtonHolder_Duration"):SetText("D: 0:00"); -- Reset Water Font String
                --WaterCooldownText:SetText("CD: 0"); -- Reset Water Cooldown Text
                TTB_duration_Air = nil; -- Reset Air Totem duration
                --TTB_cooldown_Air = nil; -- Reset Air Totem cooldown
                getglobal("TeronTotemBuffBar_Air_ButtonHolder_Duration"):SetText("D: 0:00"); -- Reset Air Font String
                --AirCooldownText:SetText("CD: 0"); -- Reset Air Cooldown Text
            end
        end
    end);

    --Weapon Enhancement Buff Button Holder
    WeaponEnhancementBuffButtonHolder = CreateFrame("Button", "TeronTotemBuffBar_WeaponEnhancement_ButtonHolder", TeronTotemBuffBarFrame);
    WeaponEnhancementBuffButtonHolder:SetWidth(TeronTotemBar_Options.BuffBar_Button_Handlers_Options.button_width);
    WeaponEnhancementBuffButtonHolder:SetHeight(TeronTotemBar_Options.BuffBar_Button_Handlers_Options.button_height);
    WeaponEnhancementBuffButtonHolder:SetPoint("LEFT", TotemicRecallBuffButtonHolder, "RIGHT", TeronTotemBar_Options.BuffBar_Button_Handlers_Options.offset_x, 0);
    WeaponEnhancementBuffButtonHolder:EnableMouse(true);
    WeaponEnhancementBuffButtonHolder:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = d_insets, right = d_insets, top = d_insets, bottom = d_insets },
    });
    WeaponEnhancementBuffButtonHolder:SetScript("OnClick", function ()
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("Weapon Enhancement Buff Button Holder Clicked");
        end
        if arg1 == "LeftButton" then
            if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
                print(arg1);
            end
            if WeaponEnhancements[TeronTotemBar_Options.SavedWeaponEnhancement].name == nil then
                UIErrorsFrame:AddMessage("No Weapon Enhancement Selected", 1, 0, 0, 1, 5);
                return;
            end
            if TTB_Current_Weapon_Enhancement ~= TeronTotemBar_Options.SavedWeaponEnhancement and (GetSpellCooldown(GetSpellByName(WeaponEnhancements[TeronTotemBar_Options.SavedWeaponEnhancement].name), BOOKTYPE_SPELL) == 0)  then
                CastSpellByName(WeaponEnhancements[TeronTotemBar_Options.SavedWeaponEnhancement].name);
                TTB_Current_Weapon_Enhancement = TeronTotemBar_Options.SavedWeaponEnhancement;
                TTB_Weapon_Enhancement_Timer = WeaponEnhancements[TeronTotemBar_Options.SavedWeaponEnhancement].duration;
                if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
                    print("Weapon Enhancement set to: " .. WeaponEnhancements[TeronTotemBar_Options.SavedWeaponEnhancement].name);
                    print("Weapon Enhancement duration: " .. WeaponEnhancements[TeronTotemBar_Options.SavedWeaponEnhancement].duration);
                end
            else
                UIErrorsFrame:AddMessage("Weapon Enhancement is already active!", 1, 0, 0, 1, 5);
            end
        end
    end)
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
    TotemicRecallBuffButton:SetPoint("LEFT", offset_x, 0);
    TotemicRecallBuffButton:SetNormalTexture(recall_Totems[1].icon);

    --Weapon Enhancement Button
    WeaponEnhancementBuffButton = CreateFrame("Button", "TeronTotemBuffBar_WeaponEnhancement_Button", WeaponEnhancementBuffButtonHolder);
    WeaponEnhancementBuffButton:SetWidth(button_size);
    WeaponEnhancementBuffButton:SetHeight(button_size);
    WeaponEnhancementBuffButton:SetPoint("LEFT", offset_x, 0);
    WeaponEnhancementBuffButton:SetNormalTexture(WeaponEnhancements[TeronTotemBar_Options.SavedWeaponEnhancement].icon);
end

--creates the font strings for the duration tracking
function CreateDurationText()
    local anchor = "RIGHT";
    local offset_x = -10;
    local offset_y = -7;

    --creates 4 fontstrings for the duration of each totem on the buff bar
    EarthFontString = EarthBuffButtonHolder:CreateFontString("TeronTotemBuffBar_Earth_ButtonHolder_Duration", "OVERLAY", "GameFontNormal");
    FireFontString = FireBuffButtonHolder:CreateFontString("TeronTotemBuffBar_Fire_ButtonHolder_Duration", "OVERLAY", "GameFontNormal");
    WaterFontString = WaterBuffButtonHolder:CreateFontString("TeronTotemBuffBar_Water_ButtonHolder_Duration", "OVERLAY", "GameFontNormal");
    AirFontString = AirBuffButtonHolder:CreateFontString("TeronTotemBuffBar_Air_ButtonHolder_Duration", "OVERLAY", "GameFontNormal");
    WeaponEanhancementFontString = WeaponEnhancementBuffButtonHolder:CreateFontString("TeronTotemBuffBar_WeaponEnhancement_ButtonHolder_Duration", "OVERLAY", "GameFontNormal");

    --Earth Font String
    EarthFontString:SetPoint(anchor, EarthBuffButtonHolder, offset_x, offset_y);
    EarthFontString:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
    EarthFontString:SetTextColor(1, 1, 1, 1); -- White color
    EarthFontString:SetText("D: 0:00");

    --Fire Font String
    FireFontString:SetPoint(anchor, FireBuffButtonHolder, offset_x, offset_y);
    FireFontString:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
    FireFontString:SetTextColor(1, 1, 1, 1); -- White color
    FireFontString:SetText("D: 0:00");

    --Water Font String
    WaterFontString:SetPoint(anchor, WaterBuffButtonHolder, offset_x, offset_y);
    WaterFontString:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
    WaterFontString:SetTextColor(1, 1, 1, 1); -- White color
    WaterFontString:SetText("D: 0:00");

    --Air Font String
    AirFontString:SetPoint(anchor, AirBuffButtonHolder, offset_x, offset_y);
    AirFontString:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
    AirFontString:SetTextColor(1, 1, 1, 1); -- White color
    AirFontString:SetText("D: 0:00");

    --Weapon Enhancement Font String
    WeaponEanhancementFontString:SetPoint(anchor, WeaponEnhancementBuffButtonHolder, offset_x, 0);
    WeaponEanhancementFontString:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
    WeaponEanhancementFontString:SetTextColor(1, 1, 1, 1); -- White color
    WeaponEanhancementFontString:SetText("D: 0:00");
end

--creates the font strings for the cooldown tracker
function CreateCooldownText()
    local anchor = "RIGHT";
    local offset_x = -10;
    local offset_y = 7;

    --creates the fontstrings
    EarthCooldownText = EarthBuffButtonHolder:CreateFontString("TeronTotemBuffBar_Earth_ButtonHolder_Cooldown", "OVERLAY", "GameFontNormal");
    FireCooldownText = FireBuffButtonHolder:CreateFontString("TeronTotemBuffBar_Fire_ButtonHolder_Cooldown", "OVERLAY", "GameFontNormal");
    WaterCooldownText = WaterBuffButtonHolder:CreateFontString("TeronTotemBuffBar_Water_ButtonHolder_Cooldown", "OVERLAY", "GameFontNormal");
    AirCooldownText = AirBuffButtonHolder:CreateFontString("TeronTotemBuffBar_Air_ButtonHolder_Cooldown", "OVERLAY", "GameFontNormal");
    TotemicRecallCooldownText = TotemicRecallBuffButtonHolder:CreateFontString("TeronTotemBuffBar_Totemic_Recall_ButtonHolder_Cooldown", "OVERLAY", "GameFontNormal");

    --Earth Cooldown Text
    EarthCooldownText:SetPoint(anchor, EarthBuffButtonHolder, offset_x, offset_y);
    EarthCooldownText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
    EarthCooldownText:SetTextColor(1, 1, 1, 1); -- White color
    EarthCooldownText:SetText("CD: 0");

    --Fire Cooldown Text
    FireCooldownText:SetPoint(anchor, FireBuffButtonHolder, offset_x, offset_y);
    FireCooldownText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
    FireCooldownText:SetTextColor(1, 1, 1, 1); -- White color
    FireCooldownText:SetText("CD: 0");

    --Water Cooldown Text
    WaterCooldownText:SetPoint(anchor, WaterBuffButtonHolder, offset_x, offset_y);
    WaterCooldownText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
    WaterCooldownText:SetTextColor(1, 1, 1, 1); -- White color
    WaterCooldownText:SetText("CD: 0");

    --Air Cooldown Text
    AirCooldownText:SetPoint(anchor, AirBuffButtonHolder, offset_x, offset_y);
    AirCooldownText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
    AirCooldownText:SetTextColor(1, 1, 1, 1); -- White color
    AirCooldownText:SetText("CD: 0");

    --Totemic Recall Cooldown Text
    TotemicRecallCooldownText:SetPoint(anchor, TotemicRecallBuffButtonHolder, offset_x, 0);
    TotemicRecallCooldownText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
    TotemicRecallCooldownText:SetTextColor(1, 1, 1, 1); -- White color
    TotemicRecallCooldownText:SetText("CD: 0");
end

--create Buff Bar Frame Text
function CreateBuffBarTitle()
    --creates the title holder for the buff bar
    BuffBarTitleHolder = CreateFrame("Frame", "TeronTotemBuffBar_TitleHolder", TeronTotemBuffBarFrame);
    BuffBarTitleHolder:SetWidth(200);
    BuffBarTitleHolder:SetHeight(30);
    BuffBarTitleHolder:EnableMouse(true);
    BuffBarTitleHolder:SetPoint("TOPLEFT", TeronTotemBuffBarFrame, 0, 20);
    BuffBarTitleHolder:SetScript("OnMouseDown", function()
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
            print("Buff Bar Title Holder Clicked");
        end
        if arg1 == "LeftButton" then
            if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
                print(arg1);
            end
            getglobal("TeronTotemAssignmentFrameHolder"):Show();
            getglobal("TeronTotemBar"):Show();
        end
    end);

    --creates the title text for the buff bar
    BuffBarTitle = BuffBarTitleHolder:CreateFontString("TeronTotemBuffBar_Title", "OVERLAY", "GameFontNormal");
    BuffBarTitle:SetPoint("LEFT", BuffBarTitleHolder, 0, 0);
    BuffBarTitle:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
    BuffBarTitle:SetTextColor(1, 1, 1, 1); -- White color
    BuffBarTitle:SetText("Teron Totem Buff Bar");
end

--StoneMagma CD Tracker
function CreateStoneMagmaCDTracker()
    StoneMagmaCDTracker = CreateFrame("Frame", "TeronTotemBar_StoneMagmaCDTracker", ActionButton1);
    StoneMagmaCDTracker:SetWidth(40);
    StoneMagmaCDTracker:SetHeight(40);
    StoneMagmaCDTracker:SetPoint("CENTER", 0, 0);
    StoneMagmaCDTrackerText = StoneMagmaCDTracker:CreateFontString("TeronTotemBar_StoneMagmaCDTrackerText", "OVERLAY", "GameFontNormal");
    StoneMagmaCDTrackerText:SetPoint("CENTER", StoneMagmaCDTracker, "CENTER", 0, 0);
    StoneMagmaCDTrackerText:SetFont("Fonts\\FRIZQT__.TTF", 18, "OUTLINE");
    StoneMagmaCDTrackerText:SetTextColor(1, 1, 1, 1); -- White color
    --StoneMagmaCDTrackerText:SetText("0");
end

--creates a title font string for the assignment frame
function CreateAssignmentFrameTitle()
    AssignmentFrameTitle = TeronTotemAssignmentFrameHolder:CreateFontString("TeronTotemAssignmentFrame_Title", "OVERLAY", "GameFontNormal");
    AssignmentFrameTitle:SetPoint("TOP", TeronTotemAssignmentFrameHolder, "TOP", 0, -10);
    AssignmentFrameTitle:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE");
    AssignmentFrameTitle:SetTextColor(1, 1, 1, 1); -- White color
    AssignmentFrameTitle:SetText("Teron Totem Assignment Frame");
end
function CreateAssignmentFrameExitButton()
    AssignmentFrameExitButton = CreateFrame("Button", "TeronTotemAssignmentFrame_ExitButton", TeronTotemAssignmentFrameHolder);
    AssignmentFrameExitButton:SetWidth(32);
    AssignmentFrameExitButton:SetHeight(32);
    AssignmentFrameExitButton:SetPoint("TOPRIGHT", TeronTotemAssignmentFrameHolder, -5, -5);
    AssignmentFrameExitButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up");
    AssignmentFrameExitButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down");
    AssignmentFrameExitButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight");
    AssignmentFrameExitButton:SetScript("OnClick", function()
        getglobal("TeronTotemAssignmentFrameHolder"):Hide();
        getglobal("TeronTotemBar"):Hide();
    end);
end
function CreateAssignmentFrameSettingsButton()
    AssignmentFrameSettingsButton = CreateFrame("Button", "TeronTotemAssignmentFrame_SettingsButton", TeronTotemAssignmentFrameHolder, "GameMenuButtonTemplate");
    AssignmentFrameSettingsButton:SetWidth(100);
    AssignmentFrameSettingsButton:SetHeight(20);
    AssignmentFrameSettingsButton:SetPoint("BOTTOMRIGHT", TeronTotemAssignmentFrameHolder, -10, 10);
    AssignmentFrameSettingsButton:SetText("Settings");
    AssignmentFrameSettingsButton:SetScript("OnClick", function()
        getglobal("TeronTotemSettingsFrame"):Show();
    end);
    
end

--END OF CREATION OF THE DIFFERENT KEY ELEMENTS OF THE ADDON

--LOADS THE FRAMES AND THEIR RESPECTIVE ELEMENTS AND SCRIPTS
--TeronTotemBar_OnLoad is called when the addon is loaded
function TeronTotemBar_OnLoad()
    local _,class = UnitClass("player")
    if class == "SHAMAN" then

        --sets main frame visibility + backdrop
        getglobal("TeronTotemBar"):Hide(); --Hidden by default
        getglobal("TeronTotemBar"):SetBackdrop({
            --bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            tileSize = 16,
            edgeSize = 16,
            insets = { left = 4, right = 4, top = 4, bottom = 4 },
        });
        --TeronTotemFrame:SetBackdropColor(0.1, 0, 0.7, 0.8); -- Set the background color

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
        getglobal("TeronTotemBar"):Hide();
        UIErrorsFrame:AddMessage("TeronTotemBar: You are not a Shaman!");
    end
end

--TeronTotemBar_OnLoad is called when the addon is loaded
function TeronTotemBuffBar_OnLoad()
    local _,class = UnitClass("player")
    if class == "SHAMAN" then
        --sets buff bar frame visibility + backdrop
        getglobal("TeronTotemBuffBar"):Show(); --Hidden by default
        getglobal("TeronTotemBuffBar"):SetBackdrop({
            --bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            tileSize = 16,
            edgeSize = 16,
        });
    else
        getglobal("TeronTotemBuffBar"):Hide();
        UIErrorsFrame:AddMessage("TeronTotemBar: You are not a Shaman!");
    end
end
function TeronTotemAssignmentFrameHolder_OnLoad()
    local _,class = UnitClass("player")
    if class == "SHAMAN" then
            getglobal("TeronTotemAssignmentFrameHolder"):SetBackdrop({
                bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
                edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                tile = true,
                tileSize = 16,
                edgeSize = 16,
                insets = { left = 4, right = 4, top = 4, bottom = 4 },
            });
            getglobal("TeronTotemAssignmentFrameHolder"):Hide();
    else
        UIErrorsFrame:AddMessage("TeronTotemBar: You are not a Shaman!");
        return;
    end
end
--END OF FRAME LOADS

--FRAME MOVEMENT HANDLERS
--assignment frame movement handlers
function TeronTotemFrame_MouseDown()
    if TeronTotemBar_Options.Assignment_Frame_Lock == false then
        getglobal("TeronTotemBar"):StartMoving()
        getglobal("TeronTotemBar").isMoving = true
        getglobal("TeronTotemBar").startPosX = getglobal("TeronTotemBar"):GetLeft()
        getglobal("TeronTotemBar").startPosY = getglobal("TeronTotemBar"):GetTop()
    end
end
function TeronTotemFrame_MouseUp()
    if (getglobal("TeronTotemBar").isMoving) then
        getglobal("TeronTotemBar"):StopMovingOrSizing()
        getglobal("TeronTotemBar").isMoving = false
    end
    if TeronTotemBar_Options.Assignment_Frame_Lock == false then
        if
            abs(getglobal("TeronTotemBar").startPosX - getglobal("TeronTotemBar"):GetLeft()) < 2 and
                abs(getglobal("TeronTotemBar").startPosY - getglobal("TeronTotemBar"):GetTop()) < 2
        then
            getglobal("TeronTotemBar"):Show()
        end
    else
        getglobal("TeronTotemFrame"):Show()
    end
    
end

--buff bar frame movement handlers
function TeronTotemBuffBar_MouseDown()
    if TeronTotemBar_Options.BuffBar_Frame_Lock == false then
        getglobal("TeronTotemBuffBar"):StartMoving()
        getglobal("TeronTotemBuffBar").isMoving = true
        getglobal("TeronTotemBuffBar").startPosX = getglobal("TeronTotemBuffBar"):GetLeft()
        getglobal("TeronTotemBuffBar").startPosY = getglobal("TeronTotemBuffBar"):GetTop()
    end
end
function TeronTotemBuffBar_MouseUp()
    if (getglobal("TeronTotemBuffBar").isMoving) then
        getglobal("TeronTotemBuffBar"):StopMovingOrSizing()
        getglobal("TeronTotemBuffBar").isMoving = false
    end
    if TeronTotemBar_Options.BuffBar_Frame_Lock == false then
        if
            abs(getglobal("TeronTotemBuffBar").startPosX - getglobal("TeronTotemBuffBar"):GetLeft()) < 2 and
                abs(getglobal("TeronTotemBuffBar").startPosY - getglobal("TeronTotemBuffBar"):GetTop()) < 2
        then
            getglobal("TeronTotemBuffBar"):Show()
        end
    else
        getglobal("TeronTotemBuffBar"):Show()
    end
end

function TeronTotemAssignmentFrameHolder_OnMouseDown()
    if TeronTotemBar_Options.Assignment_Frame_Lock == false then
        getglobal("TeronTotemAssignmentFrameHolder"):StartMoving()
        getglobal("TeronTotemAssignmentFrameHolder").isMoving = true
        getglobal("TeronTotemAssignmentFrameHolder").startPosX = getglobal("TeronTotemAssignmentFrameHolder"):GetLeft()
        getglobal("TeronTotemAssignmentFrameHolder").startPosY = getglobal("TeronTotemAssignmentFrameHolder"):GetTop()
    end
end
function TeronTotemAssignmentFrameHolder_OnMouseUp()
    if (getglobal("TeronTotemAssignmentFrameHolder").isMoving) then
        getglobal("TeronTotemAssignmentFrameHolder"):StopMovingOrSizing()
        getglobal("TeronTotemAssignmentFrameHolder").isMoving = false
    end
    if TeronTotemBar_Options.Assignment_Frame_Lock == false then
        if
            abs(getglobal("TeronTotemAssignmentFrameHolder").startPosX - getglobal("TeronTotemAssignmentFrameHolder"):GetLeft()) < 2 and
                abs(getglobal("TeronTotemAssignmentFrameHolder").startPosY - getglobal("TeronTotemAssignmentFrameHolder"):GetTop()) < 2
        then
            getglobal("TeronTotemAssignmentFrameHolder"):Show()
        end
    else
        getglobal("TeronTotemAssignmentFrameHolder"):Show()
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

--EVENT HANDLER FOR THE ASSIGNMENT FRAME HANDLER
function TeronTotemAssignmentFrameHolder_OnEvent()
    local _,class = UnitClass("player")
    if class == "SHAMAN" then
        if event == "PLAYER_ENTERING_WORLD" then
            UIErrorsFrame:AddMessage("TeronTotem Assignment Frame Holder Loaded", 1.0, 0.0, 0.0, 1.0, UIERRORS_HOLD_TIME);
        elseif event == "ADDON_LOADED" and arg1 == "TeronTotemBar" then
            if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
                print("TeronTotemBar Addon Loaded");
            end
            TeronTotemAssignmentFrameHolder_OnLoad();
            --loads the different elements of the assignment frame holder
            CreateAssignmentFrameTitle();
            CreateAssignmentFrameExitButton();
            CreateAssignmentFrameSettingsButton();
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
            CreateDurationText();
            CreateCooldownText();
            CreateBuffBarTitle();
            CreateStoneMagmaCDTracker();
        end
    else
        return;
    end
end
function TeronTotemBuffBar_OnUpdate(arg1, arg2)
    local TTB_buff;
    getglobal("TeronTotemBuffBar_Earth_ButtonHolder"):SetBackdropColor(1, 0, 0, 1); -- Red if buff is not active
    getglobal("TeronTotemBuffBar_Fire_ButtonHolder"):SetBackdropColor(1, 0, 0, 1); -- Red if buff is not active
    getglobal("TeronTotemBuffBar_Water_ButtonHolder"):SetBackdropColor(1, 0, 0, 1); -- Red if buff is not active
    getglobal("TeronTotemBuffBar_Air_ButtonHolder"):SetBackdropColor(1, 0, 0, 1); -- Red if buff is not active
    getglobal("TeronTotemBuffBar_WeaponEnhancement_ButtonHolder"):SetBackdropColor(1, 0, 0, 1); -- Red if buff is not active

    --check if the buff is active and color the button accordingly
    for TTB_index = 1, 40 do
        TTB_buff = UnitBuff("player", TTB_index)
        if TeronTotemBar_Options.TeronTotemBar_DebugMode == true and TTB_buff then
            print("Checking Earth Totem Buff: " .. TTB_buff);
        end
        if (TTB_buff and TTB_buff == Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].icon and TTB_currentEarthTotemIndex == TeronTotemBar_Options.SavedTotemIndexes.Earth) or (TTB_duration_Earth ~= 0 and TTB_duration_Earth ~= nil) then
            getglobal("TeronTotemBuffBar_Earth_ButtonHolder"):SetBackdropColor(0, 1, 0, 1); -- Green if buff is active
        end
        if (TTB_buff and TTB_buff == Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].icon and TTB_currentFireTotemIndex == TeronTotemBar_Options.SavedTotemIndexes.Fire) or (TTB_duration_Fire ~= 0 and TTB_duration_Fire ~= nil) then
            getglobal("TeronTotemBuffBar_Fire_ButtonHolder"):SetBackdropColor(0, 1, 0, 1); -- Green if buff is active

        end
        if (TTB_buff and TTB_buff == Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].icon and TTB_currentWaterTotemIndex == TeronTotemBar_Options.SavedTotemIndexes.Water) or (TTB_duration_Water ~= 0 and TTB_duration_Water ~= nil) then
            getglobal("TeronTotemBuffBar_Water_ButtonHolder"):SetBackdropColor(0, 1, 0, 1); -- Green if buff is active
        end
        if (TTB_buff and TTB_buff == Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].icon and TTB_currentAirTotemIndex == TeronTotemBar_Options.SavedTotemIndexes.Air) or (TTB_duration_Air ~= 0 and TTB_duration_Air ~= nil) then
            getglobal("TeronTotemBuffBar_Air_ButtonHolder"):SetBackdropColor(0, 1, 0, 1); -- Green if buff is active
        end
        if not TTB_buff then
            break; -- Exit the loop if any buff is found
        end
    end

    --update the colour for the weapon enhancement button
    if TTB_Current_Weapon_Enhancement == TeronTotemBar_Options.SavedWeaponEnhancement and (TTB_duration_WeaponEnhancement ~= 0 and TTB_duration_WeaponEnhancement ~= nil) then
        getglobal("TeronTotemBuffBar_WeaponEnhancement_ButtonHolder"):SetBackdropColor(0, 1, 0, 1); -- Green if buff is active
    else
        getglobal("TeronTotemBuffBar_WeaponEnhancement_ButtonHolder"):SetBackdropColor(1, 0, 0, 1); -- Red if buff is not active
    end

    --update the duration text for each totem
    if TTB_duration_Earth and TTB_currentEarthTotemIndex then
        TTB_duration_Earth = TTB_duration_Earth - arg1;
        getglobal("TeronTotemBuffBar_Earth_ButtonHolder_Duration"):SetText("D: " .. FormatTime(TTB_duration_Earth));
        if TTB_duration_Earth <= 0 or TTB_currentEarthTotemIndex ~= TeronTotemBar_Options.SavedTotemIndexes.Earth then
            getglobal("TeronTotemBuffBar_Earth_ButtonHolder_Duration"):SetText("D: 0:00");
            TTB_duration_Earth = nil; -- Reset the duration if it reaches zero
        end
    end
    if TTB_duration_Fire and TTB_currentFireTotemIndex then
        TTB_duration_Fire = TTB_duration_Fire - arg1;
        getglobal("TeronTotemBuffBar_Fire_ButtonHolder_Duration"):SetText("D: " .. FormatTime(TTB_duration_Fire));
        if TTB_duration_Fire <= 0 or TTB_currentFireTotemIndex ~= TeronTotemBar_Options.SavedTotemIndexes.Fire then
            getglobal("TeronTotemBuffBar_Fire_ButtonHolder_Duration"):SetText("D: 0:00");
            TTB_duration_Fire = nil; -- Reset the duration if it reaches zero
        end
    end
    if TTB_duration_Water and TTB_currentWaterTotemIndex then
        TTB_duration_Water = TTB_duration_Water - arg1;
        getglobal("TeronTotemBuffBar_Water_ButtonHolder_Duration"):SetText("D: " .. FormatTime(TTB_duration_Water));
        if TTB_duration_Water <= 0 or TTB_currentWaterTotemIndex ~= TeronTotemBar_Options.SavedTotemIndexes.Water then
            getglobal("TeronTotemBuffBar_Water_ButtonHolder_Duration"):SetText("D: 0:00");
            TTB_duration_Water = nil; -- Reset the duration if it reaches zero
        end
    end
    if TTB_duration_Air and TTB_currentAirTotemIndex then
        TTB_duration_Air = TTB_duration_Air - arg1;
        getglobal("TeronTotemBuffBar_Air_ButtonHolder_Duration"):SetText("D: " .. FormatTime(TTB_duration_Air));
        if TTB_duration_Air <= 0 or TTB_currentAirTotemIndex ~= TeronTotemBar_Options.SavedTotemIndexes.Air then
            getglobal("TeronTotemBuffBar_Air_ButtonHolder_Duration"):SetText("D: 0:00");
            TTB_duration_Air = nil; -- Reset the duration if it reaches zero
        end
    end
    if TTB_duration_WeaponEnhancement and TTB_Current_Weapon_Enhancement then
        TTB_duration_WeaponEnhancement = TTB_duration_WeaponEnhancement - arg1;
        getglobal("TeronTotemBuffBar_WeaponEnhancement_ButtonHolder_Duration"):SetText("D: " .. FormatTime(TTB_duration_WeaponEnhancement));
        if TTB_duration_WeaponEnhancement <= 0 or TTB_Current_Weapon_Enhancement ~= TeronTotemBar_Options.SavedWeaponEnhancement then
            getglobal("TeronTotemBuffBar_WeaponEnhancement_ButtonHolder_Duration"):SetText("D: 0:00");
            TTB_duration_WeaponEnhancement = nil; -- Reset the duration if it reaches zero
        end
    end

    --update the cooldown text for each totem
    if TTB_cooldown_Earth then
        TTB_cooldown_Earth = TTB_cooldown_Earth - arg1;
        getglobal("TeronTotemBuffBar_Earth_ButtonHolder_Cooldown"):SetText("CD: " .. FormatTimeSeconds(TTB_cooldown_Earth));
        if TTB_cooldown_Earth <= 0 then
            getglobal("TeronTotemBuffBar_Earth_ButtonHolder_Cooldown"):SetText("CD: 0");
            TTB_cooldown_Earth = nil; -- Reset the cooldown if it reaches zero
        end
    end
    if TTB_cooldown_Fire then
        TTB_cooldown_Fire = TTB_cooldown_Fire - arg1;
        getglobal("TeronTotemBuffBar_Fire_ButtonHolder_Cooldown"):SetText("CD: " .. FormatTimeSeconds(TTB_cooldown_Fire));
        if TTB_cooldown_Fire <= 0 then
            getglobal("TeronTotemBuffBar_Fire_ButtonHolder_Cooldown"):SetText("CD: 0");
            TTB_cooldown_Fire = nil; -- Reset the cooldown if it reaches zero
        end
    end
    if TTB_cooldown_Water then
        TTB_cooldown_Water = TTB_cooldown_Water - arg1;
        getglobal("TeronTotemBuffBar_Water_ButtonHolder_Cooldown"):SetText("CD: " .. FormatTimeSeconds(TTB_cooldown_Water));
        if TTB_cooldown_Water <= 0 then
            getglobal("TeronTotemBuffBar_Water_ButtonHolder_Cooldown"):SetText("CD: 0");
            TTB_cooldown_Water = nil; -- Reset the cooldown if it reaches zero
        end
    end
    if TTB_cooldown_Air then
        TTB_cooldown_Air = TTB_cooldown_Air - arg1;
        getglobal("TeronTotemBuffBar_Air_ButtonHolder_Cooldown"):SetText("CD: " .. FormatTimeSeconds(TTB_cooldown_Air));
        if TTB_cooldown_Air <= 0 then
            getglobal("TeronTotemBuffBar_Air_ButtonHolder_Cooldown"):SetText("CD: 0");
            TTB_cooldown_Air = nil; -- Reset the cooldown if it reaches zero
        end
    end

    --update totemic recall cooldown
    if TTB_recall_totem_CD then
        TTB_recall_totem_CD = TTB_recall_totem_CD - arg1;
        getglobal("TeronTotemBuffBar_Totemic_Recall_ButtonHolder_Cooldown"):SetText("CD: " .. FormatTimeSeconds(TTB_recall_totem_CD));
        if TTB_recall_totem_CD <= 0 then
            getglobal("TeronTotemBuffBar_Totemic_Recall_ButtonHolder_Cooldown"):SetText("CD: 0"); -- Reset the cooldown text if it reaches zero
            TTB_recall_totem_CD = nil; -- Reset the cooldown if it reaches zero
        end
    end

    --updates the global CD
    if TTB_globalCD == nil then
        TTB_globalCD = 0; -- Initialize global cooldown if not set
    end
    if TTB_globalCD >= 0 then
        TTB_globalCD = TTB_globalCD - arg1; 
    else
        TTB_globalCD = 0; -- Ensure the global cooldown does not go below zero
    end
    
    --StoneMagma Totem cooldown handler
    if TTB_MagmaTotemDuration then
        TTB_MagmaTotemDuration = TTB_MagmaTotemDuration - arg1;
        if TTB_MagmaTotemDuration <= 0 then
            TTB_MagmaTotemDuration = nil; -- Reset the duration if it reaches zero
        end
    end
    if TTB_StoneclawTotemCD then
        TTB_StoneclawTotemCD = TTB_StoneclawTotemCD - arg1;
        if TTB_StoneclawTotemCD <= 0 then
            TTB_StoneclawTotemCD = nil; -- Reset the cooldown if it reaches zero
        end
    end
    if TTB_StoneclawTotemCD and TTB_MagmaTotemDuration then
        if StoneMagmaCDTracker then
            getglobal("TeronTotemBar_StoneMagmaCDTrackerText"):SetText(FormatTimeSeconds(TTB_StoneclawTotemCD));
        end
        if TTB_StoneclawTotemCD <= 1 and TTB_MagmaTotemDuration <= 1 then
            if StoneMagmaCDTracker then
                getglobal("TeronTotemBar_StoneMagmaCDTrackerText"):SetText("");
            end
        end
    end
    if TTB_MagmaTotemDuration == nil and TTB_StoneclawTotemCD == nil then
        if StoneMagmaCDTracker then
            getglobal("TeronTotemBar_StoneMagmaCDTrackerText"):SetText("");
        end
    end

    --debug mode for the durations
    if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
        --print("Earth Totem Duration: " .. (TTB_duration_Earth or "nil"));
        --print("Fire Totem Duration: " .. (TTB_duration_Fire or "nil"));
        --print("Water Totem Duration: " .. (TTB_duration_Water or "nil"));
        --print("Air Totem Duration: " .. (TTB_duration_Air or "nil"));
        --print("Global Cooldown: " .. TTB_globalCD);
        --print("Magma Totem Duration: " .. (TTB_MagmaTotemDuration or "nil"));
    end
end

function TeronTotemBuffBar_Cast_TotemicRecall()
    if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
        print("Totemic Recall Buff Button Holder Clicked");
    end
    if (TTB_recall_totem_CD == 0 or TTB_recall_totem_CD == nil) and (GetSpellCooldown(GetSpellByName(recall_Totems[1].name), BOOKTYPE_SPELL) == 0) then
        CastSpellByName(recall_Totems[1].name);
        TTB_recall_totem_CD = recall_Totems[1].cooldown + 1; -- Add 1 second to cooldown to avoid issues with the spell not being ready immediately
    
        TTB_duration_Earth = nil; -- Reset Earth Totem duration
        --TTB_cooldown_Earth = nil; -- Reset Earth Totem cooldown
        getglobal("TeronTotemBuffBar_Earth_ButtonHolder_Duration"):SetText("D: 0:00"); -- Reset Earth Font String
        --EarthCooldownText:SetText("CD: 0"); -- Reset Earth Cooldown Text
        TTB_duration_Fire = nil; -- Reset Fire Totem duration
        --TTB_cooldown_Fire = nil; -- Reset Fire Totem cooldown
        getglobal("TeronTotemBuffBar_Fire_ButtonHolder_Duration"):SetText("D: 0:00"); -- Reset Fire Font String
        --FireCooldownText:SetText("CD: 0"); -- Reset Fire Cooldown Text
        TTB_duration_Water = nil; -- Reset Water Totem duration
        --TTB_cooldown_Water = nil; -- Reset Water Totem cooldown
        getglobal("TeronTotemBuffBar_Water_ButtonHolder_Duration"):SetText("D: 0:00"); -- Reset Water Font String
        --WaterCooldownText:SetText("CD: 0"); -- Reset Water Cooldown Text
        TTB_duration_Air = nil; -- Reset Air Totem duration
        --TTB_cooldown_Air = nil; -- Reset Air Totem cooldown
        getglobal("TeronTotemBuffBar_Air_ButtonHolder_Duration"):SetText("D: 0:00"); -- Reset Air Font String
        --AirCooldownText:SetText("CD: 0"); -- Reset Air Cooldown Text
    end
end

--END OF EVENT HANDLER FOR THE BUFF BAR FRAME

--SLASH COMMANDS HANDLER
--list of slash commands
function TeronTotemBar_SlashCommands(msg)
    if msg == "show" then
        getglobal("TeronTotemBar"):Show();
        UIErrorsFrame:AddMessage("TeronTotemBar: Assignment frame is now shown.");
    elseif msg == "hide" then
        getglobal("TeronTotemBar"):Hide();
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
    elseif msg == "stonemagma" then
        TeronTotemBar_Options.TeronTotemBar_StoneMagmaMode = not TeronTotemBar_Options.TeronTotemBar_StoneMagmaMode;
        if TeronTotemBar_Options.TeronTotemBar_StoneMagmaMode == true then
            getglobal("TeronTotemBar_StoneMagmaCDTrackerText"):Show();
            UIErrorsFrame:AddMessage("TeronTotemBar: StoneMagma mode is now on!");
        elseif TeronTotemBar_Options.TeronTotemBar_StoneMagmaMode == false then
            getglobal("TeronTotemBar_StoneMagmaCDTrackerText"):Hide();
            UIErrorsFrame:AddMessage("TeronTotemBar: StoneMagma mode is now off!");
        end
    elseif msg == "config" then
        getglobal("TeronTotemSettingsFrame"):Show();
        UIErrorsFrame:AddMessage("TeronTotemBar: Settings opened.");
    elseif msg == "help" then
        --list of slash commands
        print("TeronTotemBar list of slash commands:");
        print("/ttb show - shows the assignment frame");
        print("/ttb hide - hides the assignment frame");
        print("/ttb lock - locks both the assignment and buff frames in place");
        print("/ttb unlock - unlocks both the assignment and buff frames");
        print("/ttb stonemagma - enables/disables the StoneMagma mode");
        print("/ttb debug - enables/disables the debug mode for TeronTotemBar");
        print("/ttb config - opens the settings frame for TeronTotemBar");
    end
end
--END OF SLASH COMMANDS HANDLER

function FormatTime(time)
    if not time or time < 0 then
        return ""
    end
    TTB_mins = floor(time / 60)
    TTB_secs = time - (TTB_mins * 60)
    return string.format("%d:%02d", TTB_mins, TTB_secs)
end
function FormatTimeSeconds(time)
    if not time or time < 0 then
        return ""
    end
    TTB_seconds_only = floor(time)
    return string.format("%d", TTB_seconds_only)
end

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
    getglobal("TeronTotemBar_Earth_Button"):SetNormalTexture(Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].icon);
    --hides the old buff buttons on the buff bar
    getglobal("TeronTotemBuffBar_Earth_Button"):Hide();
    getglobal("TeronTotemBuffBar_Fire_Button"):Hide();
    getglobal("TeronTotemBuffBar_Water_Button"):Hide();
    getglobal("TeronTotemBuffBar_Air_Button"):Hide();
    --creates the new buff buttons with the newly assigned totems
    CreateBuffButtons();
end
function UpdateFireButtonIcon()
    getglobal("TeronTotemBar_Fire_Button"):SetNormalTexture(Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].icon);
    --hides the old buff buttons on the buff bar
    getglobal("TeronTotemBuffBar_Earth_Button"):Hide();
    getglobal("TeronTotemBuffBar_Fire_Button"):Hide();
    getglobal("TeronTotemBuffBar_Water_Button"):Hide();
    getglobal("TeronTotemBuffBar_Air_Button"):Hide();
    --creates the new buff buttons with the newly assigned totems
    CreateBuffButtons();
end
function UpdateWaterButtonIcon()
    getglobal("TeronTotemBar_Water_Button"):SetNormalTexture(Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].icon);
    --hides the old buff buttons on the buff bar
    getglobal("TeronTotemBuffBar_Earth_Button"):Hide();
    getglobal("TeronTotemBuffBar_Fire_Button"):Hide();
    getglobal("TeronTotemBuffBar_Water_Button"):Hide();
    getglobal("TeronTotemBuffBar_Air_Button"):Hide();
    --creates the new buff buttons with the newly assigned totems
    CreateBuffButtons();
end
function UpdateAirButtonIcon()
    getglobal("TeronTotemBar_Air_Button"):SetNormalTexture(Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].icon);
    --hides the old buff buttons on the buff bar
    getglobal("TeronTotemBuffBar_Earth_Button"):Hide();
    getglobal("TeronTotemBuffBar_Fire_Button"):Hide();
    getglobal("TeronTotemBuffBar_Water_Button"):Hide();
    getglobal("TeronTotemBuffBar_Air_Button"):Hide();
    --creates the new buff buttons with the newly assigned totems
    CreateBuffButtons();
end
function UpdateWeaponEnhancementButtonIcon()
    getglobal("TeronTotemBar_WeaponEnhancement_Button"):SetNormalTexture(WeaponEnhancements[TeronTotemBar_Options.SavedWeaponEnhancement].icon);
    --hides the old buff buttons on the buff bar
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

function AutoCastTotems()
    DoEmote("stand"); -- Emote to eliminate the bug which occurs when casting totems while sitting
    --SpellStopCasting(); -- Stop any ongoing spell casting to ensure totems are cast immediately

    --cast Earth Totem
    if TTB_globalCD == 0 and Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].name then
        if (TTB_duration_Earth == 0 or TTB_duration_Earth == nil) and (TTB_cooldown_Earth == 0 or TTB_cooldown_Earth == nil) then
            CastSpellByName(Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].name);
            TTB_duration_Earth = Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].duration;
            TTB_cooldown_Earth = Earth_Totems[TeronTotemBar_Options.SavedTotemIndexes.Earth].cooldown;
            TTB_globalCD = 0.2; -- Set global cooldown for the next totem cast
        else
            UIErrorsFrame:AddMessage("Earth Totem is already active or on cooldown!", 1, 0, 0, 1, 5);
        end
    end

    --cast Fire Totem (check if the previous totem is still under global cooldown)
    if TTB_globalCD == 0 and Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].name then
        if (TTB_duration_Fire == 0 or TTB_duration_Fire == nil) and (TTB_cooldown_Fire == 0 or TTB_cooldown_Fire == nil) then
            CastSpellByName(Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].name);
            TTB_duration_Fire = Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].duration;
            TTB_cooldown_Fire = Fire_Totems[TeronTotemBar_Options.SavedTotemIndexes.Fire].cooldown;
            TTB_globalCD = 0.2; -- Set global cooldown for the next totem cast
        else
            UIErrorsFrame:AddMessage("Fire Totem is already active or on cooldown!", 1, 0, 0, 1, 5);
        end
    end

    --cast Water Totem (check if the previous totem is still under global cooldown)
    if TTB_globalCD == 0 and Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].name then
        if (TTB_duration_Water == 0 or TTB_duration_Water == nil) and (TTB_cooldown_Water == 0 or TTB_cooldown_Water == nil) then
            CastSpellByName(Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].name);
            TTB_duration_Water = Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].duration;
            TTB_cooldown_Water = Water_Totems[TeronTotemBar_Options.SavedTotemIndexes.Water].cooldown;
            TTB_globalCD = 0.2; -- Set global cooldown for the next totem cast
        else
            UIErrorsFrame:AddMessage("Water Totem is already active or on cooldown!", 1, 0, 0, 1, 5);
        end
    end

    --cast Air Totem (check if the previous totem is still under global cooldown)
    if TTB_globalCD == 0 and Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].name then
        if (TTB_duration_Air == 0 or TTB_duration_Air == nil) and (TTB_cooldown_Air == 0 or TTB_cooldown_Air == nil) then
            CastSpellByName(Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].name);
            TTB_duration_Air = Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].duration;
            TTB_cooldown_Air = Air_Totems[TeronTotemBar_Options.SavedTotemIndexes.Air].cooldown;
            TTB_globalCD = 0.2; -- Reset global cooldown for the next totem cast
        else
            UIErrorsFrame:AddMessage("Air Totem is already active or on cooldown!", 1, 0, 0, 1, 5);
        end
    end
    TargetLastEnemy();
    if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
        print("TeronTotemBar: Auto casting totems.");
    end
end

--Stoneclaw Totem + Magma Totem (with cooldown/duration check)
function CastStoneMagma()
    DoEmote("stand"); -- Emote to eliminate the bug which occurs when casting totems while sitting
    --SpellStopCasting(); -- Stop any ongoing spell casting to ensure totems are cast immediately

    if TeronTotemBar_Options.TeronTotemBar_DebugMode == true then
        print(FormatTime(TTB_MagmaTotemDuration));
       print(FormatTime(TTB_globalCD));
    end

    if TeronTotemBar_Options.TeronTotemBar_StoneMagmaMode == true then
        -- Check if Stoneclaw Totem is on cooldown or not
        if TTB_globalCD == 0 then
            if (TTB_StoneclawTotemCD == 0 or TTB_StoneclawTotemCD == nil) and GetSpellCooldown(GetSpellByName("Stoneclaw Totem"), BOOKTYPE_SPELL) == 0 then
                CastSpellByName("Stoneclaw Totem");
                TTB_StoneclawTotemCD = 30; -- Set cooldown for Stoneclaw Totem
                TTB_globalCD = 0.2; -- Set global cooldown for the next totem cast
            else
                UIErrorsFrame:AddMessage("Stoneclaw Totem is on cooldown", 1, 0, 0, 1, 5);
            end
        end
        -- Check if Magma Totem is active or not
        if TTB_globalCD == 0 then
            if TTB_MagmaTotemDuration == 0 or TTB_MagmaTotemDuration == nil then
                CastSpellByName("Magma Totem");
                TTB_MagmaTotemDuration = 30; -- Reset the duration for Magma Totem
                TTB_globalCD = 0.2; -- Set global cooldown for the next totem cast
            else
                UIErrorsFrame:AddMessage("Magma Totem is already active", 1, 0, 0, 1, 5);
            end
        end
    end
    TargetLastEnemy();
end
