package days08;

public class Ex02 {
	public static void main(String[] args) {

		//연산자 제어문 함수

		int x = 10;
		int y = 20;

		System.out.printf("x=%d, y=%d\n", x, y);

		// 두 기억공간의 값을 교환하는 swap()함수 만들기

		/*
		int temp = x;
		x = y;
		y = temp;
		 */
		swap(x, y);
		
		System.out.printf("x=%d, y=%d\n", x, y);


	}//main
	/*
	 *
	 * 매개변수 + 함수 호출 방법
	 * 1. Call By Name		drawLine();
	 * 		ㄴ 매개변수는 없이 함수명으로 호출
	 * 2. Call By Value		drawLine(10);
	 * 		ㄴ 매개변수의 값을 가지고 함수를 호출
	 * 		ㄴ swap(x, y) == swap(10, 20);
	 * 
	 * 3. Call By Reference
	 */
	 
	

	public static void swap(int x, int y) {
		
		System.out.printf("1. swap x=%d, y=%d\n", x, y);
		int temp = x;
		x = y;
		y = x;
		
		System.out.printf("2. swap x=%d, y=%d\n", x, y);
		
	}

}//class
