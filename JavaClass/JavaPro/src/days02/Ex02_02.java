package days02;

public class Ex02_02 {

	public static void main(String[] args) {
		//String 문자열 					%s
		//double 숫자(실수) 대표적인 자료형	%f
		//int	 숫자(정수) 대표적인 자료형		%d
		//char 	 하나의 문자를 나타내는 자료형 	%c
		//지역변수(local variable)
		String name = "홍길동"; //main() 메서드 안에서 사용가능.

		//{}지역(범위,영역)연산자
		{
			//Type mismatch: cannot convert from char to String
			char grade = 'A';

			System.out.printf("1. 이름 : %s\"\n", name);
			//System.out.println();
			System.out.printf("1. 등급 : \'%c\'\n", grade);
		}
		//System.out.printf("2. 이름 : %s\"\n", name);
		//grade cannot be resolved to a variable
		//변수설정을 하면 그 지역 안에서만 사용 가능하다. 그레이드는 위에 대괄호 안에서 선언해서 그 밖에선 사용못함
		//System.out.printf("2. 등급 : \'%c\'\n", grade);
	}//main

}//class
