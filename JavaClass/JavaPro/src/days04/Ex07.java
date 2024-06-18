package days04;

import java.util.Scanner;

/**
 * @author geon
 * @date 2024. 1. 4. - 오후 4:53:00
 * @subject	분기문 : switch문
 * @content
 */
public class Ex07 {
	public static void main(String[] args) {
		int n;

		try(Scanner scanner = new Scanner(System.in);) {
			System.out.print(">정수 입력? ");
			n = scanner.nextInt();
			
			final int ZERO = 0;
			switch (n % 2) {
			case ZERO:				
				System.out.println("짝수(even number)");
				break;
			case 1:		
				System.out.println("홀수(odd numver)");
				break;
			default:
				break;
			}

		}catch (Exception e) {
			}

			/*
			 * if(condition){
			 *  명령코딩;
			 *  }
			 * 명렁코딩 한줄인 경우에는 {}을 생략할수있다
			 * if(condition) 명령코딩;
			 * 
			 * if(condition) 명령코딩;
			 * else			 명령코딩;
			 * 
			 * 
			 * for(초기식; 조건식; 증감식) 명령코딩; //마찬가지로 한줄일땐 생략가능하다			
			 * 
			 * 
			 */

			// key : 변수, 수식.
			// value : 리터럴,정수 		변수X
			/*
		switch (key) {
		case value:
			break;
		case value:
			break;
		case value:
			break;

		default:
			break;
		}
			 */
		}//main
	}//class
