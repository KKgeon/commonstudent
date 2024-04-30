package days04;

import java.util.Scanner;

/**
 * @author geon
 * @date 2024. 1. 4. - 오전 10:24:37
 * @subject		문자열끼리 같은지 비교하기
 * @content		== X
 * 				이름 입력받아서 비교예제
 */
public class Ex01 {

	public static void main(String[] args) {
		
		/*
		
		//숫자끼리 같냐고 물어볼땐? 	==
		//문자도					==
		//boolean형 				==
		// (암기)그렇다면 문자열은?	
		String name1 = "홍길동";
		Scanner scanner = new Scanner(System.in);
		System.out.print("> 이름 입력?");
		//Duplicate local variable name
		String name2 = scanner.next(); // nextByte; nextBoolean; nextXXX;~~~
		
		//
		//System.out.println( name1 == name2 ); //false
		
		// 문자열 비교 : String.equals(); 메서드 사용 [암기] 아마도 내일 시험에나옴
		System.out.println( name1.equals(name2));
		
		*/
		
		/*
		String msg1 = "kenik", msg2 = "KenIk";//대문자 차이
		System.out.println(msg1.equals(msg2));//false
		// 대소문자를 구분하지 않고 문자열 같냐?
		System.out.println(msg1.equalsIgnoreCase(msg2));//true .equalsIgnoreCase 메서드는 대소문자까지 파악
		*/
		
		/*
		String name1 = "홍길동";
		String name2 = "홍길동";
		System.out.println(name1==name2);
		*/
	}

}
