package days24;

public class Ex03 {
	public static void main(String[] args) {
		/*
		 * [중첩클래스와 중첩 인터페이스]
		 * 1. 클래스와 클래스들 간의 관계
		 *       ㄴhas-a 관계   (포함 관계) Car-Engine 
		 *       ㄴis-a 관계   (상속 관계)  
		 *2. 가정)
		 * 어떤클래스가 특정클래스와 관계가 있다면
		 * Engine          Car
		 * 
		 * Car 클래스 내부(안)에 Engine 클래스를 선언한다.
		 * 3. 중첩클래스
		 * 4.장점
		 * 1)두 클래스의 멤버들을 서로 쉽게 접근할 수 있다.
		 * 2)불필요한 관계클래스를 감춤으로써 코드의 복잡성을 줄일 수 있다.
		 * 
		 * 5. 중첩클래스의 종류 : 선언 위치에 따라 구분 
		 * 1) 클래스의 멤버 선언
		 * 	(1)	인스턴스 멤버 클래스
		 * 	(2)	정적(스태틱) 멤버 클래스
		 * 2) 메서드 내부 선언
		 * 	(3)	로컬 클래스 - 메서드가 실행될 때만 사용할 수 있다.
		 * 	
		 * 
		 */

	}//m



}//c
class A{

	//필드
	private int age;

	void disp() {
		//메서드 안에 선언된 클래스 : 로컬 클래스
		// 로컬 클래스는 접근 지정자를 사용할 수 없다.
		class D{
			//스태틱 필드, 메서드는 선언할 수 없다.
			D(){}

			int d1;
			void test() {

			}

		}//class D

		D obj = new D();
	}//disp method


	public static class C{
		int c1;


	}



	//(1) 인스턴스 멤버 클래스
	// A객체가 생성되어야 B중첩 클래스를 사용할 수 있다

	public class B{
		B(){} //생성자
		int b1;	//필드
		void test() {//메서드
			//static 필드, 메서드 선언할 수 없다.	
			/*
			 * 
			 */
		}
	}
	//메서드

}
