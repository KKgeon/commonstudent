package days07;

/**
 * @author geon
 * @date 2024. 1. 9. - 오후 4:42:24
 * @subject
 * @content
 */
public class Ex10 {
	public static void main(String[] args) {
		
		int a = 10;
		int b = 20;
		int c;

		//두 정수 a,b의 합을 구해서 출력
		//두 정수의 합을 구해서 반환하는 메서드(함수) 선언 + 호출
		//c = a + b;
		c = sum(a,b); //함수호출
		System.out.printf("%d+%d=%d\n", a, b, c);
		
		
		
		System.out.printf("%d\n", sum(a, b, c));
		
		int d = 100;
		System.out.println();
		
	}//m

	private static int sum(int a, int b) {
		// TODO Auto-generated method stub
		return a + b;
	}//메서드선언부분

	private static int sum(int a, int b, int c) {
		// TODO Auto-generated method stub
		return a + b + c;
	}//메서드선언부분
	
	private static int sum(int a, int b, int c, int d) {
		// TODO Auto-generated method stub
		return a + b + c + d;
	}//메서드선언부분
	
	
	/*
	//함수 메서드 선언
	public static int sum(int a, int b){
		//int c = a + b;
		//return c;
		
		return a + b;
	}
	*/
			
}//c
