package days05;

import java.io.LineNumberInputStream;

/**
 * @author geon
 * @date 2024. 1. 5. - 오후 2:26:01
 * @subject
 * @content
 */
public class Ex06_02 {
	public static void main(String[] args) {
		// 한 라인에 ASCII 10개 출력

//		for (int i = 0; i < 256; i++) {
//			System.out.printf("[%c]", i);
//			if (i % 10 == 9) {
//				System.out.println();
//			}
//			if (i % 10 == 9) {
//				System.out.print(i);				
//			}
//
//		}//for 까지가 내가한거
		
		for (int i = 0; i < 256; i++) {
			if (i % 10 == 0) {System.out.printf("%d : ", i/10+1);}
//			if (i % 10 == 0) {System.out.printf("%d : ", lineNumber++);}
			
			System.out.printf("[%c]", i);
			if (i % 10 == 9) {
				System.out.println();
			}
		

		}//for
	}

}
