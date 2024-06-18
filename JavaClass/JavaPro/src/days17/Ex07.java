package days17;

public class Ex07 {
	public static void main(String[] args) {
		//[인터페이스 장점]
		// 1. 개발 시간을 단축시킬 수 있다.
		//		이유? 인터페이스만 작성이 되면		-->		개발진행
		//			인터페이스를 구현한 클래스 선언 X
		// 2. 표준화가 가능하다
		//	
		// 3. 서로 관계없는 클래스들에게 관계를 맺어 줄 수 있다.
		// 		같은 super(조상, 부모)클래스가 아니라도
		//		같은 인터페이스만 구현했다면 관계를 맺어 줄 수 있다.
		// 4. 독립적인 프로그래밍이 가능하다.



		Idisp a1 = new A();
		Idisp b1 = new B();

		print(a1);
		print(b1);

		//참고) 클래스 제작사(생산자)	-> 클래스 사용자
		//		provider			user
		//		인터페이스만 선언		사용 가능
		//		구현된 클래스 X		

	}//m

	static void print(Idisp a) {


	}

}//c

interface Idisp{
	void disp();

}

class A implements Idisp{

	@Override
	public void disp() {
		// TODO Auto-generated method stub

	}

}
class B implements Idisp{

	@Override
	public void disp() {
		// TODO Auto-generated method stub

	}

}
