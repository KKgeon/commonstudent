package days05;

/**
 * @author geon
 * @date 2024. 1. 5. - 오후 4:39:23
 * @subject	if, switch, for, while, do~while
 * @content	brake, foreach
 * 		[continue 문]
 */
public class Ex09 {

	public static void main(String[] args) {
		/* [1]
		int sum = 0;
		for (int i = 0; i <= 10; i++) {
			System.out.printf("%d+", i);
			sum = sum + i;		
		}
		System.out.printf("\b=%d\n", sum);
		 */


		/* [2]
		int sum = 0;
		for (int i = 0; i <= 10; i++) {
			if (i % 2 != 0) {
				System.out.printf("%d+", i);
				sum = sum + i;	
			}

		}
		System.out.printf("\b=%d\n", sum);
		 */

		/* [3]		<= 홀수만 더하고자할때 가장 권장되는 방식
		int sum = 0;
		for (int i = 1; i <= 10; i+=2) {
			
			sum = sum + i;
			System.out.printf("%d+", i);

		}//for
		System.out.printf("\b=%d\n", sum);
		*/

	}//main

}//class
