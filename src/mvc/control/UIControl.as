package mvc.control
{
	import flash.events.*;
	
	public class UIControl
	{
		private var app:*;
		
		// UI CONTROL ////////////////////////////////////////////////////////
		public function UIControl(gameObject:Object)
		{
			app = gameObject;
			init();
		}
		
		// INIT ////////////////////////////
		private function init():void 
		{
			// reset button
			app.view.ui.button_RESET.addEventListener(MouseEvent.CLICK, buttonClick);
			// intro start button
			app.view.ui.button_START.addEventListener(MouseEvent.CLICK, buttonClick);
			
			// set inital scores
			resetScore();
		}
		
		// //////////////////////////////////////////////////////////////////////////
		// UI EVENT HANDLERS ////////////////////////////////////////////////////////
		// //////////////////////////////////////////////////////////////////////////
		
		// BUTTON CLICK ////////////////////////////////////
		private function buttonClick(e:MouseEvent):void 
		{
			//trace ("buttonClick: " + e.currentTarget.name);
			switch (e.currentTarget.name) {
				
				case "button_START":
					app.control.switchView("START");
					break;
				
				case "button_RESET":
					app.control.resetGame();
					break;
				
			}
		}
		
		// UPDATE SCORE /////////////////////////////////////
		public function updateScore(score:uint, team:String):void
		{
			app.view.ui.scoreBox.setScore(score, team);
		}
		
		// RESET SCORE /////////////////////////////////////
		public function resetScore():void
		{
			updateScore(0, "WHITE");
			updateScore(0, "BLACK");
		}
		

	}
}