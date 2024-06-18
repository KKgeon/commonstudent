package days04;

import java.util.Scanner;

/**
 * @author geon
 * @date 2024. 1. 4. - 오후 2:21:08
 * @subject 정수(n)를 입력받아서 
 * @content	짝수(even number), 홀수(odd numver)
 * 			
 */		
public class Ex05_04 {
	public static void main(String[] args) {
		int n;

		try(Scanner scanner = new Scanner(System.in);) {
			System.out.print(">정수 입력? ");
			n = scanner.nextInt();
			/*
			String result = "짝수";
						
			if (n % 2 != 0) {				
				result = "홀수";
			}
			*/
			String result = (n % 2 == 0 ? "짝수" : "홀수");
			System.out.println(result);
		} catch (Exception e) {
		}
	}//main
}//class
