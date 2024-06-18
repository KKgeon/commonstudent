package days17;

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * @author kenik
 * @date 2024. 1. 23. - 오후 3:32:52
 * @subject
 * @content
 */
public class Ex13 {

	public static void main(String[] args) {
		int a = 0, b = 0;		
		Scanner scanner = new Scanner(System.in);
		
		// 예외 처리 방법 중 1가지. try~ catch
		try {
			System.out.print("> a, b 두 정수 입력 ? ");
			// InputMismatchException
			a = scanner.nextInt();
			b = scanner.nextInt();
		} catch (InputMismatchException e) {
			System.out.println("입력 유효성 실패..");
		}
				
		
		// ArithmeticException  5 / 0
		/*
		if( b == 0 ) {
			System.out.println("0으로 나누면 안됩니다.");
			return ; // 
		}
		*/
		
		try {
			double c = a / b;			
			System.out.printf("%d / %d = %.2f\n", a,b,c);
			
		} catch (Exception e) {
			System.out.println("0으로 나눌 수 없다.");
		}
		
		
		System.out.println("=정상 종료=");

	} // main

} // class




