/* @pjs preload="sintra.jpg"; */

HDrawablePool pool;

int cellSize = 25;

void setup() {
	size(640,640);
	H.init(this).background(#202020);
	smooth();

	final HPixelColorist colors = new HPixelColorist("123.png")
		.fillOnly()
		// .strokeOnly()
		// .fillAndStroke()
	;

	pool = new HDrawablePool(576);
	pool.autoAddToStage()
		.add (
			new HRect()
			.rounding(4)
		)

		.layout (
			new HGridLayout()
			.startX(21)
			.startY(21)
			.spacing(cellSize+1,cellSize+1)
			.cols(24)
		)

		.onCreate (
			new HCallback(){
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.noStroke()
						.anchorAt(H.CENTER)
						.size(cellSize)
					;

					colors.applyColor(d);
				}
			}
		)

		.requestAll()
	;

	H.drawStage();
	noLoop();
}

void draw() {}
