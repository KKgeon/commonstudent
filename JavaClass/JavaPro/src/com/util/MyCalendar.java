package com.util;

public class MyCalendar {

	//평년 false 반환
	//윤년 true 반환
	

	
	public static boolean isLeapYear(int year) {
		boolean result = false;
		if (year % 4 == 0 && year % 100 != 0 || year % 400 ==0) {
			result = true;
		}
		return result;
	}//m

	
	/*
	public static String isLeapYear(int year) {
		String result = "평년";
		
		if ( year % 4 == 0 && year % 100 != 0 || year%400 == 0) {
			return "윤년";
		
		}
		return result;

	}//m
	*/
	
}//c
