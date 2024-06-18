package days09;

import com.util.MyCalendar;

public class Ex04 {
	public static void main(String[] args) {

		String result = "평년";
		for (int i = 2010; i <= 2030; i++) {
			result = "평년";
			if (MyCalendar.isLeapYear(i)) result = "윤년";
			System.out.printf("%d년 %s\n", i, result);
			
		}
	}
}
