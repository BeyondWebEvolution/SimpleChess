package mvc.view.pieces
{
	import flash.display.*;
	
	public class Bishop extends GamePiece
	{
		[Embed (source="assets/images/piece_BISHOP_BLACK.png" )]
		private static const PIECE_BISHOP_BLACK:Class;
		
		[Embed (source="assets/images/piece_BISHOP_WHITE.png" )]
		private static const PIECE_BISHOP_WHITE:Class;
		
		// BISHOP ///////////////////////////////////////////////////
		public function Bishop(gameObject:Object, color:uint, type:String):void
		{
			super(gameObject);
			super.type = type;
			
			// move pattern
			movePattern = [-7, -9, -14, -18, -21, -27, -28, -36, -35, -45, -42, -54, -49, -63, 7, 9, 14, 18, 21, 27, 28, 36, 35, 45, 42, 54, 49, 63];
			
			if (color == 0) { 
				bitmap = new PIECE_BISHOP_BLACK();
				name = "piece_BISHOP_BLACK";
			} else { 
				bitmap = new PIECE_BISHOP_WHITE();
				name = "piece_BISHOP_WHITE";
			}
			super.setImage(bitmap, name);
		}
	}
}

