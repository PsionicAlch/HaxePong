package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Paddle extends FlxSprite {
    public function new(?x:Int = 0, ?y:Int = 0, ?pWidth:Int = 0, ?pHeight:Int = 0) {
        super(x, y);
        makeGraphic(pWidth, pHeight, FlxColor.WHITE);
        this.immovable = true;
    }
}