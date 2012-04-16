package mvc.view
{
	import flash.display.*;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public final class ScoreBox extends Sprite
	{
		[Embed (source="assets/images/score_box.png")]
		private static const SCORE_BOX:Class;
		public var scoreBox:DisplayObject;
		
		private var scoreWHITE:TextField;
		private var scoreBLACK:TextField;


		// SCORE BOX //////////////////////////////////////////////////////
		public function ScoreBox()
		{
			init();
		}
		
		// INTI //////////////////////////
		private function init():void 
		{
			// score box
			scoreBox = new SCORE_BOX();
			addChild(scoreBox);
			
			// score text field
			var formatWHITE:TextFormat = new TextFormat();
			formatWHITE.font = "Verdana";
			formatWHITE.color = 0x000000;
			formatWHITE.size = 42;
			
			var formatBLACK:TextFormat = new TextFormat();
			formatBLACK.font = "Verdana";
			formatBLACK.color = 0xFFFFFF;
			formatBLACK.size = 42;
		
			scoreWHITE = new TextField();
			scoreWHITE.autoSize = TextFieldAutoSize.CENTER;
			scoreWHITE.defaultTextFormat = formatWHITE;
			scoreWHITE.x = 60;
			scoreWHITE.y = 15;
			addChild(scoreWHITE);
			
			scoreBLACK = new TextField();
			scoreBLACK.autoSize = TextFieldAutoSize.CENTER;
			scoreBLACK.defaultTextFormat = formatBLACK;
			scoreBLACK.x = 170;
			scoreBLACK.y = 15;
			addChild(scoreBLACK);
		}
		
		// SET SCORE
		public function setScore(score:uint, team:String):void
		{
			var scr:String = score.toString();
			
			switch (team){
				
				case "WHITE":
					scoreWHITE.text = scr;
					break;
				
				case "BLACK":
					scoreBLACK.text = scr;
					break;
			}
		}
		

	}
}