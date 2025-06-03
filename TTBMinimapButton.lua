--UNDER DEVELOPMENT
TeronTotemSettingsFrame = CreateFrame("Frame", "TeronTotemSettingsFrame", UIParent)
TeronTotemSettingsFrame:SetWidth(400);
TeronTotemSettingsFrame:SetHeight(400);
TeronTotemSettingsFrame:SetPoint("CENTER", 0, 0); 

--Register for events
TeronTotemSettingsFrame:RegisterEvent("ADDON_LOADED");
TeronTotemSettingsFrame:SetScript("OnEvent", function ()
    if event == "ADDON_LOADED" then
        --sets the initial look of the settings frame
        TeronTotemSettingsFrame_OnLoad();

        --loads the different elements of the settings frame
        CreateSettingsMenuTitle();
        CreateExitSettingsButton();
        CreateSettingsMenuDescriptions();
        CreateSettingsMenuButtons();
    end
end)


--sets the initial look of the settings frame
function TeronTotemSettingsFrame_OnLoad()
    TeronTotemSettingsFrame:Hide();
    TeronTotemSettingsFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, 
    tileSize = 32, 
    edgeSize = 32,
    insets = { left = 11, right = 12, top = 12, bottom = 11 }
    });
    TeronTotemSettingsFrame:SetBackdropColor(0.5, 0.5, 0.5, 0.8) --default color
    TeronTotemSettingsFrame:EnableMouse(true);
    TeronTotemSettingsFrame:SetMovable(true);
    TeronTotemSettingsFrame:RegisterForDrag("LeftButton");
    TeronTotemSettingsFrame:SetScript("OnMouseDown", function() 
        TeronTotemSettingsFrame_OnMouseDown();
    end);
    TeronTotemSettingsFrame:SetScript("OnMouseUp", function() 
        TeronTotemSettingsFrame_OnMouseUp();
    end);
end

--creates the title of the settings menu
function CreateSettingsMenuTitle()
    local offset_y = -20;
    SettingsMenuTitle = TeronTotemSettingsFrame:CreateFontString("TeronTotemSettingsFrame_Title", "BACKGROUND")
    SettingsMenuTitle:SetPoint("TOP", 0, offset_y);
    SettingsMenuTitle:SetFont("Fonts\\FRIZQT__.TTF", 20, "OUTLINE")
    SettingsMenuTitle:SetTextColor(1, 1, 1, 1) --white color
    SettingsMenuTitle:SetText("Teron Totem Bar Settings");
end

--Creates the exit button for the settings menu
function CreateExitSettingsButton()
    local offset_x = -10;
    local offset_y = -10;
    ExitButton = CreateFrame("Button", "Settings_Exit_Button", TeronTotemSettingsFrame);
    ExitButton:SetWidth(32);
    ExitButton:SetHeight(32);
    ExitButton:SetPoint("TOPRIGHT", offset_x, offset_y);
    ExitButton:EnableMouse(true);
    ExitButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up");
    ExitButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down");
    ExitButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight");
    ExitButton:SetScript("OnClick", function()
        TeronTotemSettingsFrame:Hide();
    end);
end

--creates the option names and descriptions, also the buttons for the settings menu
function CreateSettingsMenuDescriptions()
    local offset_y = -40;
    local general_offset_y = -100;
    local general_offset_x = 20;
    local alt_text_offset_y = -10;
    --Creates the FontStrings
    Assignment_Frame_Visibility_Text = TeronTotemSettingsFrame:CreateFontString("TeronTotemSettingsFrame_Assignment_Frame_Visibility_Text", "BACKGROUND")
    Frame_Locking_Text = TeronTotemSettingsFrame:CreateFontString("TeronTotemSettingsFrame_Frame_Locking_Text", "BACKGROUND")
    Debug_Mode_Text = TeronTotemSettingsFrame:CreateFontString("TeronTotemSettingsFrame_Debug_Mode_Text", "BACKGROUND")
    StoneMagma_Mode_Text = TeronTotemSettingsFrame:CreateFontString("TeronTotemSettingsFrame_StoneMagma_Mode_Text", "BACKGROUND")

    --creates the description
    Alt_Text_1 = TeronTotemSettingsFrame:CreateFontString("TeronTotemSettingsFrame_Alt_Text_1", "BACKGROUND")
    Alt_Text_1:SetPoint("LEFT", Frame_Locking_Text, 0, alt_text_offset_y);
    Alt_Text_1:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
    Alt_Text_1:SetTextColor(1, 1, 1, 1) --white color
    Alt_Text_1:SetText("You can use the right mouse button to drag the frames around, if they're unlocked.");

    Alt_Text_2 = TeronTotemSettingsFrame:CreateFontString("TeronTotemSettingsFrame_Alt_Text_2", "BACKGROUND")
    Alt_Text_2:SetPoint("LEFT", Debug_Mode_Text, 0, alt_text_offset_y);
    Alt_Text_2:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
    Alt_Text_2:SetTextColor(1, 1, 1, 1) --white color
    Alt_Text_2:SetText("(When enabled shows additional information in the chat window about addon actions.)");

    Alt_Text_3 = TeronTotemSettingsFrame:CreateFontString("TeronTotemSettingsFrame_Alt_Text_3", "BACKGROUND")
    Alt_Text_3:SetPoint("LEFT", StoneMagma_Mode_Text, 0, alt_text_offset_y);
    Alt_Text_3:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
    Alt_Text_3:SetTextColor(1, 1, 1, 1) --white color
    Alt_Text_3:SetText("(When enabled shows the StoneMagma mode, which is a custom setting and not suggested for use.)");

    --creates the description for the Frame locking button
    Frame_Locking_Text:SetPoint("TOPLEFT", TeronTotemSettingsFrame, general_offset_x, general_offset_y)
    Frame_Locking_Text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    Frame_Locking_Text:SetTextColor(1, 1, 1, 1) --white color
    Frame_Locking_Text:SetText("Locks both the assignment and buff frames in place")
    
    --creates the description for the Debug mode button
    Debug_Mode_Text:SetPoint("LEFT", Frame_Locking_Text, 0, offset_y)
    Debug_Mode_Text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    Debug_Mode_Text:SetTextColor(1, 1, 1, 1) --white color
    Debug_Mode_Text:SetText("Enables/disables the debug mode")

    --creates the description for the StoneMagma mode button
    StoneMagma_Mode_Text:SetPoint("LEFT", Debug_Mode_Text, 0, offset_y)
    StoneMagma_Mode_Text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    StoneMagma_Mode_Text:SetTextColor(1, 1, 1, 1) --white color
    StoneMagma_Mode_Text:SetText("Enables/disables the StoneMagma mode")

end
function CreateSettingsMenuButtons()
    local offset_x = 0;
    local offset_y = 10;
    local check_box_size = 30;

    Frame_Locking_Button = CreateFrame("CheckButton", "TeronTotemSettingsFrame_Frame_Locking_Button", TeronTotemSettingsFrame, "OptionsCheckButtonTemplate")
    Debug_Mode_Button = CreateFrame("CheckButton", "TeronTotemSettingsFrame_Debug_Mode_Button", TeronTotemSettingsFrame, "OptionsCheckButtonTemplate")
    StoneMagma_Mode_Button = CreateFrame("CheckButton", "TeronTotemSettingsFrame_StoneMagma_Mode_Button", TeronTotemSettingsFrame, "OptionsCheckButtonTemplate")

    Frame_Locking_Button:SetPoint("RIGHT", Frame_Locking_Text, offset_x, 0)
    Frame_Locking_Button:SetWidth(check_box_size);
    Frame_Locking_Button:SetHeight(check_box_size);
    Frame_Locking_Button:SetScript("OnClick", function()
        if Frame_Locking_Button:GetChecked() then
            TeronTotemBar_Options.Assignment_Frame_Lock = true;
            TeronTotemBar_Options.BuffBar_Frame_Lock = true;
        else
            TeronTotemBar_Options.Assignment_Frame_Lock = false;
            TeronTotemBar_Options.BuffBar_Frame_Lock = false;
        end
    end);
    
    Debug_Mode_Button:SetPoint("RIGHT", Debug_Mode_Text, offset_x, 0)
    Debug_Mode_Button:SetWidth(check_box_size);
    Debug_Mode_Button:SetHeight(check_box_size);
    Debug_Mode_Button:SetScript("OnClick", function()
        if Debug_Mode_Button:GetChecked() then
            TeronTotemBar_Options.TeronTotemBar_DebugMode = true;
        else
            TeronTotemBar_Options.TeronTotemBar_DebugMode = false;
        end
    end);

    StoneMagma_Mode_Button:SetPoint("RIGHT", StoneMagma_Mode_Text, offset_x, 0)
    StoneMagma_Mode_Button:SetWidth(check_box_size);
    StoneMagma_Mode_Button:SetHeight(check_box_size);
    StoneMagma_Mode_Button:SetScript("OnClick", function()
        if StoneMagma_Mode_Button:GetChecked() then
            TeronTotemBar_Options.TeronTotemBar_StoneMagmaMode = true;
        else
            TeronTotemBar_Options.TeronTotemBar_StoneMagmaMode = false;
        end
    end);


end

--Settings menu on mouse events
function TeronTotemSettingsFrame_OnMouseDown()
    TeronTotemSettingsFrame:StartMoving();
    TeronTotemSettingsFrame.isMoving = true;
    TeronTotemSettingsFrame.startPosX = TeronTotemSettingsFrame:GetLeft();
    TeronTotemSettingsFrame.startPosY = TeronTotemSettingsFrame:GetTop();
end
function TeronTotemSettingsFrame_OnMouseUp()
    if TeronTotemSettingsFrame.isMoving then
        TeronTotemSettingsFrame:StopMovingOrSizing();
        TeronTotemSettingsFrame.isMoving = false;

    end
    if abs(TeronTotemSettingsFrame.startPosX - TeronTotemSettingsFrame:GetLeft()) < 2 and abs(TeronTotemSettingsFrame.startPosY - TeronTotemSettingsFrame:GetTop()) < 2 then
        TeronTotemSettingsFrame:Show();
    end
end