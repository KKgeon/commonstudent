package days05;

import java.util.Scanner;

public class Ex02_02 {
	public static void main(String[] args) {



		int kor;

		try(Scanner scanner = new Scanner(System.in)) {
			System.out.print("> 국어 점수 입력 ? ");
			kor = scanner.nextInt();
			
			int result = (  kor>=0 && kor <= 100 ) ? 1 : 0;

			switch (  result ) {
			case 1:

				switch ( kor / 10 ) {
				case 10:   
					System.out.println("수");
					break;
				case 9:
					System.out.println("수");
					break;
				case 8:
					System.out.println("우");
					break;
				case 7:
					System.out.println("미");
					break;
				case 6:
					System.out.println("양");
					break;
				default:
					System.out.println("가");
					break;

				}

				break;

			case 0:
				System.out.println("0~100 입력잘못!!");
				break;
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


	}
}
