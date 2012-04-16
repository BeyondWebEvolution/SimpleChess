package mvc.view
{
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	
	import mvc.view.pieces.*;
	
	public class Board extends Sprite
	{
		public var tile:Tile;
		public var tileContainer:Sprite;
		
		public var piece_KNIGHT_WHITE:Knight;
		public var piece_BISHOP_WHITE:Bishop;
		public var piece_QUEEN_WHITE:Queen;
		public var piece_KNIGHT_BLACK:Knight;
		public var piece_BISHOP_BLACK:Bishop;
		public var piece_QUEEN_BLACK:Queen;
		
		public var tiles:Array  = [];
		public var pieces:Array = [];
		
		private var offsetX:uint = 40;
		private var offsetY:uint = 40;
		
		private var glow:GlowFilter;
		
		private var app:*;
		
		// GAME BOARD ///////////////////////////////////////////////////////////////////////
		public function Board(gameObject:Object)
		{
			app = gameObject;
			
			glow = new GlowFilter(); 
			glow.color = 0x009999; 
			glow.alpha = .4; 
			glow.blurX = 50; 
			glow.blurY = 50; 
			glow.quality = BitmapFilterQuality.HIGH; 
			this.filters = [glow];
		}
		
		// MAKE TILES /////////////////////
		public function makeTiles():void
		{
			tileContainer = new Sprite();
			addChild(tileContainer);
			
			// checker board parameters
			var even:uint = 0x000000;
			var odd:uint = 0xFFFFFF;
			var black:String = "BLACK";
			var white:String = "WHITE";
			var size:int = 80;
			
			// number of checker tiles
			var nH:int = 700 / size;
			var nV:int = 700 / size;
			
			// loop vars
			var clr:uint;
			var clrName:String;
			var i:uint;
			var j:uint;
			
			// loop vertical
			for (i=0 ; i<nV ; ++i)
			{
				// flip values of even and odd colours using bitwise operations
				even ^= odd;
				odd  ^= even;
				even ^= odd;
				
				// loop horizontal
				for (j=0 ; j<nH ; ++j)
				{
					// bitwise modulus
					// check if column is odd or even, then set colour
					clr = j & 1 ? even : odd;
					clrName = j & 1 ? black : white;
					
					// draw tile with previously set colour
					tile = new Tile(clr, clrName, size, i, j);
					tiles.push(tile);
					tileContainer.addChild(tile);
				}
			}
		}
		
		// ADD PIECES //////////////////////////
		public function addPieces():void 
		{
			piece_KNIGHT_BLACK = new Knight(app, 0, "NIGHT");
			pieces.push(piece_KNIGHT_BLACK);
			addChild(piece_KNIGHT_BLACK);
			
			piece_BISHOP_BLACK = new Bishop(app, 0, "BISHOP");
			pieces.push(piece_BISHOP_BLACK);
			addChild(piece_BISHOP_BLACK);
			
			piece_QUEEN_BLACK = new Queen(app, 0, "QUEEN");
			pieces.push(piece_QUEEN_BLACK);
			addChild(piece_QUEEN_BLACK);
			
			piece_KNIGHT_WHITE = new Knight(app, 1, "KNIGHT");
			pieces.push(piece_KNIGHT_WHITE);
			addChild(piece_KNIGHT_WHITE);
			
			piece_BISHOP_WHITE = new Bishop(app, 1, "BISHOP");
			pieces.push(piece_BISHOP_WHITE);
			addChild(piece_BISHOP_WHITE);
			
			piece_QUEEN_WHITE = new Queen(app, 1, "QUEEN");
			pieces.push(piece_QUEEN_WHITE);
			addChild(piece_QUEEN_WHITE);
		}
		
		// ARRANGE PIECES //////////////////////////
		public function arrangePieces():void
		{	
			var myObject:Object = new Object();
			var myPiece;
			var myTile;
			var point:Point;
			
			for (var p:uint=0 ; p < pieces.length ; p++) {
				myPiece = pieces[p];
				
				myObject = getRandomTilePosition();
				myTile = myObject.tile;
				point = myObject.point;
			
				myPiece.tile = myTile;
				myPiece.x = point.x;
				myPiece.y = point.y;
			}
		}
		
		// GET RANDOM TILE POSITION (non duplicate)
		private function getRandomTilePosition():Object
		{
			var tpObject:Object = new Object();
			var tile;
			var point:Point = new Point();
			var random:int;
	
			do 
			{
				random = rand(0, tiles.length -1);
				tile = tiles[random];
				point.x = tile.getX() + offsetX;
				point.y = tile.getY() + offsetY;
			} 
			while (checkPositionDuplicates(point) == true);
	
			tpObject.tile = tile;
			tpObject.point = point;
			return tpObject;
		}
		
		// CHECK FOR DUPLICATE POSITION
		private function checkPositionDuplicates(point:Point):Boolean
		{
			var duplicate:Boolean;
			for (var i:uint ; i < pieces.length ; i++) {
				if (point.x == pieces[i].x && point.y == pieces[i].y) {
					duplicate = true;
					break;
				} else { 
					duplicate = false;
				}
			}
			return duplicate;
		}
		
		// GET RANDOM NUMBER 
		private function rand(min:int, max:int):int
		{
			return Math.random() * (max - min + 1) + min;
		}
	}
}