package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Ball extends FlxSprite {
    public function new(?x:Int = 0, ?y:Int = 0) {
        super(x, y);
        makeGraphic(6, 6, FlxColor.WHITE);
        elasticity = 1;
        maxVelocity.set(300, 300);
        velocity.set(300, 300);
    }
}