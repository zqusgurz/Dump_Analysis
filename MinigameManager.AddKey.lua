return function (self,player,gameboard) 
player.PlayerControllerComponent:SetActionKey(KeyboardKey.DownArrow, "Minigame")
player.PlayerMinigameDB.gameboard = gameboard
end