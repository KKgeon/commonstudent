package days17;

public class Ex02 {
	public static void main(String[] args) {
		// 추상클래스 - 공통적인 멤버를 가진 클래스 설계
		//				Employee
		// 객체를 생성할 수 없는 일종의 클래스
		Child c = new Descendant();
		c.dispA();
		c.dispB();
		
		//[업캐스팅]
		// 자식 객체 생성 후 부모 클래스에 참조
		Parent p = new Descendant();
		c.dispA();
		c.dispB();
	}//m

}//c


abstract class Parent{
	//필드 X
	//생성자 X
	//메서드 X

	//추상메서드 		//body 몸체 {} 가 구현이 안된 메서드 
	//					불완전한 메서드
	//				이때 쓰는 키워드가 abstract
	abstract void dispA();
	abstract void dispB();
	
}
//The type Child must implement the inherited abstract method Parent.dispA()
abstract class Child extends Parent{
	//필드
	//생성자
	//메서드
	@Override
	void dispA() {
		System.out.println("> disp A..");
	}



}

class Descendant extends Child{

	@Override
	void dispB() {
		System.out.println("> disp B..");
	}

	//필드
	//생성자
	//메서드
}