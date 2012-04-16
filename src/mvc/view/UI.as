package mvc.view
{
	import flash.display.*;
	import flash.events.Event;
	
	//import mvc.control.UIController;
	
	public final class UI extends Sprite
	{
		[Embed (source="assets/images/button_RESET.png")]
		private static const BUTTON_RESET:Class;
		public var button_RESET:MovieClip;
		
		[Embed (source="assets/images/button_START.png" )]
		private static const BUTTON_START:Class;
		public var button_START:MovieClip;
		
		public var scoreBox:ScoreBox;
		
		private var app:*;
		
		// GAME BOARD ///////////////////////////////////////////////////////////////////////
		public function UI(gameObject:Object)
		{
			app = gameObject;
			addUI();
		}
		
		// ADD UI //////////////////////////
		private function addUI():void 
		{
			// intro button
			var button_START_bitmap:Bitmap;
			button_START = new MovieClip();
			button_START_bitmap = new BUTTON_START();
			button_START_bitmap.x = -button_START_bitmap.width / 2;
			button_START_bitmap.y = -button_START_bitmap.height / 2;
			button_START.addChild(button_START_bitmap); 
			button_START.x = 400;
			button_START.y = 600;
			button_START.buttonMode = true;
			button_START.useHandCursor = true;
			button_START.name = "button_START";
			addChild(button_START);
			
			// reset button
			var button_RESET_bitmap:Bitmap;
			button_RESET = new MovieClip();
			button_RESET_bitmap = new BUTTON_RESET();
			button_RESET_bitmap.x = -button_RESET_bitmap.width / 2;
			button_RESET_bitmap.y = -button_RESET_bitmap.height / 2;
			button_RESET.addChild(button_RESET_bitmap); 
			button_RESET.x = 650;
			button_RESET.y = 70;
			button_RESET.buttonMode = true;
			button_RESET.useHandCursor = true;
			button_RESET.name = "button_RESET";
			addChild(button_RESET);
			
			// score box
			scoreBox = new ScoreBox();
			scoreBox.x = 285;
			scoreBox.y = 25;
			addChild(scoreBox);
		}
	
	}
}