package days07;

import java.util.Scanner;

public class Ex04_03 {
	public static void main(String[] args) {
		String email;
		Scanner sc = new Scanner(System.in);
		System.out.print("이메일 입력 ? ");
		email = sc.next();
		//이메일의 형식은
		//1개 이상의 문자 	@naver.com
		//a				@sist.co.kr
		//1				@yahoo.kr
		
		
		String regex = "^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$";

		if (email.matches(regex)) {
			System.out.println("이메일 사용 가능");
		}//if
		else {
			System.out.println("이메일 사용 불가능");
		}//else
		
		//회원가입 할때 비밀번호 8~ 15자리
		//					%$#@ 특수문자 반드시 한개 이상
		//					0-9 숫자 반드시 1개 이상
		//					알파벳 대소문자 반드시 1개 이상
		//정규 표현식 검색해서 카톡으로 보내기.
	}//m
}//c
