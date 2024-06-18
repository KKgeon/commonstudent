package days03;

/**
 * @author geon
 * @date 2024. 1. 3. - 오전 10:38:25
 * @subject [형변환 설명]
 * @content
 */
public class Ex01_02 {
	public static void main(String[] args) {
		/*
		 * [형변환]
		 * 1. 정의? 변수 또는 상수의 자료형(타입)을
		 * 다른 자료형(타입)으로 변환하는 것.
		 * 2. 예
		 * 		int- > byte
		 * 		byte-> int
		 * 		int ->f loat
		 * 		double-> int
		 * 		String-> int
		 * 		int -> srting
		 * 		char -> string
		 * 		String -> char
		 * 3. 형 변환하는 방법
		 * 1) 자동 형변환 -2가지
		 * 2) 강제 형변환
		 * 		ㄱ. 경우
		 * 		ㄴ. 방법
		 * 				(변환하고자하는 자료형) cast연산자
		 * 			cast강제형변환
		 * 
		 * 				3+5*2 = 13
		 * 				   (1)
		 * 				3 +	10
		 * 				(2)
		 * 		
		 * 			(3+5)*5	()최우선연산자
		 *				곱셈먼저 
		 *
		 * 				연산자 우선순위 * > +
		 */

		byte b = 100; //[][][][][][][][] 8비트
		//자동 형변환 된 첫번째 경우
		//좌측항의 공간이 더 크면 자동으로 형변환됨
		long l = b;	 //[][][][][][][][] [][][][][][][][] [][][][][][][][] [][][][][][][][] [][][][][][][][] [][][][][][][][] [][][][][][][][] [][][][][][][][]
		System.out.println(b);

		double d =l; // [S][E][][][][][][] [][][][][][][][] [M][][][][][][][] [][][][][][][][] [][][][][][][][] [][][][][][][][] [][][][][][][][] [][][][][][][][] 
		System.out.println(d);
		//정수계열보다 실수계열의 자료형의 공간크기가 더 작아도 더 크다고 인식되어져서 자동형변환이 된다.
		float f = l;
		System.out.println(f);

		//	int i = 100L; 자동형변환 X
		//Type mismatch: cannot convert from double to float
		//float f2 = 3.14; 자동형변환 X
		//float f2 = 3.14F; 자동형변환 O

		int x = 100;
		long y = 100;
		//Type mismatch: cannot convert from long to int
		//		작은 자료형 연산에 큰자료형 => 자동 큰자료형
		long z = x + y; // [][][][] + [][][][]



	}
}
