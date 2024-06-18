package days08;

public class Ex04_02 {

	public static void main(String[] args) {
		//1) 1~n까지의 합을 반환하는 일반함수
		//2) 1~n까지의 합을 반환하는 재귀함수
		int n = 10;
		//int result = sum(n);
		int result = recursiveSum(n);
		System.out.printf("1~%d=%d\n", n, result);



	}//m

	//재귀함수 잘 쓰지 않지만 꼭 써야할때가 있다. 문법익히기 위한 예제.
	private static int recursiveSum(int n) {
		if (n == 1) return n; 
		else return n + recursiveSum(n-1); 
	}

	
	
	/*
	 * [재귀함수 처리 과정 설명]
	 * recursiveSum(10)
	 * 	ㄴ return 10 + 9 + 8 + 7 + 6 + ~ 2 + 1	 recursiveSum(10...1) 비효율적인작업
	 * 트리 구조를 검색할때 쓰인다.
	 * 
	 */

	//일반함수

	private static int sum(int n) {
		int result = 0;
		for (int i = 1; i <= n; i++) {
			result += i;
		}
		return result;
	}


}//c
