package days04;
import java.util.Scanner;

/**
 * @author kenik
 * @date 2024. 1. 4. - 오후 3:08:58
 * @subject  조건문 if, if~else 활용
 * @content  국어 점수를 입력받아서
 *           등급(수, 우, 미, 양, 가) 출력 
 */
public class Ex07_02 {

	public static void main(String[] args) {

		int kor;

		try(Scanner scanner = new Scanner(System.in)) {
			System.out.print("> 국어 점수 입력 ? ");
			kor = scanner.nextInt(); // 80

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
			case 5:	System.out.println("가");		
			break;
			case 4:	System.out.println("가");		
			break;
			case 3:	System.out.println("가");		
			break;
			case 2:	System.out.println("가");		
			break;
			case 1:	System.out.println("가");		
			break;
			case 0:	System.out.println("가");		
			break;

			default:System.out.print("국어 점수(0~100). 입력 잘못(숫자X)");
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

	} // main

} // class