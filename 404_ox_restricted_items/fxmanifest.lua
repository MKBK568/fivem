fx_version 'cerulean'
game 'gta5'

author '404-server-shop'
description '限制特定物品无法移动、交易但可消耗的OX背包插件'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config/config.lua',
}

client_scripts {
    'client/client.lua',
}

server_scripts {
    'server/server.lua',
}

dependencies {
    'ox_inventory',
    'ox_lib'
}

lua54 'yes' 