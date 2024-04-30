package days12;

public class Ex04_02 {
	public static void main(String[] args) {

		int [][] n = {
				{1,2,3,4},
				{5,6,7,8}
		};
		dispN(n);
		int row = n.length;
		int col = n[0].length;
		int [] m = new int [row*col];
		//2차원배열 -> 1차원배열 옮기는 코딩
		for (int i = 0; i < n.length; i++) {
			for (int j = 0; j < n[i].length; j++) {
				m[i*col+j] = n[i][j];
			}
		}
		dispM(m);

	}//m

	private static void dispN(int[][] n) {
		for (int i = 0; i < n.length; i++) {//행갯수
			for (int j = 0; j < n[i].length; j++) {//열(별)갯수
				System.out.printf("m[%d][%d]=%d\t",i,j,n[i][j]);

			}//for j
			System.out.println();
		}//for i

	}

	private static void dispM(int[] m) {
		for (int i = 0; i < m.length; i++) {
			System.out.printf("m[%d]=%d\t", i, m[i]);
		}
		System.out.println();
	}
}//c
