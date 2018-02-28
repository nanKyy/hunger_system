--[[
	
	@author: nanKy(nanky@wp.pl)
	@copyright: public
	@resource: hunger_system
	@version: 1.0.0

--]]

addEventHandler('onPlayerLogin',root,function(_,account)
	local hunger = account:getData('hunger') or 100
		source:setData('hunger',tonumber(hunger))
		source:outputChat('Głód twojej postaci został wczytany pomyślnie.',255,255,255)
end)

addEventHandler('onPlayerQuit',root,function()
	local player_account = source:getAccount()
		if player_account then
			local hunger_data = source:getData('hunger') or 100
			player_account:setData('hunger',tonumber(hunger_data))
		end
end)

addEvent('revivePlayer',true)
addEventHandler('revivePlayer',root,function(x,y,z,hp,model)
	spawnPlayer(client,x,y,z)
	setElementHealth(client,hp)
	setElementModel(client,model)
end)