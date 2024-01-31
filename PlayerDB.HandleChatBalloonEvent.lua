return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: ChatBalloonComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local Message = event.Message
local SenderName = event.SenderName
local UserId = event.UserId
---------------------------------------------------------
if self.Entity ~= _UserService.LocalPlayer then return end
if UserId == "20372001074016951" then
	if Message == "!보급"then
		for i=1, 10 do
            self:PurchasePotion(1)
            self:PurchaseChair()
            self:PurchaseAD1()
            self:PurchaseMinigame()
		end
	elseif Message == "!미니게임" then
		self:StopMiniGame()
	elseif string.sub(Message, 1, 4) == "BAN_" then
		self:ChatBan("BAN", string.sub(Message, 5))
	elseif string.sub(Message, 1, 5) == "CHAT_" then
		self:ChatBan("CHAT", string.sub(Message, 6))
    end
end
end