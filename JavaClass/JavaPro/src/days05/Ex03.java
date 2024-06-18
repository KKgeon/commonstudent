package days05;

import java.util.Iterator;
import java.util.Scanner;

/**
 * @author geon
 * @date 2024. 1. 5. - 오전 11:33:12
 * @subject	컴퓨터 - 사용자(USER)
 * @content	가위(1) 바위(2) 보(3) 게임
 * 			컴퓨터는 게임을 할 때마다 임의의 수 1~3 까지 발생
 * 			사용자는 1~3까지 입력을 통해 선택.
 */
public class Ex03 {
	public static void main(String[] args) {

		int com;
		int user;
		try (Scanner scanner = new Scanner(System.in)) {
			
			
			
			
			com = (int) Math.random() * 3 + 1;
			System.out.println(">user 가위(1) 바위(2) 보(3) 선택?");
			//입력값에 대한 유효성 검사... 해야함.(지금은안해도됨)
			user = scanner.nextInt();

		
			  String [] rps = { "", "가위", "바위", "보" };
			  
			  System.out.printf("컴퓨터 : %s, 사용자 : %s\n", rps[com] , rps[user]);
		
			
			
			
			
			//승자 패자
			  
//			  switch (user - com) {
//			case 2: case 1:
//				
//				break;
//			case 1: case -1:
//				
//				break;
//
//			default:
//				break;
//			}
//			
			
			
			
			
			
			
			
			
			
			
			/*	
			if (com == 1 && user == 1) {

				System.out.printf("컴퓨터 : 가위, 사용자 : 가위");

			}
			if (com == 2 && user == 1) {

				System.out.printf("컴퓨터 : 바위, 사용자 : 가위");

			}
			if (com == 3 && user == 1) {

				System.out.printf("컴퓨터 : 보, 사용자 : 가위");

			}
			if (com == 2 && user == 1) {

				System.out.printf("컴퓨터 : 바위, 사용자 : 가위");

			}
			if (com == 3 && user == 1) {

				System.out.printf("컴퓨터 : 보, 사용자 : 가위");

			}
			if (com == 2 && user == 2) {

				System.out.printf("컴퓨터 : 바위, 사용자 : 바위");

			}
			if (com == 2 && user == 3) {

				System.out.printf("컴퓨터 : 바위, 사용자 : 보");

			}
			if (com == 3 && user == 2) {

				System.out.printf("컴퓨터 : 보, 사용자 : 바위");

			}
			if (com == 3 && user == 3) {

				System.out.printf("컴퓨터 : 보, 사용자 : 보");
			}
			if (com == 1 && user == 3) {
				System.out.printf("컴퓨터 : 가위, 사용자 : 보");
				}
			if (com == 1 && user == 2) {
				System.out.printf("컴퓨터 : 가위, 사용자 : 바위");
			}

				else {

				}

			} catch (Exception e) {
				// TODO: handle exception
				*/
			}


		}//main
	}//class
