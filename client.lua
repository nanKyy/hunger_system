--[[
	
	@author: nanKy(nanky@wp.pl)
	@copyright: public
	@resource: hunger_system
	@version: 1.0.0

--]]

local times = 1000*30
actual_times = getTickCount()

addEventHandler('onClientRender',root,function()
	local hunger = localPlayer:getData('hunger') or 100
		if hunger and getTickCount()-actual_times > times then
			if hunger >= 0 then
				localPlayer:setHealth(0)
				outputChatBox('Twoja postać została wygłodzona, zostałeś przetransportowany do szpitala')
				triggerServerEvent('revivePlayer',localPlayer,-705.21613, 931.83527, 12.40405,25,22)
				localPlayer:setData('hunger',10)
				actual_times = getTickCount()
			else
				localPlayer:setData('hunger',hunger-1)
				actual_times = getTickCount()
			end
		end
end)

addCommandHandler('dajglod',function()
setElementData(localPlayer,'hunger',100)
end)

addCommandHandler('daj1glod',function()
setElementData(localPlayer,'hunger',1)
end)

addCommandHandler('glod',function()
outputChatBox(getElementData(localPlayer,'hunger'))
end)