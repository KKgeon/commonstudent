package days15;

public class Ex11 {
	public static void main(String[] args) {

		//객체 복사 (copy)
		//객체 복제 (clone)
		
		Point p1 = new Point(1,2);
		Point p2= p1; //객체 복사 (copy)
		pointCopy(p1);
		
		/*
		//객체 복제(clone)
		Point p3 = new Point();
		p3.x = p1.x;
		p3.y = p1.y;
		*/
		
		//[생성자를 사용해서 객체 복제.]
		/*
		Point p3 = new Point(p1.x, p1.y);
		*/
		
		Point p3 = new Point(p1);
		
		
	}//m
	//							Point p = p1 객체 복사
	private static void pointCopy(Point p) {

		
	}
	
	
}//c
