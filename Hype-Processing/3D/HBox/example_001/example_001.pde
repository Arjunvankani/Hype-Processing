HDrawablePool pool;

void setup() {
	size(640,640,P3D);
	H.init(this).background(#afe3d2).use3D(true);
	smooth();
	lights();

	pool = new HDrawablePool(100);
	pool.autoAddToStage()
		.add (
			new HBox()
		)

		.layout (
			new HGridLayout()
			.startX(-125)
			.startY(-125)
			.spacing(100,100)
			.cols(10)
		)

		.onCreate (
			 new HCallback() {
				public void run(Object obj) {
					HBox d = (HBox) obj;
					d
						.depth(64) // depth is a 3D specific method, so put this first
						.width(64)
						.height(64)
						.z(-500)
						.rotationZ(33)
					;
				}
			}
		)

		.requestAll()
	;

	H.drawStage();
	noLoop();
}

void draw() {}
