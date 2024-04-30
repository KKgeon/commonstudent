package days02;

/**
 * @author geon
 * @date 2024. 1. 2. - 오전 10:28:43
 * @subject 두 기억공간의 값을 바꾸기(암기)
 * @content
 */
public class Ex02_03 {
	public static void main(String[] args) {
		/*
		int x = 10; // 1 2 3... 0
		int y = 20;
		 */

		// 콤마(,)연산자를 통해 나타낼 수 있다.
		// 콤마 연산자는 나열을 나타내는 연산자
		int x =10, y = 20;

		System.out.printf("교환 전 > x=%d, y=%d\n", x, y);

		// [작업]
		// 프로그램 상에서 두 기억공간의 값을
		// 교환하려면 반드시 동일한 자료형의 
		// 임시기억공간이 필요하다.
		{
			int temp = x;
			x = y;
			y = temp;
		}
		System.out.printf("교환 후 > x=%d, y=%d\n", x, y);










		/*
		 * int a = 100;
		 * int b = 100;
		 * int c = 100;
		 */



		/*
		int a, b, c;
		// 대입 연산자는 오른쪽에서부터 왼쪽으로 처리된다 ←
		a = b = c = 100;
		 */

	}//main

}//class
