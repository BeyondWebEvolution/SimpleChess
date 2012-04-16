package
{
	import flash.display.Sprite;
	import flash.display.GradientType;
	import flash.geom.Matrix;
	import flash.text.Font;
	
	import flash.display.*; 
	
	import mvc.Game;
	
	[SWF( width='800', height='850', frameRate='30', backgroundColor='#999999' )]
	
	// ////////////////////////////////////////////////////////////////////////////////////////////////
	// SIMPLE CHESS ////////////////////////////////////////////////////////////////////////////////////
	// ////////////////////////////////////////////////////////////////////////////////////////////////
	
	public class SimpleChess extends Sprite
	{
		private var game:Game;
	
		// SIMPLE CHESS ////////////////////////////////
		public function SimpleChess()
		{
			init();
		}
		
		// INIT //////////////////////////////////////
		private function init():void
		{
			// create game facade
			game = new Game();
			addChild(game);
		}
	}
}
