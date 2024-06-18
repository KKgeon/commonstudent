package days20;

import java.text.MessageFormat;

/**
 * @author geon
 * @date 2024. 1. 26. - 오후 4:12:11
 * @subject
 * @content
 */
public class Ex09 {

	public static void main(String[] args) {

		// DF, SDF, CF, MF 4가지
		//[MessageFormat] 형식화 클래스
		// 데이터(값)	-> 특정 출력형식으로 출력
		// 특정형식	-> 데이터(값) 읽기

		String name = "권맑음";
		int age = 26;
		boolean gender = true;
		double height = 178.67;
		char grade = 'A';

		// 이름 : 권맑음, 나이 : 26살, 성별 : 남자, 키:178.67, 등급 : A 입니다.
		//[2]
		String pattern = "이름 : {0}, 나이 : {1}, 성별 : {2}, 키 : {3}, 등급 : {4} 입니다.";
		String output = MessageFormat.format( pattern,name, age, gender?"남자":"여자",height,grade);
		System.out.println(output);
		// [1]
		/*
		String output = String.format( "이름 : %s, 나이 : %d, 성별 : %s, 키 : %.2f, 등급 : %c 입니다.", name, age, gender?"남자":"여자",height,grade);

		System.out.println(output);
		 */
	}//m
}//c
