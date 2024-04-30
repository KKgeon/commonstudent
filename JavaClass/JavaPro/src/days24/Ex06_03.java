package days24;

public class Ex06_03 {
	public static void main(String[] args) {
		/*
		 * [제네릭의 제한]
		 * 
		 */
	}//m
}//c


/*
class Box2<T>{
	//Cannot make a static reference to the non-static type T
	// [제네릭의 첫 번째 제한]
	//제네릭 클래스에는 클래스변수(정적필드) 선언 X
	//static T item2;

	//[제네릭의 두 번째 제한]
	//클래스 메서드 선언 O + 매개변수 T 타입 사용 X
	//Cannot make a static reference to the non-static type T
	static int compare(T a, T b) {
		return 0;
T [] itemArr;
	}
}
	 */

