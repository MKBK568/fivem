

local function Initialize()
    DebugPrint('Initializing item restriction system')
    

    local function IsRestrictedItem(itemName)
        return Config.RestrictedItems[itemName] == true
    end

    local itemFilter = {
        swapItems = function(payload)
            if not payload then return true end
            if not payload.fromSlot then return true end
            if not payload.fromSlot.name then return true end

            local itemName = payload.fromSlot.name
            local toInventory = payload.toInventory
            local fromInventory = payload.fromInventory
            local toType = payload.toType
            local locale = GetLocale()

            if Config.Debug then
                DebugPrint('Received item swap request')
                DebugPrint(string.format('Item: %s', itemName))
                DebugPrint(string.format('From: %s', fromInventory))
                DebugPrint(string.format('To: %s', toInventory or toType or 'unknown'))
            end


            if IsRestrictedItem(itemName) then
                DebugPrint(string.format(locale.debug.item_check, itemName))
                

                if Config.Debug then
                    DebugPrint('Detailed information:')
                    DebugPrint('fromInventory type: ' .. type(fromInventory))
                    DebugPrint('toInventory type: ' .. type(toInventory or 'nil'))
                    if toInventory then DebugPrint('toInventory: ' .. tostring(toInventory)) end
                    if toType then DebugPrint('toType: ' .. tostring(toType)) end
                end
                

                if toInventory and fromInventory and toInventory == fromInventory then
                    DebugPrint('Allowing movement within the same inventory')
                    return true
                end
                

                if toType == 'drop' then
                    Notify(fromInventory, locale.messages.discard)
                    return false

                elseif toType == 'player' then  
                    Notify(fromInventory, locale.messages.give)
                    return false

                elseif toInventory and toInventory ~= fromInventory then
                    Notify(fromInventory, locale.messages.transfer)
                    return false
                end
            end

            return true
        end,

        createItem = function(payload)
            return true
        end
    }


    exports.ox_inventory:registerHook('swapItems', itemFilter.swapItems)
    exports.ox_inventory:registerHook('createItem', itemFilter.createItem)
    
    DebugPrint('Item restriction system initialized')
end


AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        Initialize()
    end
end) 