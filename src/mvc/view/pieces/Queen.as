package mvc.view.pieces
{
	import flash.display.*;
	
	public class Queen extends GamePiece
	{
		[Embed (source="assets/images/piece_QUEEN_BLACK.png" )]
		private static const PIECE_QUEEN_BLACK:Class;
		
		[Embed (source="assets/images/piece_QUEEN_WHITE.png" )]
		private static const PIECE_QUEEN_WHITE:Class;
		
		// QUEEN ///////////////////////////////////////////////////
		public function Queen(gameObject:Object, color:uint, type:String):void
		{
			super(gameObject);
			super.type = type;
			
			// move pattern
			movePattern = [-7, -9, -14, -18, -21, -27, -28, -36, -35, -45, -42, -54, -49, -63, 7, 9, 14, 18, 21, 27, 28, 36, 35, 45, 42, 54, 49, 63];
			
			if (color == 0) { 
				bitmap = new PIECE_QUEEN_BLACK();
				name = "piece_QUEEN_BLACK";
			} else { 
				bitmap = new PIECE_QUEEN_WHITE();
				name = "piece_QUEEN_WHITE";
			}
			super.setImage(bitmap, name);
		}
	}
}

