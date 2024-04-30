package days17;

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * @author kenik
 * @date 2024. 1. 23. - 오후 3:32:52
 * @subject  [ 다중 catch문 ]  설명
 * @content
 */
public class Ex13_02 {

	public static void main(String[] args) {
		int a = 0, b = 0;		
		Scanner scanner = new Scanner(System.in);
		 
		// ArithmeticException  5 / 0
		/*
		if( b == 0 ) {
			System.out.println("0으로 나누면 안됩니다.");
			return ; // 
		}
		*/
		
		try {
			
			System.out.print("> a, b 두 정수 입력 ? ");
			// 1)  InputMismatchException
			a = scanner.nextInt();  // 5
			b = scanner.nextInt();  // a
			
			double c = a / b;	// 	2) ArithmeticException	
			System.out.printf("%d / %d = %.2f\n", a,b,c);
			
		} catch (InputMismatchException e) {
			System.out.println("입력 유효성 실패!");
		} catch (ArithmeticException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		System.out.println("=정상 종료=");

	} // main

} // class




