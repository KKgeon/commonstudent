package days20;

import java.util.Calendar;

public class Ex03 {
	public static void main(String[] args) {

		//Calendar c = new Calendar(); X
		Calendar c = Calendar.getInstance();
		//	ㄴ new GregorianCalendar();
		//System.out.println(c.toString());

		
		
		//2024년도의 며칠째?
		System.out.println(c.get(Calendar.DAY_OF_YEAR));//26
		//해당 주의 며칠째
		System.out.println(c.get(Calendar.DAY_OF_WEEK));//6
		//연중 몇주
		System.out.println(c.get(Calendar.WEEK_OF_YEAR));//4
		//월중 몇주
		System.out.println(c.get(Calendar.WEEK_OF_MONTH));//4
		
		
		
		//년
		System.out.println(c.get(1));//2024
		System.out.println(c.get(Calendar.YEAR));//2024
		//월
		System.out.println(c.get(2) + 1);// 1
		System.out.println(c.get(Calendar.MONTH)+1);
		//일
		System.out.println(c.get(5));// 26
		System.out.println(c.get(Calendar.DATE));//26
		System.out.println(c.get(Calendar.DAY_OF_MONTH));//26

		//시간
		System.out.println(c.get(10));//1
		System.out.println(c.get(Calendar.HOUR));//12(0-11)
		System.out.println(c.get(11));//1
		System.out.println(c.get(Calendar.HOUR_OF_DAY));//24
		//분
		System.out.println(c.get(12));
		System.out.println(c.get(Calendar.MINUTE));
		//초
		System.out.println(c.get(13));
		System.out.println(c.get(Calendar.SECOND));
		//밀리초
		System.out.println(c.get(14));
		System.out.println(c.get(Calendar.MILLISECOND));
		//요일
		System.out.println(c.get(7));
		System.out.println(c.get(Calendar.DAY_OF_WEEK));

		//자정부터 정오 직전까지의 시간을 나타내는 AM_PM필드의 값
		System.out.println(c.get(Calendar.AM));
		//시간이 정오 이전인지 이후인지를 나타내는 필드 값
		System.out.println(c.get(Calendar.AM_PM));
	}//m
}//c
