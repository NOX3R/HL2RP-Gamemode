 ItemStore
===========

Thanks for purchasing ItemStore! ItemStore is an inventory addon that aims
to be modular and flexible, allowing server owners to configure it to their
own personal preferences and give their players a customized experience
that works hand in hand with their RP gamemode.

This document will provide a couple of important steps critical to setting up
and configuring ItemStore on your server. Please read through it before
opening support tickets or PMing me.

I'm always open to feature requests. Minor additions can be done for free,
but it is not a right but rather a privilege, so I won't always be accepting.
Paid jobs to add support for various things are usually NOT accepted,
but sometimes I will be in the mood for it. Don't hesitate to ask.

 Installtion
=============

To install ItemStore, extract it to your server's addons/ directory and restart.

To add the large and small containers to your F4 menu, add these AddEntity definitions
to whereever you typical add them:

AddEntity( "Large Container", "itemstore_box_large", "models/props/cs_office/Cardboard_box01.mdl", 100, 3, "buylargebox" )
AddEntity( "Small Container", "itemstore_box_small", "models/props/cs_office/Cardboard_box02.mdl", 200, 3, "buysmallbox" )

If ItemStore isn't loading on your server, rename the addon folder to something all
lowercase, for example, "itemstore" instead of "ItemStore".

If you're running DarkRP 2.4, make sure to go into lua/itemstore/config.lua and change
itemstore.config.Gamemode from "darkrp25" to "darkrp24".

For MySQL setup, refer to mysqlsetup.txt, located in the same folder as this readme.

 Configuration
===============

There is a configuration file located in lua/itemstore/config.lua. All settings are
documented in that file. 

Additionally, here's a list of CVars. Change these by entering the command in your server's
console followed by the value you wish to change it to.

itemstore_box_small_w: The width of the small box's inventory
itemstore_box_small_h: The height of the small box's inventory
itemstore_box_large_w: The width of the large box's inventory
itemstore_box_large_h: The height of the small box's inventory
itemstore_box_breakable: Setting this to 1 will make boxes breakable. 0 by default.
itemstore_trading: Setting this to 0 will disable trading
itemstore_dropondeath: Setting this to 1 will cause the player to drop their entire inventory into a box when they die
itemstore_dropondeath_linger: The amount of time in minutes that the death box should remain on the map
itemstore_inventory_persist: If set to 1, player's inventories will persist between sessions (rejoins, map changes, etc).
itemstore_darkrp_ignoreowner: If this is set to 0, players will only be able to pick up their own entities.
itemstore_ctrle: Setting this to 0 will turn off the ctrl + E pickup option. Useful if you have a weapon pack or entity that conflicts.
itemstore_trading_distance: The distance in hammer units that players must be within to trade. 0 means players can trade anywhere on the map.
itemstore_trading_cooldown: The time in seconds that players must wait before initiating another trade.

You may need to restart your server for some of these to take effect.

 Adding Entities to the Inventory
==================================

If you want to add support for an entity to the inventory, please run
lua/itemstore/items/_Add New Item_.bat. This file will walk you through the process of
adding support to mostly any entity that would otherwise work with the duplicator.

If the entity still does not work properly (creates lua errors when interacted with in
the inventory, etc), then you may have to code your own item definition.

Have a look at lua/itemstore/items/spawned_weapon.lua. This is the definition file for
DarkRP's spawned_weapon and contains plenty of examples of how the inventory functions
and manages its items internally. 

Please do not PM me for support for items you have created. PMing me for support for
making an item is okay, but don't expect me to hand you a completed item definition.