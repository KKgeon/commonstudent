package days04;

import java.util.Iterator;

/**
 * @author geon
 * @date 2024. 1. 4. - 오후 4:02:13
 * @subject	for문사용해서 1~10까지의 합을 출력
 * @content
 */
public class Ex06_02 {
	public static void main(String[] args) {

		int sum = 0;
		for (int i = 0; i <= 10; i++) {
			System.out.printf("%d+", i);
			sum = sum + i;		//sum += i;				
		}
		System.out.printf("\b=%d\n", sum);
	}
	}








	
	
	
	//[2]


	/*
	public static void main(String[] args) {

		int sum = 0;
		for (int i = 0; i <= 10; i++) {
			System.out.printf(i==10 ? "%d" : "%d+", i);

			sum = sum + i;		//sum += i;				
		}
		System.out.printf("=%d", sum);
	}
}
	 */

	
	
	//[1]
	
	/*
public static void main(String[] args) {

	int sum = 0;
	for (int i = 0; i <= 10; i++) {
		if (i == 10) {
			System.out.printf("%d", i);
		} else {
			System.out.printf("%d+", i);
		}
		sum = sum + i;		//sum += i;				
	}
	System.out.printf("=%d", sum);
}
}
	 */