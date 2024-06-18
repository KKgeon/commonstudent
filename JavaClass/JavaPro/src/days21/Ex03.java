package days21;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Month;
import java.time.temporal.ChronoField;

public class Ex03 {
	public static void main(String[] args) {

		
		LocalDate ld = LocalDate.now();
		System.out.println(ld);		//2024-01-29
		
		//년
		int year = ld.get(ChronoField.YEAR);
		System.out.println(year);
		
		year = ld.getYear();
		System.out.println(year);
		//월
		
		int month = ld.get(ChronoField.MONTH_OF_YEAR);
		System.out.println(month);
		
		month = ld.getMonthValue();
		System.out.println(month);
		
		Month emonth = ld.getMonth();
		System.out.println(emonth);		//JANUARY
			
		//일
		
		int day = ld.get(ChronoField.DAY_OF_MONTH);
		System.out.println(day);
		
		day = ld.getDayOfMonth();
		System.out.println(day);
					
		
		LocalTime lt = LocalTime.now();
		//시간
		int hour = lt.get(ChronoField.HOUR_OF_DAY);
		System.out.println(hour);
		
		hour = lt.getHour();
		System.out.println(hour);
		
		//분
		
		int minute = lt.get(ChronoField.MINUTE_OF_HOUR);
		System.out.println(minute);
		
		minute = lt.getMinute();
		System.out.println(minute);
		//초
		
		int second = lt.get(ChronoField.SECOND_OF_MINUTE);
		System.out.println(second);
		
		second = lt.getSecond();
		System.out.println(second);
		//밀리초
		
		int ms = lt.get(ChronoField.MILLI_OF_SECOND);
		System.out.println(ms);
		int ns = lt.getNano();
		System.out.println(ns);
		//요일
		
		
		
		
		int mday = ld.get(ChronoField.DAY_OF_WEEK);
		System.out.println(mday);
		DayOfWeek dow = ld.getDayOfWeek();
		System.out.println(dow);
		System.out.println(dow.getValue());
		

	}//m
}//c
