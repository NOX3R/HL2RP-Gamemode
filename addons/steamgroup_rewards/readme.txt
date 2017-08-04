Thanks for purchasing Steam Group Rewards!
-----------------------------------------
There's not much here, since SteamGroup Rewards was built from the ground up to be super configurable and easy to customize!

Installation
---------------
Unzip the download, and put SteamGroup Rewards into the addons folder
If you use FastDL on your server, add the materials/resource/sound folders to your FastDL directory
Resources inside the addon are added automatically

Configuration
--------------
Configure core settings, theme (colors, text, logo etc) and rewards.  -- lua/sh_rewardsconfig.lua

Administration Commands (Must be a superadmin or RCON to run these commands!)
--------------
rewards_reset - Resets all group rewards, so players can claim their rewards again. If you want to change the rewards be sure to use this command afterwards.
rewards_reset "STEAM_0:1:1234567" - Resets the group rewards for a specific SteamID only.

Configuration for MySQL (Optional)
--------------
If you want to share your rewards data across multiple servers, Steam Group Rewards supports storing its data in MySQL.
You need to replace the following files with the files in lua/mysqlserver/

1. sv_modernrewards.lua
2. sv_rewardsdata.lua

To use MySQL your server needs to be running the gm_MySQLOO module, the module is available for free. To install it
see this link: http://www.facepunch.com/showthread.php?t=1220537

You will also need to configure your MySQL connection details in the sv_rewardsdata.lua file you copied over from the
mysqlserver folder. 

MySQL configuration is optional. If you have multiple servers but want different rewards on each server (or you
want players to be able to claim the reward on all of your servers) then you don't need to use MySQL.

Need more help?
Steam: http://steamcommunity.com/id/chuteuk/
Skype: Chuteuk