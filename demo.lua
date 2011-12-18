module(..., package.seeall)

local scores = ice:loadBox( "scores" )

local onEnterFrame = function( event )

end

local onPlayer1Tap = function( event )
	scores:increment( "player1", 1 )
end

local player1 = display.newRect( 0, 0, 100, 100 )
player1:setFillColor( 255, 0, 0 )
player1.x = display.contentCenterX
player1.y = display.contentCenterY
player1:addEventListener( "tap", onPlayer1Tap )

Runtime:addEventListener( "enterFrame", onEnterFrame )