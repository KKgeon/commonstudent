package days14;

public class Ex06 {
	public static void main(String[] args) {
		//[객체(클래스) 배열]
		// 배열



		//클래스 배열
		//클래스(Point)를 자료형으로 선언된 배열을 "클래스 배열" 이라고 부른다.
		
		Point [] points = new Point[3];

			for (int i = 0; i < points.length; i++) {
				//NullPointerException
				points[i] = new Point();
				points[i].dispXY();

			}



	}//m
}//c
