require( "ice" )

-- Load or Create our Score box
local scores = ice:loadBox( "scores" )

local description = display.newText( "Tap each player to increment score.", 0, 0, "Helvetica", 19 )
description.x = display.contentCenterX
description.y = 100

-- Increment Player 1 Score
local onPlayer1Tap = function( event )
	scores:increment( "player1", 1 )
	scores:save()
end

-- Increment Player 2 Score
local onPlayer2Tap = function( event )
	scores:increment( "player2", 1 )
	scores:save()
end

-- Reset both scores
local onResetButtonTap = function( event )
	scores:store( "player1", 0 )
	scores:store( "player2", 0 )
	scores:save()
end

-- Create Player 1
local player1 = display.newRect( 0, 0, 150, 150 )
player1:setFillColor( 255, 0, 0 )
player1.x = display.contentCenterX - player1.contentWidth / 2
player1.y = display.contentCenterY
player1:addEventListener( "tap", onPlayer1Tap )

player1.text = display.newText( "Player 1", 0, 0, "Helvetica", 30 )
player1.text.x = player1.x
player1.text.y = player1.y - player1.text.contentHeight

player1.score = display.newText( "0", 0, 0, "Helvetica", 30 )
player1.score.x = player1.x
player1.score.y = player1.y

-- Create Player 2
local player2 = display.newRect( 0, 0, 150, 150 )
player2:setFillColor( 0, 0, 255 )
player2.x = display.contentCenterX + player2.contentWidth / 2
player2.y = display.contentCenterY
player2:addEventListener( "tap", onPlayer2Tap )

player2.text = display.newText( "Player 2", 0, 0, "Helvetica", 30 )
player2.text.x = player2.x
player2.text.y = player2.y - player2.text.contentHeight

player2.score = display.newText( "0", 0, 0, "Helvetica", 30 )
player2.score.x = player2.x
player2.score.y = player2.y

-- Create Reset Button
local resetButton = display.newRect( 0, 0, 200, 100 )
resetButton:setFillColor( 0, 255, 0 )
resetButton.x = display.contentCenterX
resetButton.y = display.contentHeight - resetButton.contentHeight + 20
resetButton:addEventListener( "tap", onResetButtonTap )

resetButton.text = display.newText( "Reset Scores", 0, 0, "Helvetica", 30 )
resetButton.text.x = resetButton.x
resetButton.text.y = resetButton.y
resetButton.text:setTextColor( 0, 0, 0 )

-- Update the score displays
local onEnterFrame = function( event )
	player1.score.text = scores:retrieve( "player1" ) or 0
	player2.score.text = scores:retrieve( "player2" ) or 0
end

Runtime:addEventListener( "enterFrame", onEnterFrame )

--[[
local saveData = true

if saveData then 

	local box1 = ice:newBox( "credits" )
	box1:store( "author", "Graham Ranson" )
	box1:store( "website", "http://www.grahamranson.co.uk" )
	box1:save()
	
	local box2 = IceBox:new( "food" )
	box2:store( "monkey", "banana" )
	box2:store( "cat", "fish" )
	box2:store( "cow", "grass" )
	box2:save()
	
	local box3 = IceBox:new( "player" )
	box3:store( "score", 125 )
	box3:store( "level", 10 )
	box3:store( "mode", "arcade" )
	box3:save()
	
	print( "Data Saved - Now open up 'main.lua' and change 'saveData' on line 3 to false." )
	
else
	
	print( "" )
	print( " -- BOX: credits -- " )
	local box1 = ice:loadBox( "credits" )
	box1:print()
	print( "" )
	
	print( " -- BOX: food -- " )	
	local box2 = IceBox:new( "food" )
	box2:load()
	box2:print()
	print( "" )
	
	print( " -- BOX: player -- " )	
	local box3 = IceBox:new( "player" )
	box3:load()
	box3:print()
	print( "" )
	
end
--]]