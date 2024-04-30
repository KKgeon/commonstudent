package days06;

import java.util.Scanner;

public class Ex03_02 {

	public static void main(String[] args) {

		char one;
		char con = 'y';
		
		
		Scanner sc = new Scanner(System.in);
		
		
	

		//위의 작업에서 추가. Y값이면 반복
		do {
			System.out.println("> 한 문자 입력 ? a 엔터");
			one = sc.next().charAt(0);
			System.out.printf("one=\'%c\'\n", one);

			System.out.println("\n\n 계속할거냐? ");// 계속할건지 물어보는 작업 앞으로도 나오니 익숙해지기.
			con = sc.next().charAt(0); // 'y' 'n'
		} while (con == 'y' || con == 'Y');
		
		System.out.println("end");


	}//m

}//c
