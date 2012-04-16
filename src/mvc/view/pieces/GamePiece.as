package mvc.view.pieces
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	
	import mvc.view.Tile;
	
	public class GamePiece extends Sprite
	{
		public var tile:Tile;
		public var type:String;
		public var movePattern:Array = [];
		
		internal var bitmap:Bitmap;
		internal var image:MovieClip;

		private var glow:GlowFilter;
		
		protected var GREEN:uint = 0x009900;
		protected var BLUE:uint  = 0x009999;
		
		private var app:*;
		
		// GAME PIECE ///////////////////////////////////////////////////////////////
		public function GamePiece(gameObject:Object):void
		{
			app = gameObject;
				
			glow = new GlowFilter(); 
			glow.color = BLUE; 
			glow.alpha = .8; 
			glow.blurX = 25; 
			glow.blurY = 25; 
			glow.quality = BitmapFilterQuality.HIGH; 
			this.filters = [glow];
		}
		
		// SET IMAGE ////////////////////////
		internal function setImage(bm:Bitmap, name:String):void 
		{
			bitmap = new Bitmap();
			bitmap = bm;
			
			image = new MovieClip();
			image.name = name;
			
			bitmap.x = -bitmap.width / 2;
			bitmap.y = -bitmap.height / 2;
			
			image.addChild(bitmap); 
			image.buttonMode    = true;
			image.useHandCursor = true;
			
			addChild(image);
		}
		
		// PIECE STATES /////////////////////
		public function setState(state:String):void
		{
			switch (state) 
			{
				case "rollOver":
					glow.color = GREEN;
					glow.alpha = 1;
					break;
		
				case "rollOut":
					glow.color = BLUE;
					glow.alpha = .8;
					break;
				
				case "mouseDown":
					this.filters = [new DropShadowFilter()];
					break;
				
				case "mouseUp":
					//
					break;
			}
			this.filters = [glow];
		}
		
	}
}
