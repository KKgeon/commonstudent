package days07;

public class Ex08 {
	public static void main(String[] args) {
		//계차수열
		//20번째 항까지만 계산하여 합을 구함.
		// 계차수열 시험냄
		//로직도 이해해보자 집에가서 디버깅
		
		int term = 1;
		int sum = 0;
		int dF = 0;
		
		for (int i = term; i <= 20; i++) {
			term += dF;
			System.out.printf("%d+", term);
			dF++;
			sum += term;
		}
		System.out.printf("=%d\n", sum);
		
		
	}//main
}//class
