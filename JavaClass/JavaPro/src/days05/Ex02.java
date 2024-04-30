package days05;

import java.util.Scanner;

/**
 * @author geon
 * @date 2024. 1. 5. - 오전 10:51:23
 * @subject
 * @content
 */
public class Ex02 {
	public static void main(String[] args) {


		int kor;

		try(Scanner scanner = new Scanner(System.in)) {
			System.out.print("> 국어 점수 입력 ? ");
			kor = scanner.nextInt(); // 80

			if (kor >= 0 && kor <= 100) {
				switch (kor/10) {
				case 10: System.out.println("수");			
				break;
				case 9:	System.out.println("수");		
				break;
				case 8:	System.out.println("우");		
				break;
				case 7:	System.out.println("우");		
				break;
				case 6:	System.out.println("양");		
				break;
				
				default: System.out.println("가");		
				break;


				}

			}
			else {System.out.print("국어 점수(0~100). 입력 잘못(숫자X)");
			}






			/*
     if ( kor>=90  && kor <= 100 ) {
        System.out.println("수");
     }  
     else if ( kor>=80  && kor < 90 ) {
        System.out.println("우");
     }  
     else if ( kor>=70  && kor < 80 ) {
        System.out.println("미");
     }  
     else if ( kor>=60  && kor < 70 ) {
        System.out.println("양");
     }  
     else if ( kor>=0  && kor < 60) {
        System.out.println("가");
     } // if
			 */
		} catch (Exception e) {

		} // try

	} // main
}

