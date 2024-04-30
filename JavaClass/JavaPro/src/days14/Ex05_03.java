package days14;

public class Ex05_03 {
	public static void main(String[] args) {
		Point p1 = new Point(10,20);
		p1.x = 10;
		p1.y = 20;

		System.out.printf("> x=%d, y=%d\n", p1.x, p1.y);

		swap(p1);


		System.out.printf("> x=%d, y=%d\n", p1.x, p1.y);
	}//m

	private static void swap(Point p1) {
			int temp;
			temp = p1.x;
			p1.x = p1.y;
			p1.y = temp;
	}
	
}//c
