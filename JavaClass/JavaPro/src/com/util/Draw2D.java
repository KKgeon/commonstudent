package com.util;
//2D 그리기 작업할 수 있는 모든 기능들을 구현한 클래스
public class Draw2D {
	public static void drawLine(){

		System.out.println("=============");
	}//메서드1
	public static void drawLine(int n){

		System.out.println("-".repeat(n));
	}//메서드2
	public static void drawLine(int n, String style){
		System.out.println(style.repeat(n));
	}//메서드3

}
