package days19;

public class Ex05 {
	public static void main(String[] args) {
		//[java.lang.Math 클래스]
		// 모든 멤버들 : static
		// 때문에 객체 생성 안해도 Math. 쓰면 사용할수잇음.
		System.out.println(Math.random());
		System.out.println(Math.pow(2, 3));
		System.out.println(Math.max(2, 3));
		System.out.println(Math.min(2, 3));
		System.out.println(Math.abs(-99));
		System.out.println(Math.abs(-99.98));
		System.out.println(Math.sqrt(4));
		
		System.out.println(Math.E);
		System.out.println(Math.PI);
		
		//기억해두기
		//올림(절상), 내림(절삭), 반올림 
		
		//double 올림(절상)
		System.out.println(Math.ceil(2.0));
		System.out.println(Math.ceil(2.179));
		System.out.println(Math.ceil(2.579));
		System.out.println(Math.ceil(2.979));
		
		//double 내림(절삭)
		System.out.println(Math.floor(2.0));
		System.out.println(Math.floor(2.179));
		System.out.println(Math.floor(2.579));
		System.out.println(Math.floor(2.979));

		// 소숫점 첫 번째 자리에서 반올림 long
		System.out.println(Math.round(2.179));
		System.out.println(Math.round(2.579));
		System.out.println(Math.round(2.979));
		
		//Math 클래스 최대 성능을 얻기 위해서 JVM이 설치된 OS의 메서드를 호출해서 처리한다.
		//그러다보니 OS에 따라서 결과가 다르게 나오기도 한다.
		
		//--> [StrictMath 클래스] 성능 포기하고
		// 						결과값 동일하게 처리하기 위한 클래스
	}//m
}//c
