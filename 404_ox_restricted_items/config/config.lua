Config = {}


Config.RestrictedItems = {
    -- ['ticket'] = true,
    -- ['special_card'] = true
}


Config.Debug = true


Config.Language = 'en'


function DebugPrint(message)
    if Config.Debug then
        print('^3[404_ox_restricted_items]^0: ' .. message)
    end
end

-- Multi-language support
Config.Locales = {
    ['en'] = {
        title = 'Item Restricted',
        messages = {
            discard = 'You cannot discard this item',
            transfer = 'You cannot move this item',
            give = 'You cannot give this item to others',
            trade = 'You cannot trade this item',
        },
        debug = {
            item_check = 'Checking restricted item: %s'
        }
    },
    ['zh_cn'] = {
        title = '物品限制',
        messages = {
            discard = '您无法丢弃此物品',
            transfer = '您无法移动此物品',
            give = '您无法将此物品给予他人',
            trade = '您无法交易此物品',
        },
        debug = {
            item_check = '检查限制物品: %s'
        }
    },
    ['es'] = {
        title = 'Objeto Restringido',
        messages = {
            discard = 'No puedes desechar este objeto',
            transfer = 'No puedes mover este objeto',
            give = 'No puedes dar este objeto a otros',
            trade = 'No puedes comerciar este objeto',
        },
        debug = {
            item_check = 'Verificando objeto restringido: %s'
        }
    },
    ['fr'] = {
        title = 'Objet Restreint',
        messages = {
            discard = 'Vous ne pouvez pas jeter cet objet',
            transfer = 'Vous ne pouvez pas déplacer cet objet',
            give = 'Vous ne pouvez pas donner cet objet à d\'autres',
            trade = 'Vous ne pouvez pas échanger cet objet',
        },
        debug = {
            item_check = 'Vérification de l\'objet restreint: %s'
        }
    }
}

-- Helper function to get the current locale
function GetLocale()
    return Config.Locales[Config.Language] or Config.Locales['en']
end

-- Notification function
function Notify(source, message)
    local locale = GetLocale()
    TriggerClientEvent('ox_lib:notify', source, {
        title = locale.title,
        description = message,
        type = 'error',
        position = 'top',
        duration = 3000
    })
end 