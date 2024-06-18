package days12;

/**
 * @author geon
 * @date 2024. 1. 16. - 오후 12:21:08
 * @subject	숙제2
 * @content	이건 좀 쉬워보임..
 */
public class Ex04_03 {
	public static void main(String[] args) {
		//3행4열짜리 2차원배열
		int [][] n = {
				{1,2,3,4},
				{5,6,7,8},
				{9,10,11,12}
		};
		//2행6열 2차원배열
		int[][] m = new int [2][6];
		
//		[][][][][][]
//		[][][][][][]
		//n->m\

		
		/*
		 * m[0][0] = n[0][0] 
		 * m[0][1] = n[0][1]
		 * m[0][2] = n[0][2]
		 * m[0][3] = n[0][3]
		 * m[0][4] = n[1][0]
		 * m[0][5] = n[1][1]
		 * 
		 * m[1][0] = n[1][2]
		 * m[1][1] = n[1][3]
		 * m[1][2] = n[1][0]
		 * m[1][3] = n[2][1]
		 * m[1][4] = n[2][2]
		 * m[1][5] = n[2][3]

		 * 
		 */
		
		
		
		
		
		//2차원배열에서 2차원배열로 옮기기
		
		for (int i = 0; i < m.length; i++) {
			for (int j = 0; j < m.length; j++) {
				
			}
		}
		
		
		
		
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
