package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Wall extends FlxSprite {
    public function new(?x:Int = 0, ?y:Int = 0, ?wWidth:Int = 0, ?wHeight:Int = 0) {
        super(x, y);
        makeGraphic(wWidth, wHeight, FlxColor.WHITE);
        immovable = true;
    }
}