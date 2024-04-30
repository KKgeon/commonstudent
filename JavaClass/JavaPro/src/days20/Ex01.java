package days20;

import java.util.Date;

public class Ex01 {
	public static void main(String[] args) {











		//[2]
		Date o = new Date(2023-1900, 12-1, 29, 9, 0, 0);
		System.out.println(o.getTime());

		Date t = new Date();
		System.out.println(t.getTime());

		long diff = t.getTime() - o.getTime();




		//??일 ??시간 ??분 ??초 ???밀리초 남았다(지낫따)
		//이거시험낸다

		System.out.println(diff + "ms");
		System.out.println(diff/1000 + "s");
		System.out.println(diff/(1000*60) + "m");
		System.out.println(diff/(1000*60*60) + "h");
		System.out.println(diff/(1000*60*60*24) + "d");



		/* [1]
		System.out.println(days10.Ex02.getTotalDays(2023, 12, 29));//738855

		System.out.println(days10.Ex02.getTotalDays(2024, 1, 26));//738886
		 * 
		 */

	}//m
	//내일시험답예시 메서드
	private static void d_day() {
		Date endDay = new Date(2024-1900, 6-1, 14, 18,0,0); 
		Date today = new Date();
		long diff =  endDay.getTime() - today.getTime(); 
		long 몫 = diff / (1000*60*60*24);
		System.out.print( 몫 +"d ");
		diff %= (1000*60*60*24); 

		몫 = diff /  (1000*60*60);
		System.out.print( 몫 +"h:");
		diff %= (1000*60*60); 

		몫 = diff /  (1000*60);
		System.out.print( 몫 +"m:");
		diff %= (1000*60); 

		몫 = diff /  (1000);
		System.out.print( 몫 +"s.");
		diff %= (1000); 

		System.out.println( diff +"ms");

		try {
			System.out.println("\n\n\n\n");
			Thread.sleep(10);
			d_day();

		} catch (InterruptedException e) { 
			e.printStackTrace();
		}
	}
}//c
