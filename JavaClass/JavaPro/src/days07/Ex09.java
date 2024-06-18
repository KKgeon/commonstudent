package days07;

import java.lang.annotation.Repeatable;

/**
 * @author geon
 * @date 2024. 1. 9. - 오후 4:06:20
 * @subject 메서드(함수) 설명.
 * @content
 */
public class Ex09 {
	public static void main(String[] args) {
		/*
		 *  1. 정의 : 프로그래밍에서 "반복되는 명령어들"을 
		 *  찾아서 별도로 묶어서 필요할때마다 재사용하도록 만든것
		 *  
		 *  2. 프로그램의 구조화 -> 유지, 보수 관리 용이
		 *  3. 함수가 기본이 되는 프로그래밍 방식 - 구조적 프로그래밍
		 *     객체가 기본이 되는 프로그래밍 방식 - 객체 지향적 프로그래밍
		 *  4. 	//함수(메서드)선언
				//[접근지정자] [기타제어자] 리턴자료형 함수명([매개변수]) 함수 원형 == 함수의 프로토타입(prototype)
		 *		 	//함수의 몸체
		 *
		 *			[return 리턴값;]
		 *				return; 	생략되는경우가 있다.
		 * 

		 */

		//함수 호출 부분
		drawLine();
		System.out.println("부서명 : 사원명");
		drawLine(30);
		System.out.println("영업부 : 강명건");
		System.out.println("생산부 : 구본혁");
		System.out.println("총무부 : 권맑은");
		System.out.println("자재부 : 김영진");
		drawLine(20, "^");

		//com.util.Draw2D.java
	}//m

	//중복함수 = 함수가 중복선언되었다 == overloading[오버로딩]
	//함수 선언 3가지 : 기능, 매개변수, 리턴값(리턴자료형)
	//[함수선언부분]
	public static void drawLine(){
		// 선 긋기 (100줄)
		System.out.println("=============");
	}//메서드
	//[함수선언부분]
	//Duplicate method drawLine() in type Ex09
	//매개변수의 타입, 갯수 다르면 똑같은 함수명으로 선언할수있다.
	public static void drawLine(int n){
		// 선 긋기 (100줄)
		System.out.println("-".repeat(n));
	}//메서드2
	public static void drawLine(int n, String style){
		// 선 긋기 (100줄)
		System.out.println(style.repeat(n));
	}//메서드3

	
	/* 중복함수 선언시 리턴 자료형X
	public static int drawLine(int n){
		// 선 긋기 (100줄)
		System.out.println("-".repeat(n));
		return 1;
	}//메서드3
	 */


}//c
