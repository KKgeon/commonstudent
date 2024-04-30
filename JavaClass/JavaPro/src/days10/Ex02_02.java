package days10;

import java.util.Calendar;

public class Ex02_02 {
	public static void main(String[] args) {
		//마지막날짜?
		int lastDay = 0;
		Calendar c = Calendar.getInstance();
		c.set(2020, 5-1, 1);
		lastDay = c.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		System.out.println(lastDay);
	}//m
}//c
