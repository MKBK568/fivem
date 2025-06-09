# 404_ox_restricted_items

## Introduction
This is a plugin developed for the FiveM OX inventory system, allowing server administrators to set specific items as non-movable, non-tradeable but consumable items.

## Features
- Prevents players from moving, trading, or dropping specified items
- Allows players to consume these items
- Administrators can add or remove these items by opening player inventories
- Simple configuration, just add item names in the config file
- Multi-language support (English, Chinese, Spanish, French)

## Installation
1. Download this resource
2. Place the folder in your server resources directory
3. Add `ensure 404_ox_restricted_items` to your `server.cfg`
4. Modify the `config/config.lua` file to add the items you want to restrict

## Configuration
In the `config/config.lua` file, you can:
- Add the items you want to restrict to the `RestrictedItems` table
- Change the language setting (`en`, `zh_cn`, `es`, `fr`)
- Customize notification messages for each language
- Enable/disable debug mode

## Dependencies
- [ox_inventory](https://github.com/overextended/ox_inventory)
- [ox_lib](https://github.com/overextended/ox_lib) (for notifications)

## Usage
After setting up the restricted items in the configuration file, players will not be able to:
- Drop these items on the ground
- Trade these items to other players
- Move these items to other containers

But players can still:
- Use/consume these items
- Move these items within their own inventory
- Administrators can add or remove these items by opening player inventories 
