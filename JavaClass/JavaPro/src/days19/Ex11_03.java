package days19;

import java.util.Date;

/**
 * @author geon
 * @date 2024. 1. 25. - 오후 5:28:32
 * @subject 내일시험2	10분안에 코딩 가능하도록 연습
 * @content
 */
public class Ex11_03 {
	public static void main(String[] args) {
		int year = 2024;
		int month = 1;
		int lastDay = getLastDay(year, month);
		int dayOfWeek = getDayOfWeek(year, month, 1);

		Date start = new Date(year -1900, month-1, 1);
		start.setDate(start.getDate()-dayOfWeek);
		//		System.out.println(start.toLocaleString());


		for (int i = 0; i <= 42; i++) {

			if (start.getMonth()==month-1) {
				System.out.printf("[%02d]\t", start.getDate());
			} else {
				System.out.printf("%02d\t", start.getDate());
			}
			start.setDate(start.getDate()+1);
			if (i%7==6) System.out.println();


		}//for
	}//m

	private static int getLastDay(int year, int month) {
		Date d = new Date(year -1900, month , 1 );
		int date = d.getDate() - 1;
		d.setDate(date); 
		return d.getDate();
	}

	private static int getDayOfWeek(int year, int month, int date) {
		Date d = new Date(year -1900, month - 1, date );  
		return d.getDay(); // 0(일)~6(토)
	}
}//c
