package days07;

import java.util.Scanner;

public class Ex02 {
	public static void main(String[] args) {
		int com , user;
		String [] rps = { "", "가위", "바위", "보" };
		char con = 'y';
		String strUser = null;
		String regex = "[1-3]";

		try (Scanner scanner = new Scanner(System.in)) {
			do {
				com = (int)(Math.random() * 3) + 1;		
				
				do {
					System.out.print("> user 가위(1),바위(2),보(3) 선택 ? ");
					user = scanner.nextInt();  
				} while (!strUser.matches(regex));
			
				
				
				//user = scanner.nextInt(); 
				//입력값에 대한 유효성 검사
				
				System.out.printf("컴퓨터 : %s, 사용자 : %s\n"
						, rps[com], rps[user] );
				
				

				switch (user - com) {
				case -2: case 1:
					System.out.println("사용자 승리");
					break;
				case -1: case 2:
					System.out.println("컴퓨터 승리");
					break; 
				default:
					System.out.println("무승부");
					break;
				} 

				System.out.println("다시 게임할거니? ");
				con = (char)System.in.read();
				System.in.skip(System.in.available()); // 13, 10

			} while (Character.toUpperCase(con) == 'Y');




		} catch (Exception e) {
		}


	} // main

	private static String nextInt() {
		// TODO Auto-generated method stub
		return null;
	}
}//c
