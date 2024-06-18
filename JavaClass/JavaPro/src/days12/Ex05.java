package days12;

/**
 * @author geon
 * @date 2024. 1. 16. - 오후 12:23:13
 * @subject
 * @content
 */
public class Ex05 {
	public static void main(String[] args) {
		//[가변배열]
		//1반 학생수 : 10명
		//2반 학생수 : 8명
		//3반 학생수 : 20명
//		int[]m=new int[10+8+20];
//		int [][] m = new int [3][20];
		int [][]m = new int [3][];
		m[0]= new int [10];
		m[1]= new int [8];
		m[2]= new int [20];
		
		
		
		dispN(m);
		
	}//m
	
	private static void dispN(int[][] n) {
		for (int i = 0; i < n.length; i++) {//행갯수
			for (int j = 0; j < n[i].length; j++) {//열(별)갯수
				System.out.printf("[]");

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
