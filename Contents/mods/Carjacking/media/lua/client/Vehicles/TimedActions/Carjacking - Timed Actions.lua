--[[

require "Vehicles/TimedActions/ISEnterVehicle"

function ISEnterVehicle:isValid()
    if self.started then
        return self.vehicle:getCharacter(self.seat) == self.character
    end
    return self.character:getVehicle() == nil and not self.vehicle:isSeatOccupied(self.seat)
end

function ISEnterVehicle:perform()
    self.vehicle:setCharacterPosition(self.character, self.seat, "inside")
    self.vehicle:transmitCharacterPosition(self.seat, "inside")
    self.vehicle:playPassengerAnim(self.seat, "idle")
    --	if self.vehicle:isDriver(self.character) and self.vehicle:isEngineWorking() then
    --		self.vehicle:startEngine()
    --	end
    triggerEvent("OnEnterVehicle", self.character)
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self)
    --ISBaseTimedAction.stop(self)
end

--]]