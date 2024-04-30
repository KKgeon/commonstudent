package days03;

/**
 * @author geon
 * @date 2024. 1. 3. - 오후 12:19:44
 * @subject 연산자(operator)
 * @content 1. 산술 연산자
 */
public class Ex04_02 {

	public static void main(String[] args) {

		int i = 10, j = 3;
		System.out.println( i + j );// + 덧셈연산자
		System.out.println( i - j );// -
		System.out.println( i * j );// *
		System.out.println( (double)i / j );// / 10/3 = 3 (몫)
		// 나머지 연산자
		System.out.println( i % j );// 나머지(remainder)

		// (주의할점)
		// /by zero
		//ArithmeticException (산술적 예외)가 발생
		//System.out.println( 10 / 0 );

		// Infinity 일졸의 리터럴값
		// System.out.println( 10.0 / 0 ); //실수로 계산하면 에러는 안남

		// System.out.println( 10 % 0 );
		// NaN(Not a Number) 리터럴 
		System.out.println( 10.0 % 0 );
	}

}
