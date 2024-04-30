package days08;

import java.util.Iterator;

public class Ex04_03 {
	public static void main(String[] args) {
		//재귀 함수 예제
		//팩토리얼 (factorial) == 계승
		//정의) 1에서 양의 정수의 곱
		// n! = n * (n-1) * (n-2) *...*1
		// 예) 5! = 5*4*3*2*1
		// 0! == 1 (약속)
		int n = 0;
//		int result = factorial(n);
		int result = recusiveFactorial(n);
		System.out.println("="+result);
		
		
	}//m

	
	//재귀함수
	private static int recusiveFactorial(int n) {
		if (n==1 || n==0) return 1;
		else return n * recusiveFactorial(n-1);
		
	}
	
	//일반함수
	private static int factorial(int n) {
		// n! = n * (n-1) * (n-2) *...*1
		int result = 1;
		for (int i = n; i >= 1; i--) {
			System.out.printf("%d*", i);
			result *= i;
		}
		
		return result;
	}
}//c
