package days20;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Ex05_02 {

	public static void main(String[] args) {

		Calendar today = Calendar.getInstance();
		//String t = Ex04.getFormatDate(today, "yyyy-MM-dd HH:mm:ss.SSS");      
		//t = t.substring(0, 10); // yyyy-MM-dd

		Calendar start = new GregorianCalendar(2024, 1-1, 26);
		//String s = Ex04.getFormatDate(start, "yyyy-MM-dd HH:mm:ss.SSS");
		//s = s.substring(0, 10);

		//System.out.println( t.equals(s));

		today.set(Calendar.HOUR_OF_DAY, 0);
		today.set(Calendar.MINUTE, 0);
		today.set(Calendar.SECOND, 0);
		today.set(Calendar.MILLISECOND, 0);

		System.out.println( Ex04.getFormatDate(today, "yyyy-MM-dd HH:mm:ss.SSS") );
		System.out.println( Ex04.getFormatDate(start, "yyyy-MM-dd HH:mm:ss.SSS") );

		System.out.println( today.compareTo(start)   );
		System.out.println( today.equals(start)   );



		/*
      for (int i = 1; i <=12; i++) {
         Calendar c = new GregorianCalendar(2024, i-1, 1); 
         System.out.println( c.getActualMaximum(Calendar.DATE));
      }
		 */

		/*
      Calendar c = new GregorianCalendar(2024, 1-1, 1); 
      System.out.println( Ex04.getFormatDate(c, "yyyy MM dd") );
      System.out.println( c.getActualMaximum(Calendar.DATE) );
		 */
		/*
      c.add(Calendar.MONTH, 1);
      c.add(Calendar.DATE, -1);
      System.out.println( Ex04.getFormatDate(c, "yyyy MM dd") );
		 */
		/*
      c.add(Calendar.DATE, 1);
      System.out.println( Ex04.getFormatDate(c, "yyyy MM dd") );
      c.add(Calendar.DATE, -1);
      System.out.println( Ex04.getFormatDate(c, "yyyy MM dd") );
      c.add(Calendar.MONTH, 1);
      System.out.println( Ex04.getFormatDate(c, "yyyy MM dd") );
		 */

	}

}


/*

 */