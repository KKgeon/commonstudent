package days16;

/**
 * @author geon
 * @date 2024. 1. 22. - 오후 3:07:33
 * @subject
 * @content
 */
public class Ex10 {
	public static void main(String[] args) {
/*
		//[1] 사원 객체 생성
		Employee emp1 = new Employee("이준희", "서울 강남구", "010-6549-6548", "2020-11-11");
		emp1.dispEmpInfo();
		//object.toString()
		//days16.Employee@2a18f23c
		//패키지명.클래스명@16진수값
		//toString()가 사원 정보를 출력하도록 오버라이딩(재정의)
		System.out.println(emp1.toString());
		System.out.println(emp1);
*/

		//[2] Regular 객체 생성
		//		Regular emp2 = new Regular("주호민", "서울 양천구", "010-4548-9999", "2021.05.15", 4000000);
		//Employee로부터 상속받은 dispEmpInfo() 메서드 단점.(문제점)
		//사원정보를 출력하는 데 basePay는 출력 X
		//		emp2.dispEmpInfo();



		//정규직은 사원이다 (is ~a 관계)
		//자식객체(new Regular)를 생성해서 부모클래스(Employee emp2)에 참조시킬 수 있다.

		//클래스의 자동 형변환(Up Casting)
		/*
		Employee emp2 = new Regular("주호민", "서울 양천구", "010-4548-9999", "2021.05.15", 4000000);
		emp2.dispEmpInfo();
		 */

		//문제점
		//emp2.getPay(); X 사용못함



		//[3]
		
		//클래스의 자동 형변환(Up Casting)
		/*
		Employee emp3 = new SalesMan("침착맨", "경기도 성남시", "010-4598-9873", "2025.03.30", 500000, 20, 70000);
		*/
		//System.out.println(emp3.getPay());
		
		
		//[4]
		Temp emp4 = new Temp("박정호", "서울 목동", "010-9874-6548", "2020.01.01", 20, 250000);
		emp4.dispEmpInfo();

	}//m
}//c
