package days06;

import java.util.Iterator;

/**
 * @author geon
 * @date 2024. 1. 8. - 오후 2:44:12
 * @subject
 * @content
 */
public class Ex04_02 {
	//대실패함. if문 제대로 복습하자.
	public static void main(String[] args) {

		for (int i = 'A', count = 1, lineNumber = 1; i < 'z'; i++) {

			if (Character.isAlphabetic(i)) {

				if(count % 10 == 1) System.out.printf("%d : ", lineNumber++);
				System.out.printf("%c(%03d)", (char) i, i);
				
				
				/*
				if (Character.isAlphabetic(i)) {
					//대문자 %10 ==4 개행
					//이 안에 if문을 또 넣는다.
					if (i % 10 == 4) System.out.println(); 
				}	else { // 소문자 개행
					// 이 안에 if문 넣음
					if (i % 10 == 0) System.out.println();

				}
				 */  // 난 이새끼 왜안되는데 ㅋㅋ
				if (count % 10 == 0) {
					System.out.println();
					
				}
				
				count++;
			}//if

		}//for













		//
		//		for (int i = 'A'; i <= 'z'; i++) {
		//
		//			if ( i > 'Z' && i < 'a') continue;{
		//
		//				System.out.printf("%c(%03d)", (char)i, i);
		//				if (i <= 'Z') {
		//					if (i % 4 == 0) {
		//						System.out.println();
		//					} 
		//					else {
		//						if (i % 10 == 0) {
		//							System.out.println();}
		//					}
		//
		//				}
		//
		//			}
		//
		//
		//
		//		}//for





	}//m

}//c
