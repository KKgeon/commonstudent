package days11;

import java.time.DayOfWeek;
import java.time.LocalDate;

public class Ex01 {
	public static void main(String[] args) {
		int year=2020, month=5;


		creatCalendar(year, month);

	}

	private static void creatCalendar(int year, int month) {	
		getLastDay(year, month, 1);
		getDayOfWeek(year, month);

	}

	private static int getDayOfWeek(int year, int month) {
		//Daycalendar 클래스 - 날짜, 시간
		LocalDate d = LocalDate.of(year, month, 1);
		//System.out.println(d.toString());//2020-05-01
		LocalDate ld = d.withDayOfMonth(d.lengthOfMonth());
		//System.out.println(ld.toString());
		int lastDay = ld.getDayOfMonth();
		return lastDay;
	}

	private static int getLastDay(int year, int month, int i) {
		LocalDate d = LocalDate.of(year, month, 1);
		DayOfWeek w = d.getDayOfWeek();
		return w.getValue();

	}
	
	
	
}
