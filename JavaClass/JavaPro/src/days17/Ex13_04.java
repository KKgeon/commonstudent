package days17;

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * @author kenik
 * @date 2024. 1. 23. - 오후 3:32:52
 * @subject  [ 중첩 try~catch문 ]
 * @content  
 */
public class Ex13_04 {

	public static void main(String[] args) {
		int a = 0, b = 0;		
		Scanner scanner = new Scanner(System.in);
		 
		try {
			
			System.out.print("> a, b 두 정수 입력 ? ");
			// 1)  InputMismatchException
			a = scanner.nextInt();  // 5
			b = scanner.nextInt();  // 0
			
			// [ 중첩 try~catch문 ]
			try {				
				double c = a / b;	// 	2) ArithmeticException	
				System.out.printf("%d / %d = %.2f\n", a,b,c);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//
			//
			
		} catch (InputMismatchException e) {
			System.out.println( "[1]\n" +  e.toString() );
			System.out.println( "[2]\n" +  e.getMessage() );
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 예외 발생 유무에 상관없이 처리할 구문
			// 파일, DB 열어서 사용 -> 파일, DB close()
			try {
				
			} catch (Exception e2) {
				
			}
		}
		
		
		System.out.println("=정상 종료=");

	} // main

} // class




