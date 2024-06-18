package days06;

import java.util.Scanner;

public class Ex03 {

	public static void main(String[] args) {
//		3. 아래 실행결과와 같이 문자를 입력받아서  출력하는 코딩을 2번 하세요.
//
//	    [실행결과]
//		> 한 문자 입력 ? a 엔터
//		one='a' 
//		> 한 문자 입력 ? b 엔터
//		one='b'
		Scanner sc = new Scanner(System.in);

		System.out.println("> 한 문자 입력 ? a 엔터");
		char a = sc.next().charAt(0);
		System.out.printf("one=\'%c\'\n", a);
		System.out.println("> 한 문자 입력 ? b 엔터");
		char b = sc.next().charAt(0);
		System.out.printf("one=\'%c\'", b);
		
		

	}//m

}//c
