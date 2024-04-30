package days06;

/**
 * @author geon
 * @date 2024. 1. 8. - 오후 4:17:50
 * @subject
 * @content
 */
public class Ex07 {

	public static void main(String[] args) {
		/*
		 * [구구단] 	== multiplication table
		 * 	 2단		== second level
		 * 1
		 * 2
		 * 3
		 * 4
		 * 5
		 * 6
		 * 7
		 * 8
		 * 9
		 */

		// d=2
		// 2단
		//	ㄴ i=1,2,3,4,5,6,7,8,9			i=10
		// d=3
		// 3단
		//	ㄴ i=1,2,3,4,5,6,7,8,9			i=10
		// d=9
		// 9단
		//	ㄴ i=1,2,3,4,5,6,7,8,9			i=10
		// d=10
		
		for (int d = 2; d <= 9; d++) {
			System.out.printf("%d단\n", d);
			for (int i = 1; i <= 9; i++) {
				System.out.printf("%d * %d = %d\n", d, i, d*i);
				
			}
			
		}

	}//m

}//c
