package days04;

import java.util.Scanner;

/**
 * @author geon
 * @date 2024. 1. 4. - 오후 2:21:08
 * @subject 정수(n)를 입력받아서 
 * @content	짝수(even number), 홀수(odd numver)
 * 			라고 출력하자.
 */
public class Ex05_02 {
	public static void main(String[] args) {
		int n;
		
		try(Scanner scanner = new Scanner(System.in);) {
			System.out.print(">정수 입력? ");
			n = scanner.nextInt();
			if (n % 2 == 0) {				
				System.out.println("짝수(even number)");
			}//if1
			if (n % 2 != 0) {
				System.out.println("홀수(odd numver)");
			}
			
		} catch (Exception e) {
		}
	}//main
}//class
