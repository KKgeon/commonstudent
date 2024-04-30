package days16;

public class Ex12 {
	public static void main(String[] args) {

		//[클래스간의 형변환]
		/*
		// 반드시 상속 관계가있어야된다.
		
		//Regular emp = new Temp(); X
		
		
		//Up Casting 자동 업캐스팅
		Regular emp = new SalesMan();
		
		//Down Casting 다운캐스팅
		//다운캐스팅은 자동으로 형변환되지 않아 강제로 형변환해줘야한다.
		//클래스의 경우에도 똑같이 cast연산자를 사용
		SalesMan sm = (SalesMan) emp;
		*/
		
		
		//위의 사례처럼 업캐스팅해서 생성해준 객체만이 강제로 다운캐스팅해줄수있다.
		Regular emp	= new Regular();
		SalesMan sm = (SalesMan)emp;
		sm.getName();
		
	}//c	
}//c
