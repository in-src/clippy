import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.display.SimpleButton;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.external.ExternalInterface;
import Std;

class ButtonUp extends MovieClip {}
class ButtonOver extends MovieClip {}
class ButtonDown extends MovieClip {}

class Clippy {

  static var text:String;
  static var func:String;
  static var label:Sprite;
	static var id:String = '';
/*  static var label:TextField;*/

	static function log (l) {
		ExternalInterface.call("(console.log('"+l+"'))");
	}
	
  static function upFunction (e:MouseEvent) {
    flash.system.System.setClipboard(text);
		ExternalInterface.call( 'ZeroClipboard.dispatch', id, 'mouseUp', null );
		ExternalInterface.call( 'ZeroClipboard.dispatch', id, 'complete', text );
  }

	public static function setClip() {
    flash.system.System.setClipboard(text);		
	}
	
  static function overFunction (e:MouseEvent) {
		ExternalInterface.call( 'ZeroClipboard.dispatch', id, 'mouseOver', null );
  }
  
  static function outFunction(e:MouseEvent) {
		ExternalInterface.call( 'ZeroClipboard.dispatch', id, 'mouseOut', null );
  }

  // Main
  static function main() {
		flash.system.Security.allowDomain("*");
    text = flash.Lib.current.loaderInfo.parameters.text;
    func = flash.Lib.current.loaderInfo.parameters.func;
		var width:Float = Std.parseFloat(flash.Lib.current.loaderInfo.parameters.width) * 2 + 150;
		var height:Float = Std.parseFloat(flash.Lib.current.loaderInfo.parameters.height) * 2 ;
		id = flash.Lib.current.loaderInfo.parameters.id;

		label = new Sprite();
		label.buttonMode = true;
		label.x = 0;
		label.y = 0;
		label.useHandCursor = true;
    label.graphics.beginFill(0xCCFF00);
		label.graphics.drawRect(0, 0, Math.floor(width), Math.floor(height));
		label.alpha = 0.0;
    
    flash.Lib.current.addChild(label);
    
    label.addEventListener(MouseEvent.MOUSE_UP, upFunction );
    
    label.addEventListener(MouseEvent.MOUSE_OVER, overFunction);

    label.addEventListener(MouseEvent.MOUSE_OUT, outFunction);
		
  }
}
