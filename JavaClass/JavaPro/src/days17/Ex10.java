package days17;

public class Ex10 {
	public static void main(String[] args) {
		// 인터페이스 멤버
		//	ㄴ 상수
		// 	ㄴ 추상메서드

		//JDK 1.8 이후
		//	ㄴ default 메서드 ***
		//	ㄴ static 메서드
		
		//5년 지난 후...
		// 1) 디폴트 메서드와 클래스의 메서드가 충돌나면 
		//		==> 디폴트 메서드는 무시가 된다.
		// 2) 여러 인터페이스를 구현하면 디폴드 메서드와 충돌날 수 있음
		//		==> 충돌나는 디폴트 메서드를 오버라이딩하면 해결.
		
	}//m
}//c

interface Ia{
	//3개 추상메서드 선언
	
	//5년 지난 후... 추상메서드 추가
	default void fiveTest() {
		System.out.println("몸체 구현된 메서드 완벼끄, 하지만 하위클래스들이랑 충돌날수도있음");
	}
	static void staticTest() {
		System.out.println("스태틱은 클래스당 하나만 만들어지는거라 문제없음~");
	}
}

interface Ib{
	//1개 추상메서드 선언
}
interface Iab extends Ia, Ib{
	//3개 추상메서드 선언(상속)
	//1개 추상메서드 선언(상속)
	//1개 추상메서드
}

class Aa implements Ia{

	//3개 추상메서드 오버라이딩(재정의)
}

class Bb extends Aa{
	//3개 추상메서드 오버라이딩(재정의)

}

class Cc implements Iab{
	//3개 추상메서드 오버라이딩(재정의)
	//1개 추상메서드 오버라이딩(재정의)
	//1개 추상메서드 오버라이딩(재정의)
}