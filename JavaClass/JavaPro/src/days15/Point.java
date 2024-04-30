package days15;

public class Point {

	// field
	public int x = 0;
	public int y = 0;

	// default constructor
	public Point() {
		this(1);
		System.out.println("> Point 디폴트 생성자 호출됨...");
	}

	public Point(int i) {
		this(i,i);
		System.out.println("> Point 1 생성자 호출됨...");
	}

	public Point(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("> Point 2 생성자 호출됨...");
	}



	public Point(Point p) {
		//p.clone(); X
		this.x = p.x;
		this.y = p.y;
	}

	// method
	public void dispPoint() {
		System.out.printf("> x=%d, y=%d\n", this.x, this.y);
	}

	// p1.movePoint()
	public void movePoint(int pos) {
		this.x += pos;
		this.y += pos;
	}

	// p1.moveNewPoint(50);
	// 리턴자료형 Point 참조타입
	public Point moveNewPoint(int pos) {
		int newx = this.x + pos;
		int newy = this.y + pos;



		return this;
	}

	// p1.plusPoint(p2);
	public void plusPoint(Point p2) {
		x += p2.x;
		y += p2.y;

	}

}