package mvc.view
{
	import flash.display.*;

	public class MainView extends Sprite
	{
		[Embed (source="assets/images/intro_background.png" )]
		private static const INTRO_BACKGROUND:Class;
		public var introBackGround:DisplayObject;
		
		private var app:*;
		
		public var gameBoard:Board;
		public var ui:UI;
		
		// MAIN VIEW ///////////////////////////////////////////////////////////////////////
		public function MainView(gameObject:Object)
		{
			app = gameObject;
			initViews();
		}
		
		// INIT VIEWS //////////////////////////////////////////
		// - create all assets
		private function initViews():void
		{
			// intro background
			introBackGround = new INTRO_BACKGROUND();
			addChild(introBackGround);
			
			// game board
			gameBoard = new Board(app);
			gameBoard.x = 77.5;
			gameBoard.y = 145;
			addChild(gameBoard);
			
			// UI
			ui = new UI(app);
			addChild(ui);
			
			resetView();
		}
	
		// SWITCH VIEW /////////////////////////////////
		public function switchView(myView:String):void {
			
			resetView();
			
			switch (myView){
				
				case "INTRO":
					introBackGround.visible = true;
					ui.button_START.visible = true;
					break;
				
				case "START":
					gameBoard.visible 		= true;
					introBackGround.visible = true;
					ui.button_RESET.visible = true;
					ui.scoreBox.visible 	= true;
					break;
				
				case "END":
					break;
			}
		}
		
		// RESET VIEW //////////////////////////////////
		public function resetView():void
		{
			introBackGround.visible = false;
			gameBoard.visible 		= false;
			ui.button_START.visible = false;
			ui.button_RESET.visible = false;
			ui.scoreBox.visible 	= false;
		}
		
	}
}