# TeronTotemBar
An addon that displays a totem bar and can also be used to assign totems to all shamans in your party/raid.

## Change Log
### V1.2.1
- Once again the Buff Bar frame has been adjusted to accommodate the new Weapon Enhancement Buff Button
- Fixed some bugs with the Autocast Totem function of the addon
- Improved the keybinds for better accessibility and visibility
- Added a new keybind for Totemic Recall
- Improved the Buff Bar Totem aura tracker (if you change the assigned totems in the assignment frame the buff buttons should appear red, unless the totems cast match the totems assigned)
### V1.2.0
- Fixed the frames, they should show up properly now on any client
- Added a new and improved assignement frame with better visibility and a proper close button
- Added a new button in the assignment frame which will be used to assign weapon enhancements for shamans (under development)
- Made some changes to the settings menu
- The assignment frame can now be opened using the frame title above the Buff Bar - "Teron Totem Buff Bar". Simply clicking it will open the assignment menu.
- Added a button in the assignment frame which opens the settings (bottom right corner).
### v1.1.0
- Added a new function which allows the simultaneous cast of Stoneclaw/Mgama Totem for shaman tanks (the feature can be turned on optionally)
- Fixed the Totem Auto Cast function which cycles through the assigned totems; now it also tracks totems with their CD (if they have one)
- Fixed the StoneMagma function (it should now work properly when enabled)
- Added a new settings menu, but it is still under development

## How to use the addon:

- As of right now the addon consists of two frames with two simple functions - to assign and cast the assigned totems
- In order to assign which totem you would like to cast, siply type **/ttb show**. This command will bring up the main assignment frame where you can select a totem of each element.
- After you have selected the totems that you would like to cast, they will show up on the second frame (the Buff Bar) where (as of right now this is the only working functionality) you can click on each of the buttons for the respective element (earth, fire, water, air) and the addon will cast each totem
- The Buff Bar tracks only whether the player that casted the totems has their aura effect on himself (for now, working on a CD and duration tracker)

## Screenshots:
### Main Assignment Frame
- contains a "scrollable" totem icon for each of the element types (earth, fire, water and air)
- simply put the mouse cursor on top of the totem that you wish to change and use the mouse wheel to scroll up or down until you reach the totem you would like to cast for the respective element
- if you wish to cast nothing (leave an empty totem slot for a specific element) look for a symbol that looks like the greed button when items are rolled

*On this screenshot you can see the assignment frame with 4 totems assigned for each element*
![Screenshot 2025-05-27 165128](https://github.com/user-attachments/assets/835be4d6-a027-4347-86af-6bd84619361c)

*On this screenshot you can see that 2 of the elements were left empty (no totems was assigned to Earth and Fire)*
![Screenshot 2025-05-27 165610](https://github.com/user-attachments/assets/66096c28-b381-4232-86ea-7010700d5922)

### Buff Bar Frame
- contains 5 clickable buttons (1 for each element plus one extra for Totemic Recall)
- shows whether the caster has the aura of the respective totem (which was previously cast by the addon)
- planned features: CD and duration tracker; one-button function that casts all four totems consecutively

*On this screenshot you can see the Buff Bar. The element buttons appear red, because no totem has been cast and the player has no totem auras applied on him.*
![Screenshot 2025-05-27 165212](https://github.com/user-attachments/assets/56a57ba0-1ab9-477f-a976-b2de76814db8)

*On this screenshot the Buff Bar buttons are now green, showing that the player clicked on them and casted the respective totems.*
![Screenshot 2025-05-27 165221](https://github.com/user-attachments/assets/7dc1a90f-99b5-46a1-86aa-3e7d1171c62b)

## Slash Commands for the addon

- /ttb show - shows the assignment frame
- /ttb hide - hides the assignment frame
- /ttb lock - locks both the assignment and buff frames in place
- /ttb unlock - unlocks both the assignment and buff frames
- /ttb debug - enables/disables the debug mode for TeronTotemBar
