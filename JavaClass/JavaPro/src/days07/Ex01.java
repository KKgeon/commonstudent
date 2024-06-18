package days07;

public class Ex01 {
	public static void main(String[] args) {


		// [문제]
		// [2][3][4]
		// [5][6][7]
		// [8][9]


		for (int i = 1; i <= 9; i++) {
			for (int j = 2; j <= 4; j++) {
				System.out.printf("%d*%d=%02d ", j, i, i*j);
			}
			System.out.println();
		}
		System.out.println();
		for (int i = 1; i <= 9; i++) {
			for (int j = 5; j <= 7; j++) {
				System.out.printf("%d*%d=%02d ", j, i, i*j);
			}
			System.out.println();
		}
		System.out.println();
		for (int i = 1; i <= 9; i++) {
			for (int j = 8; j <= 9; j++) {
				System.out.printf("%d*%d=%02d ", j, i, i*j);
			}
			System.out.println();
		}
		System.out.println();


		/*
		for (int i = 1; i <= 9; i++) {
			for (int j = 2; j <= 5; j++) { //단
				System.out.printf("%d*%d=%02d ", j, i, j*i);	
			}//for j 1~5단
			System.out.println();
		}//for i 1~5단
		System.out.println();
		for (int i = 1; i <= 9; i++) {
			for (int j = 6; j <= 9; j++) { //단
				System.out.printf("%d*%d=%02d ", j, i, j*i);	
			}//for j 6~9단
			System.out.println();
		}//for i 6~9단

		 */
	}//m
}//c
