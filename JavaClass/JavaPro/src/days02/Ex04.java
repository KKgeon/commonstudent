package days02;

/**
 * @author geon
 * @date 2024. 1. 2. - 오전 11:22:39
 * @subject 자바에서 사용되는 자료형
 * @content - String(%s), double(%f), char(%c), int(%d), boolean(%b)
 */
public class Ex04 {

	public static void main(String[] args) {

		/*
		 * [자료형] == Data Type(데이터 형식)
		 * 1. Data(값) + Type (종류)
		 * 2. 자료형이라는 말의 의미는? 값이 저장될 공간의 크기와
		 * 						  저장되는 형식을 정의한 것
		 * 3. 자바형
		 * 		1)기본형(Primitive Type) - 8가지의 기본형이 있다.
		 * 			(1)숫자형
		 * 				ㄱ. 정수계열 - byte(1), shtor(2), [int(4)] 대표적임, long(8)
		 * 						문자 자료형 - char(2) 'A'
		 * 				1byte = 8bit
		 * 				1bit 	[0]	[1]
		 * 				2bit	00,01,10,11 	4가지 표현가능
		 * 				3bit	000~111		2^3 8가지 표현가능
		 * 				8bit				2^8 256가지 표현가능
		 * 
		 * 				byte  정수 표현범위 : -128~127
		 * 				short 정수 표현범위 : -32768 ~ 32767
		 * 									2^16 = 65536가지
		 * 				int   정수 표현범위 : -21억 ~ 21억
		 * 									2^32 = 4,294,967,296가지
		 * 				long  정수 표현범위 : -900경 ~ 900경
		 * 									2^64 = 1800경가지
		 * 
		 * 				ㄴ. 실수계열 - [double(8)], float(4) 
		 * 			(2)논리형(boolean 1) - 참(true), 거짓(false)
		 * 		2)참조형(Reference Type) - 배열(Array), 클래스, 인터페이스
		 */


		//성별을 나타내는 변수 선언하기 : 남자(true), 여자(false)
		boolean gender = true;
		System.out.printf("성별 : %b \n", gender);

		//사람의 나이를 저장할 변수 age 선언하세요

		//		int age; //int는 4바이트 사용하므로 나이를 선언하기에 너무 정수저장공간이 낭비된다
		byte age; //short의 경우는 1바이트로 127까지 저장 가능하기때문에 저장공간의 낭비가 적어진다.
		// 한 학생의 국어 점수를 저장할 변수 kor을 선언하세요
		byte kor;
		//		System.out.println(kor + 300);
		// 다른 언어 : byte 256가지 표현 -128~127 정수
		// 부호 X 					 0~255 정수


	}
}
