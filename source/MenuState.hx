package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxAxes;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxState;

import PvPState;
import PvCState;
import CvCState;

class MenuState extends FlxState {
    private var name:FlxText;
    private var pvpBtn:FlxButton;
    private var pvcBtn:FlxButton;
    private var cvcBtn:FlxButton;
    
    override public function create():Void {
        // Hide mouse
		FlxG.mouse.visible = true;

        // The Game Title
        name = new FlxText(0, 0, 0, "Haxe Pong", 70, true);
        name.screenCenter(FlxAxes.X);
        add(name);

        // The player vs player button
        pvpBtn = new FlxButton(0, 0, "Player - Player", newPvPState);
        pvpBtn.screenCenter();
        add(pvpBtn);

        // The player vs computer button
        pvcBtn = new FlxButton(0, 0, "Player - CPU", newPvCState);
        pvcBtn.screenCenter();
        pvcBtn.y += 20;
        add(pvcBtn);

        // The computer vs computer button
        cvcBtn = new FlxButton(0, 0, "CPU vs CPU", newCvCState);
        cvcBtn.screenCenter();
        cvcBtn.y += 40;
        add(cvcBtn);

        super.create();
    }

    /**
     * Switches to the PvP Game.
     * Code from https://haxeflixel.com/documentation/tutorial/
     */
    private function newPvPState() {
        FlxG.camera.fade(FlxColor.BLACK, .33, false, function() {
			FlxG.switchState(new PvPState());
		});
    }

    private function newPvCState() {
        FlxG.camera.fade(FlxColor.BLACK, .33, false, function() {
			FlxG.switchState(new PvCState());
		});
    }

    private function newCvCState() {
        FlxG.camera.fade(FlxColor.BLACK, .33, false, function() {
			FlxG.switchState(new CvCState());
		});
    }
}