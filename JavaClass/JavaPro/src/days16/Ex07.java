package days16;

/**
 * @author geon
 * @date 2024. 1. 22. - 오후 12:28:32
 * @subject 오버로딩(overloading)과 오버라이딩(overrideing)
 * @content	중복함수					재정의함수
 * 			drawLine()
 * 			drawLine(int n)
 * 			drawLine(int n, Style s)
 * 
 * 			오버라이딩(재정의함수) ? 
 * 			Super클래스로부터 상속받은 메서드를 재정의한 것.
 * 			- Override 사전적의미 ? = overwrite == 위에 덮어쓰다.
 * 
 * 			[오버라이딩의 조건]
 * 			1. 메서드명 수정X
 * 			2. 매개변수가 같아야 한다. (다르면 오버로딩)
 * 			3. 리턴타입 동일해야한다.
 * 			4. 접근지정자는 부모의 접근지정자 범위보다 같거나 넓어야 한다.
 * 			5. 부모의 메서드보다 많은 수의 예외를 선언할 수 없다.
 *			6. 인스턴스 메서드		<->	 static 메서드로 변경 X
 * 
 *
 * 
 * 
 * 
 */
public class Ex07 {
	public static void main(String[] args) {

	}//m
}//c


class Parent{
	
	//public > protected > package(default) > private
	int print(String n, int a) {
		return 100;
	}

}



class Child extends Parent{

	@Override
	int print(String n, int a) {
		return 100+a;
	}
/*
 *  이건 오버로딩 예시
	@Override
	int print(String n) {
		return 100;
	}
*/

}