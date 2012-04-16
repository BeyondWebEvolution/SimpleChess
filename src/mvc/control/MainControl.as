package mvc.control
{
	import flash.events.*;
	
	import mvc.model.MainModel;
	import mvc.view.MainView;

	public class MainControl 
	{
		
		private var app:*;
		
		public var boardControl:BoardControl;
		public var uiControl:UIControl;
		
		// MAIN CONTROL ////////////////////////////////////////////////////////
		public function MainControl(gameObject:Object)
		{
			app = gameObject.app;
			initControls();
		}
		
		// INIT //////////////////////////////////////////
		private function initControls():void
		{
			// board controller
			boardControl = new BoardControl(app);
			uiControl = new UIControl(app);
		}
		
		// //////////////////////////////////////////////////////////////////////////
		// GENERAL CONTROLS /////////////////////////////////////////////////////////
		// //////////////////////////////////////////////////////////////////////////
		
		// INIT GAME ////////////////////////////////////
		public function initGame():void {
			switchView("INTRO");
			//switchView("START");
		}
		
		// SWITCH VIEW //////////////////////////////////////
		public function switchView(view:String):void {
			app.view.switchView(view);
		}
		
		// RESET GAME //////////////////////////////////////
		public function resetGame():void 
		{
			app.control.boardControl.arrangePieces();
			app.control.uiControl.resetScore();
		}
		
	
	}
}