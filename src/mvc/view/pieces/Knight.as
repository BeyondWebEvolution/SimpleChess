package mvc.view.pieces
{
	import flash.display.*;
	
	public class Knight extends GamePiece
	{
		[Embed (source="assets/images/piece_KNIGHT_BLACK.png" )]
		private static const PIECE_KNIGHT_BLACK:Class;
		
		[Embed (source="assets/images/piece_KNIGHT_WHITE.png" )]
		private static const PIECE_KNIGHT_WHITE:Class;
		
		// KNIGHT ///////////////////////////////////////////////////
		public function Knight(gameObject:Object, color:uint, type:String):void
		{
			super(gameObject);
			super.type = type;
			
			// move pattern
			movePattern = [-6, -10, -15, -17, 6, 10, 15, 17];
			
			if (color == 0) { 
				bitmap = new PIECE_KNIGHT_BLACK();
				name = "piece_KNIGHT_BLACK";
			} else { 
				bitmap = new PIECE_KNIGHT_WHITE();
				name = "piece_KNIGHT_WHITE";
			}
			super.setImage(bitmap, name);
		}
	}
}