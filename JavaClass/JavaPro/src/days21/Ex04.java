package days21;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.ChronoField;
import java.time.temporal.ChronoUnit;

/**
 * @author geon
 * @date 2024. 1. 29. - 오전 11:09:45
 * @subject
 * @content
 */
public class Ex04 {
	public static void main(String[] args) {
		//String 불변


		/*
		String a = "xyz";
		String b = a.replace('y', '와');
		System.out.println(a);
		System.out.println(b);
		 */
		//j.t 핵심 클래스 또한 불변
		/*
		LocalDate ld = LocalDate.now();
		System.out.println(ld);	//2024-01-29

		// 날짜, 시간 수정 -with(), plus(), minus(), roll()
		ld = ld.withYear(2020);
		ld = ld.with(ChronoField.YEAR, 2000);

		ld = ld.withDayOfMonth(5);
		ld = ld.with(ChronoField.DAY_OF_MONTH, 5);
		System.out.println(ld);
		 */
		/*
		LocalDateTime dt = LocalDateTime.now();
		//2024-01-29T11:18:17.356335500
		System.out.println(dt);
		dt = dt.plusMonths(1);
		System.out.println(dt);

		dt= dt.minusMonths(3);
		System.out.println(dt);
		 */

		LocalTime t = LocalTime.now();
		System.out.println(t);//11:22:34.850286600
		// truncated = 끝부분을 잘라내다
		//t=t.truncatedTo(ChronoUnit.HOURS);	//11:00
		//t=t.truncatedTo(ChronoUnit.MINUTES);	//11:25
		System.out.println(t);
		
		LocalDateTime dt = LocalDateTime.now();	//2024-01-29T11:26:53.250652
		dt = dt.truncatedTo(ChronoUnit.DAYS);	//2024-01-29T00:00
		System.out.println(dt);



	}//m
}//c
