package days20;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * @author geon
 * @date 2024. 1. 26. - 오후 12:20:15
 * @subject
 * @content
 */

public class Ex05 {

	public static void main(String[] args) {
		int year = 2024;
		int month = 1;

		// int lastDay   = getLastDay(year,  month);
		int dayOfWeek = getDayOfWeek(year, month, 1);

		Calendar start = new GregorianCalendar(year, month-1, 1);
		start.add(Calendar.DATE, -dayOfWeek);

		//System.out.println( Ex04.getFormatDate(start, "yyyy-MM-dd") );

		Calendar today = Calendar.getInstance();


		today.set(Calendar.HOUR_OF_DAY, 0);
		today.set(Calendar.MINUTE, 0);
		today.set(Calendar.SECOND, 0);
		today.set(Calendar.MILLISECOND, 0);


		for (int i = 0; i < 42; i++) {
			// System.out.println( Ex04.getFormatDate(start, "yyyy-MM-dd") );

			if ( start.get(Calendar.MONTH)+1  == month) {
				if( today.equals(start)) {
					System.out.print("*");
				}
				System.out.printf("[%02d]\t", start.get(Calendar.DATE));
			} else {
				System.out.printf("%02d\t", start.get(Calendar.DATE));
			}

			start.add(Calendar.DATE, 1);
			if( i %  7 == 6 ) System.out.println();
		}   



	}//m

	private static int getLastDay(int year, int month) {
		Calendar c = new GregorianCalendar(year, month-1, 1);

		return c.getActualMaximum(Calendar.DATE);


	}

	private static int getDayOfWeek(int year, int month, int date) {

		Calendar c = new GregorianCalendar(year, month-1, date);
		return c.get(Calendar.DAY_OF_WEEK)-1;//1(일)~7(토)

	}
}//c
