package;

import flixel.util.FlxAxes;
import flixel.text.FlxText;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.FlxState;

import Paddle;
import Ball;
import Wall;

class GameState extends FlxState {
	private var paddle1:Paddle;
	private var paddle2:Paddle;
	private var ball:Ball;
	private var topWall:Wall;
	private var bottomWall:Wall;
	private var p1Wall:Wall;
	private var p2Wall:Wall;
	private var walls:FlxGroup;
	private var moveSpeed:Int = 5;
	private var p1Score:Int = 0;
	private var p2Score:Int = 0;
	private var score:FlxText;

	override public function create():Void {
		// Hide mouse
		FlxG.mouse.visible = false;

		// Initialize player 1.
		paddle1 = new Paddle(20, Std.int(FlxG.stage.stageHeight / 2) - 8, 8, 60);
		add(paddle1);

		// Initialize player 2.
		paddle2 = new Paddle(Std.int(FlxG.stage.stageWidth) - 30, Std.int(FlxG.stage.stageHeight / 2) - 8, 8, 60);
		add(paddle2);

		// Initialize the ball.
		ball = new Ball(0, 0);
		ball.screenCenter();
		ball.y += 22;
		add(ball);

		// Initialize top and bottom walls and put them inside the walls group.
		walls = new FlxGroup();
		topWall = new Wall(0, 30, 640, 8);
		walls.add(topWall);
		bottomWall = new Wall(0, Std.int(FlxG.stage.stageHeight - 8), 640, 8);
		walls.add(bottomWall);
		add(walls);

		// Initialize player 1's wall (If the ball touches this wall player 2 will get a point).
		p1Wall = new Wall(0, 30, 8, 450);
		add(p1Wall);

		// Initialize player 2's wall (If the ball touches this wall player 1 will get a point).
		p1Wall = new Wall(Std.int(FlxG.stage.stageWidth) - 8, 30, 8, 450);
		add(p1Wall);

		// Initialize the score for the game.
		score = new FlxText(0, 0, 70, "0 / 0", 20, true);
		score.screenCenter(FlxAxes.X);
		add(score);

		super.create();
	}

	override public function update(elapsed:Float):Void {
		FlxG.collide(ball, walls);
		FlxG.collide(paddle1, walls);
		FlxG.collide(paddle1, ball, paddleHit);
		FlxG.collide(paddle2, ball, paddleHit);

		if(ball.x < 8) {
			point1();
		}

		if(ball.x > FlxG.stage.stageWidth - 8) {
			point2();
		}

		if(paddle1.y < topWall.y + 8) {
			paddle1.y = topWall.y + 8;
		} else if(paddle1.y > bottomWall.y - 60) {
			paddle1.y = bottomWall.y - 60;
		}

		if(paddle2.y < topWall.y + 8) {
			paddle2.y = topWall.y + 8;
		} else if(paddle2.y > bottomWall.y - 60) {
			paddle2.y = bottomWall.y - 60;
		}

		movement1();
		movement2();

		score.text = p1Score + " / " + p2Score;

		super.update(elapsed);
	}

	// Function for when the ball hit's player 1's wall
	private function point1():Void {
		resetBoard();
		p2Score++;
	}

	// Function for when the ball hit's player 2's wall
	private function point2():Void {
		resetBoard();
		p1Score++;
	}

	/**
	 * Based on a function from https://github.com/HaxeFlixel/flixel-demos/blob/master/Arcade/Breakout/source/PlayState.hx
	 * Function to calculate the bounce of the ball based in where it hit the paddle
	 * @param Paddle The paddle that was hit
	 * @param Ball The ball that was hit
	 */
	private function paddleHit(Paddle:FlxObject, Ball:FlxObject):Void {
		var paddleMid:Int = Std.int(Paddle.y) + 30;
		var ballMid:Int = Std.int(Ball.y) + 3;
		var difference:Int;

		if(ballMid < paddleMid) {
			// If the ball hit the top of the paddle
			difference = paddleMid - ballMid;
			Ball.velocity.y = (-10 * difference);
		} else if( ballMid > paddleMid) {
			// If the ball hit the bottom of the paddle
			difference = ballMid - paddleMid;
			Ball.velocity.y = (10 * difference);
		} else {
			// If the ball hit the middle of the paddle
			Ball.velocity.y = 2 + FlxG.random.int(0, 8);
		}
	}

	public function movement1():Void {
        trace("The movement for the left paddle");
    }

    public function movement2():Void {
        trace("The movement for the right paddle");
    }

	public function resetBoard():Void {
		paddle1.setPosition(20, Std.int(FlxG.stage.stageHeight / 2) - 8);
		paddle2.setPosition(Std.int(FlxG.stage.stageWidth) - 30, Std.int(FlxG.stage.stageHeight / 2) - 8);
		ball.screenCenter();
		ball.y += 22;
		ball.velocity.set(FlxG.random.int(-1, 1, [0]) * 300, FlxG.random.int(-1, 1, [0]) * 300);
	}
}
