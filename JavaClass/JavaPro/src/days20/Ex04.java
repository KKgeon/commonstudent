package days20;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Pattern;

public class Ex04 {
	public static void main(String[] args) {

		//수료일이 무슨 요일?
		//		Date 수료일 = new Date(2024-1900, 6-1, 14, 18, 0, 0);
		Calendar c = Calendar.getInstance();
		//		c.get(0)
		//새로운 날짜로 설정하기	set(feild, value)
		c.set(Calendar.YEAR, 2024);
		c.set(Calendar.MONTH, 6-1);
		c.set(Calendar.DATE, 14);
		c.set(Calendar.HOUR_OF_DAY, 18);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);

		//[시험]	형식화
		//
	
		String pattern = "yyyy. MM. E dd a hh:mm:ss.SSS";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		//Calendar -> Date 변환
		//Date -> Calendar 변환
		Date d = c.getTime();
		String strDF = sdf.format(d);
		System.out.println(strDF);
	
/*
		String pattern = "yyyy. MM. E dd a hh:mm:ss.SSS";
		System.out.println(getFormatDate(c, pattern)); 
*/
	}//m

	public static String getFormatDate(Object o, String pattern) {

		SimpleDateFormat sdf = new SimpleDateFormat(pattern);

		if (o instanceof Date) {
			Date d = (Date)o;	
			return sdf.format(d);
		}else if (o instanceof Calendar) {
			Calendar c = (Calendar)o;
			Date d = c.getTime();
			return sdf.format(d);
		}


		return null;
	}
}//c
