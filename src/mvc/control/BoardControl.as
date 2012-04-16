package mvc.control
{
	import flash.events.*;
	import flash.geom.Point;
	
	import mvc.view.pieces.GamePiece;
	
	public class BoardControl
	{
		private var app:*;
		
		private var startingLocation:Point;
		
		// BOARD CONTROL ///////////////////////////////////////////////////////////////////////
		public function BoardControl(gameObject:Object)
		{
			app = gameObject;
			initBoard();
		}
		
		// INIT ////////////////////////////
		private function initBoard():void 
		{
			app.view.gameBoard.makeTiles();
			app.view.gameBoard.addPieces();
			arrangePieces();
			
			startingLocation = new Point();
			
			addEventListerners();
		}
	
		// ARRANGE PIECES ////////////////////////////
		public function arrangePieces():void
		{
			app.view.gameBoard.arrangePieces();
		}
		
		// TILE CHANGE STATE ////////////////////////
		public function tileEvent(tile, eventType:String):void 
		{
			tile.setState(eventType);
			var topPosition:uint = app.view.gameBoard.tileContainer.numChildren - 1;
			app.view.gameBoard.tileContainer.setChildIndex(tile, topPosition);
		}
		
		// PIECE CHANGE STATE ////////////////////////
		public function pieceEvent(e:Event):void 
		{
			e.currentTarget.setState(e.type);
			
			switch (e.type) 
			{
				case "rollOver":
					showPiecePattern(e.currentTarget, true) 
					break;
				
				case "rollOut":
					showPiecePattern(e.currentTarget, false) 
					break;
				
				case "mouseDown":
					pickUp(e.currentTarget)
					break;
				
				case "mouseUp":
					placeDown(e.currentTarget)
					break;
			}
		}
		
		// PICK UP PIECE ////////////////////////////
		private function pickUp(target):void
		{
			startingLocation.x = target.x;
			startingLocation.y = target.y;
			
			target.startDrag();
			// todo: set index to top
		}
		
		// PLACE DOWN PIECE ////////////////////////
		private function placeDown(target):void
		{
			// check drop target validity
			var validDrop:Boolean = false;
			for (var i:uint = 0 ; i < app.model.validTiles.length ; i++)
			{
				var myTile = app.model.validMoveTiles[i];
				if (target.dropTarget == myTile)
				{
					validDrop = true;
					break;
				}
			}
		
			// if not valid drop target, then drop at starting location
			if (validDrop == false)
			{
				target.x = startingLocation.x;
				target.y = startingLocation.y;
			}
			target.stopDrag();
		}
		
		// SHOW PIECE PATTERN (stencil code)
		private function showPiecePattern(target, show:Boolean):void
		{
			var tileIndex:uint;
			var myPattern = target.movePattern;
			var myTiles = app.view.gameBoard.tiles;
			var showThis:Boolean;
			
			// find tile index of target piece position
			for (var i:uint = 0 ; i < myTiles.length ; i++) 
			{
				if (myTiles[i] == target.tile) { tileIndex = i };
			}
			
			// highlight tile pattern
			var ti:int;
			for (i = 0; i < myPattern.length ; i++) {
				ti = myPattern[i] + tileIndex;
				
				// check if in board bounds
				if (ti > 0 && ti < 63) {
					
					showThis = true;
					
					// *** WAS JUST WORKING ON THIS *** 
					// testing for black/white color matching to perfect stencil patterns 
					
					// check type params (color matching)
					/*if (target.type == "BISHOP" || target.type == "QUEEN")
					{
						trace (">BQ: " + myTiles[ti].color + " =? " + myTiles[tileIndex].color);
						if (myTiles[ti].color != myTiles[tileIndex].color) { 
							trace ("<>>>> FALSE");
							showThis = false;
						}
					} 
					else if (target.type == "KNIGHT") 
					{
						trace (">K: " + myTiles[ti].color + " =? " + myTiles[tileIndex].color);
						if (myTiles[ti].color == myTiles[tileIndex].color) { 
							trace ("<>>>> FALSE");
							showThis = false;
						}
					}*/
					
					// display
					if (showThis) {
						switch (show) {
							case true:
							tileEvent(myTiles[ti], "pattern_highlight_on")
							break;
							
							case false:
							tileEvent(myTiles[ti], "pattern_highlight_off");
							break;
						}
					}
				}
			}
		}
		
		// BOARD EVENT LISTENERS ///////////////////
		private function addEventListerners():void 
		{
			// add events to game pieces
			for (var i:uint = 0 ; i < app.view.gameBoard.pieces.length ; i++) 
			{
				app.view.gameBoard.pieces[i].addEventListener(MouseEvent.ROLL_OVER, pieceEvent);
				app.view.gameBoard.pieces[i].addEventListener(MouseEvent.ROLL_OUT, pieceEvent);
				app.view.gameBoard.pieces[i].addEventListener(MouseEvent.MOUSE_DOWN, pieceEvent);
				app.view.gameBoard.pieces[i].addEventListener(MouseEvent.MOUSE_UP, pieceEvent);
			}
		}
		
	}
}