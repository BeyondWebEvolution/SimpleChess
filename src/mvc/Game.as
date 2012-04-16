package mvc
{
	import flash.display.*; 
	import flash.events.*;
	
	import mvc.control.*;
	import mvc.model.*;
	import mvc.view.*;
	
	public final class Game extends Sprite
	{
		public var model:MainModel;
		public var view:MainView;
		public var control:MainControl;
		
		private var gameObject:Object;
		private var app:*;
		
		// GAME ///////////////////////////////////////////////////////////////////////////
		public function Game() 
		{
			// for mvc reference to this main game class
			gameObject = new Object();
			gameObject = {app:this};
			
			startUp();
		}
		
		// START UP /////////////////////////////////////////////
		public function startUp():void
		{
			// INIT MODEL ///////////////////////////////////////
			model = new MainModel();
			
			// INIT VIEW ////////////////////////////////////////
			view = new MainView(gameObject);
			addChild(view);
			
			// INIT CONTROLLER //////////////////////////////////
			control = new MainControl(gameObject);
			control.initGame();
		}
		
	}
}