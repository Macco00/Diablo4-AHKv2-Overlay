# Diablo4-AHKv2-Overlay
*Based on this reddit [post](https://www.reddit.com/r/ultrawidemasterrace/comments/142tdxh/diablo_iv_set_up_as_blizzard_does_not_support_329/) aimed at addressing "super ultra-wide" aspect ratios for Diablo 4. I wasn't able to get that version working so I made my own.*

Copies parts of the player HUD, based on user settings, and draws it on top of the game using [OnTopReplica](https://github.com/LorenzCK/OnTopReplica)
<img src="https://github.com/Macco00/Diablo4-AHKv2-Overlay/assets/3450735/1ee1b118-69a3-45be-a221-841ad8623b2f" alt="gui" width="600"/>

Diablo 4 doesn't support overly wide aspect ratios and leaves two black pillars if the maximum is exceeded. This project aims to utilize the unused area created by these black pillars by displaying the player's health and mana. Extra elements such as skills can also be drawn and configured to be closer to the player character.

*5140x1440 resolution with and without the program running.*
<img src="https://github.com/Macco00/Diablo4-AHKv2-Overlay/assets/3450735/cb7a0576-ef2d-41a9-92e9-82d809b27a3d" alt="D4ovrFS-min" width="900"/>
<img src="https://github.com/Macco00/Diablo4-AHKv2-Overlay/assets/3450735/75f37b48-f6a8-4252-b748-87d93c413cfa" alt="D4ref-min" width="900"/>


Multiple instances of OnTopReplica are booted through a batchfile with options for: region to capture, window position, window size, and opacity.

<img src="https://github.com/Macco00/Diablo4-AHKv2-Overlay/assets/3450735/d7e133bb-e481-4326-9196-e15d540afa66" alt="D4hud" width="600"/>

## Demo
https://github.com/Macco00/Diablo4-AHKv2-Overlay/assets/3450735/fc0d08ba-d8ba-4885-89e7-26009de91d3a

