package days10;

import java.util.Calendar;
import java.util.Scanner;

public class Ex02 {
	public static void main(String[] args) {
		//달력 그리기
		int year, month; //출력할 달력의 연도와 월
		try {
			Scanner sc = new Scanner(System.in);
			System.out.println(">연도와 월 입력 ?");
			year = sc.nextInt();
			month = sc.nextInt();

			//달력그리기작업

			printCalendar(year, month);
		} catch (Exception e) {
			e.printStackTrace(); //예외정보확인
		}

	}//m

	//2020.5
	//총날짜수 %7 +> 0(일) 1(월) 2(화) 3(수) ~ 7(토)

	private static void printCalendar(int year, int month) {
		//1일이 무슨요일인지? 그 달의 마지막날은 며칠인지?

		//1. year , month 무슨요일?
		//		Date d = new Date(2020, 5, 1);
		//		System.out.println(d.toLocaleString());
		//		
		//2. year , month 마지막날짜?

		int dayOfWeek = getDay(year,month,1);
		//2. year , month 마지막날짜?
		int lastDay = getLastDay(year, month);

		System.out.printf("\t\t\t[%d년 %d월]\n", year, month);
		System.out.println("-".repeat(60));
		String week = "일월화수목금토";
		for (int i = 0; i < week.length(); i++) {
			System.out.printf("\t%c", week.charAt(i));
		}//for
		System.out.println();
		System.out.println("-".repeat(60));
		//1의 위치를 잡기 위해서 앞에 \t를 위치시키는 for문
		for (int i = 0; i < dayOfWeek; i++) {
			System.out.print("\t");
		}//for
		//		System.out.printf("\t%d",1);
		for (int i = 1; i <= lastDay; i++) {
			System.out.printf("\t%d",i);
			if ((i+dayOfWeek)%7==0) System.out.println();
		}
		System.out.println();
		System.out.println("-".repeat(60));

	}//print
	private static int getLastDay(int year, int month) {
		int lastDay = 0;
		Calendar c = Calendar.getInstance();
		c.set(year, month-1, 1);
		lastDay = c.getActualMaximum(Calendar.DAY_OF_MONTH);
		return lastDay;
	}
	/*
	private static int getLastDay(int year, int month) {
		int lastDay = 0;
		//				0	1
		//				1월	2월
		int [] months = {31,28,31,30,31,30,31,31,30,31,30,31};
		lastDay = months[month-1];
		if (MyCalendar.isLeapYear(year) && month == 2) lastDay = 29;
		return lastDay;
	}
	 */
	/*
	private static int getLastDay(int year, int month) {
		int lastDay = 0;
		switch (month) {
		case 1: case 3: case 5: case 7: case 8: case 10: case 12:
			lastDay = 31;
			break;
		case 2:
								//ctrl + 클릭 하면 해당 메서드 생성된곳으로 이동 가능.
			lastDay = MyCalendar.isLeapYear(year) ? 29: 28;
			break;
		case 4: case 6: case 9: case 11:
			lastDay = 30;
			break;
		}
		return lastDay;
	}//getLastDay


	 */
	private static int getDay(int year, int month, int day) {

		//1.1.1~year.month.1 까지의 총 날짜수 %7
		//0~6
		int totalDays = getTotalDays(year, month, day);
		int dayOfWeek = totalDays % 7;

		return dayOfWeek;
	}

	public static int getTotalDays(int year, int month, int day) {
		// year 2020, month 5, day 1
		// 365 * 2019(year-1) + 20.1(31)+2(29)+3(31)+4(30)+1
		int totalDays = 0;

		//1. year - 1 == 2019 이전년도까지의 총날짜수
		/*
		for (int i = 1; i < year; i++) {
			totalDays += MyCalendar.isLeapYear(i) ? 366: 365;			
		}
		 */
		totalDays = (year-1)*365+(year-1)/4-(year-1)/100+(year-1)/400;

		// 1 2 3 4
		for (int i = 1; i < month; i++) {
			totalDays += getLastDay(year, i); 
		}

		//
		totalDays++; 
		return totalDays;



		/*
		int [] daysOfmonth = {31,28,31,30,31
		int gtd = (365 * year) + (int)((year-1)/4) + ; //내가했던거 미완
		 */


	}
}//c
