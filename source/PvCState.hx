package;

import flixel.FlxG;

class PvCState extends GameState {
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
        var paddleMid:Int = Std.int(paddle2.y) + 30;
		var ballMid:Int = Std.int(ball.y) + 3;

        if(paddleMid > ballMid) {
            up = true;
        } else if(paddleMid < ballMid) {
            down = true;
        }

        if(up && down) {
            up = down = false;
        }

        if(up)
            paddle2.y -= moveSpeed;
        
        if(down)
            paddle2.y += moveSpeed;
    }
}