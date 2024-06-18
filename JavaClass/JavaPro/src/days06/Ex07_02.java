package days06;

public class Ex07_02 {

	public static void main(String[] args) {

		int d = 2;
		int i = 1;

		while (d<=9) {
			i = 1;
			System.out.printf("%d단\n", d);
			while (i <= 9) {
				
				System.out.printf("%d * %d = %d\n", d, i, d*i);		
				i++;

			}//while i
			d++;
		}//while d
		
		
		
		



		//		for (int d = 2; d <= 9; d++) {
		//			System.out.printf("%d단\n", d);
		//			for (int i = 1; i <= 9; i++) {
		//				System.out.printf("%d * %d = %d\n", d, i, d*i);
		//
		//			}

		//		}//for
	}//m

}//c
