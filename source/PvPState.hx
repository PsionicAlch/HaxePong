package;

import flixel.FlxG;

import GameState;

class PvPState extends GameState {
	override public function movement1():Void {
        var up:Bool = false;
        var down:Bool = false;

        up = FlxG.keys.anyPressed([W]);
        down = FlxG.keys.anyPressed([S]);

        if(up && down) {
            up = down = false;
        }

        if(up)
            paddle1.y -= moveSpeed;
        
        if(down)
            paddle1.y += moveSpeed;
    }

    override public function movement2():Void {
        var up:Bool = false;
        var down:Bool = false;

        up = FlxG.keys.anyPressed([UP]);
        down = FlxG.keys.anyPressed([DOWN]);

        if(up && down) {
            up = down = false;
        }

        if(up)
            paddle2.y -= moveSpeed;
        
        if(down)
            paddle2.y += moveSpeed;
    }
}
