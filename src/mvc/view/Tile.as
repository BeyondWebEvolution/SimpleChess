package mvc.view
{
	import flash.display.Sprite;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter; 
	
	public class Tile extends Sprite
	{
		protected var _posName:String;
		
		public var _x:Number;
		public var _y:Number;
		
		public var glow:GlowFilter;
		
		public var color:String;
		
		private var GREEN:uint = 0x009900;
		
		// TILE ////////////////////////////////////////////////////////////////////
		public function Tile(clr:uint, colorName:String, size:int, i:uint, j:uint)
		{
			// draw
			graphics.beginFill(clr,1);
			graphics.drawRect(Number(j*size),Number(i*size),size,size);
			graphics.endFill();
			
			// place
			_x = j * size;
			_y = i * size;
			
			// filters
			glow = new GlowFilter(); 
			glow.color = GREEN; 
			glow.alpha = 0; 
			glow.blurX = 25; 
			glow.blurY = 25; 
			glow.quality = BitmapFilterQuality.HIGH; 
			this.filters = [glow];
			
			color = colorName;
		}
		
		// TILE STATES ///////////////////////////////
		public function setState(state:String):void
		{
			switch (state) 
			{
				case "rollOver":
					glow.alpha = 1; 
					glow.color = GREEN;
					break;
				
				case "rollOut":
					glow.alpha = 0;
					break;
				
				case "pattern_highlight_on":
					glow.alpha = 1; 
					glow.color = GREEN;
					break;
				
				case "pattern_highlight_off":
					glow.alpha = 0; 
					break;
			}
			this.filters = [glow];
		}
		
		// SET POSITION //////////////////////////
		public function setX(value:Number):void 
		{
			_x = value;
		}
		public function setY(value:Number):void 
		{
			_y = value;
		}
		public function getX():Number 
		{
			return _x;
		}
		public function getY():Number 
		{
			return _y;
		}
	}
}