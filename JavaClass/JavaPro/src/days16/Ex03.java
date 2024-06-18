package days16;

import days15.Point;

public class Ex03 {
	public static void main(String[] args) {
		//2. is -a 관계 (상속 관계)
		/*
		 * 1. 상속(inheritance) ? 
		 * 		돈, 부동산, 주식
		 * 		기존의 클래스를 재사용하여 새로운 클래스로 작성하는 것.
		 * 
		 * 2. 상속의 장점
		 * 	- 코드 재사용 -> 생산성 향상, 유지보수 용이
		 * 
		 * 3. 상속 시 클래스 선언 형식
		 * 	접근지정자 기타제어자 class 클래스명 extends 슈퍼클래스{
		 * }
		 * 
		 * 4. class Point3D extends Point
		 *  Point	== 부모(parent)클래스, 	기초, [Super	], 상위
		 *  Point3D == 자식(child)클래스,		파생, [Sub	], 하위
		 */
	}//m
}//c

class Point2D{
	int x;
	int y;

	Point2D() {}
	Point2D(int x, int y) {
		this.x = x;
		this.y = y;

	}
	
}


class Point3D extends Point2D{
	int z;
	Point3D() {}
	Point3D(int x, int y, int z) {
		//생성자에서 부모의 생성자 호출
		super(x,y);
//		this.x = x;
//		this.y = y;
		this.z = z;
	}
	
}
/*
//필요한거 -> 15일차 포인트 클래스에서 z축까지 쓰는 클래스 추가를 상속을 통해 구현
class Point3D extends Point {
	//private int x;
	//private int y;
	private int z;

	//생성자
	//메서드

}
*/