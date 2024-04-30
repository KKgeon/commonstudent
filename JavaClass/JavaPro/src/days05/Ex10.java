package days05;

import java.util.Scanner;

/**
 * @author geon
 * @date 2024. 1. 5. - 오후 4:52:18
 * @subject
 * @content
 */
public class Ex10 {
	public static void main(String[] args) {
		//1~10=55

		//		int sum = 0;
		//		int n;
		//		Scanner scanner = new Scanner(System.in);
		//		System.out.print("> n 입력? ");
		//		n = (scanner.nextInt());
		//		for (int i = 0; i <= n; i++) {
		//			sum += i;
		//			System.out.printf("%d+", i);
		//					
		//		}
		//		System.out.printf("\b=%d\n", sum);


		//[문제] 두 정수 n, m 입력받아서
		//두 정수 사이의 합을 출력하는 코딩.



		/*
		int n, m;
		Scanner scanner = new Scanner(System.in);
		System.out.print("n, m 입력?");
		n = (scanner.nextInt());
		m = (scanner.nextInt());

		int sum = 0;

		for (int i = n; i <= m; i++) {
			sum += i;
			System.out.printf("%d+", i);

		}//for
		System.out.printf("=%d\n", sum);
		 */

		//[2]
		/*
		int n, m ;
	      Scanner scanner = new Scanner(System.in);
	      System.out.print("> n_m 입력 ? ");
	      n = scanner.nextInt();
	      m = scanner.nextInt();

	      int sum = 0;

	      if (n > m) {
	    	  int temp = n;
	    	  n=m;
	    	  m=temp;

		}

	      for (int i = n; i <= m; i++) {
	         sum += i;
	         System.out.printf("%d+", i);
	      } // for
	      System.out.printf("=%d\n", sum);
		 */

		//[3]
		/*
		int n, m ;
	      Scanner scanner = new Scanner(System.in);
	      System.out.print("> n_m 입력 ? ");
	      n = scanner.nextInt();
	      m = scanner.nextInt();

	      int sum = 0;

	      int min = n > m ? m : n;
	      int max = n > m ? n : m;

	      for (int i = n; i <= m; i++) {
		         sum += i;
		         System.out.printf("%d+", i);
		      } // for
		      System.out.printf("=%d\n", sum);
		 */ 

		//[문제]
		//두 정수 n,m을 입력받아서
		//두 정수의 홀수의 합 출력

		int n, m;
	      Scanner scanner = new Scanner(System.in);
	      System.out.print("> n_m 입력 ? ");
	      n = scanner.nextInt();
	      m = scanner.nextInt();

	      int min = n > m ? m : n;
	      int max = n > m ? n : m;
	      
	      int sum = 0;
			for (int i = n; i <= m; i++) {
				if (i % 2 != 0) {
					sum = sum + i;
					System.out.printf("%d+", i);
				}				
			}
			System.out.printf("\b=%d\n", sum);

	}//main
}//class
