package days07;

/**
 * @author geon
 * @date 2024. 1. 9. - 오후 2:34:54
 * @subject
 * @content
 */
public class Ex07 {
	public static void main(String[] args) {
		//[문제] 피보나치 수열
		//항(term)
		// 1+1+2+3+5+8+13+21+34+


		//3번풀이 //시험에 냄
		
		int firstTerm = 1;
		int secondTerm = 1;
		int nextTerm;
		int sum = firstTerm + secondTerm;
		System.out.printf("%d+%d+", firstTerm, secondTerm);

		while ((nextTerm = firstTerm + secondTerm) <= 100) {
			if (nextTerm>100)break;
			sum += nextTerm;

			System.out.printf("%d+", nextTerm);
			firstTerm = secondTerm;
			secondTerm = nextTerm;
		}//while

		System.out.printf("=%d\n", sum);
		
		
		
		
		
		
		
		
		//2번풀이
/*
		int firstTerm = 1;
		int secondTerm = 2;
		int nextTerm;
		int sum = firstTerm + secondTerm;
		System.out.printf("%d+%d+", firstTerm, secondTerm);

		while (true) {
			nextTerm = firstTerm + secondTerm;
			if (nextTerm>100)break;
			sum += nextTerm;

			System.out.printf("%d+", nextTerm);
			firstTerm = secondTerm;
			secondTerm = nextTerm;
		}//while

		System.out.printf("=%d\n", sum);

*/



		//1번풀이
		/*
		final int [] p = new int [100];
		p[1] = 1;
		p[2] = 1;
		int sum = p[1] + p[2];

		System.out.printf("%d+%d+", p[1], p[2]);
		for (int i = 3; i <= 100; i++) {
			p[i] = p[i - 1] + p[i - 2];
			if (p[i] > 100) break;	
			System.out.printf("%d+", p[i]);
		sum += p[i];
		}//for
		System.out.printf("=%d\n", sum);
		 */
	}//main

}//class
