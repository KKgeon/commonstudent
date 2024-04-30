package days22;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;

public class Ex01 {
	public static void main(String[] args) {
		// [2]
		/*
		// 2024/01/30 화요일   10:09:27.62
		LocalDateTime dt = LocalDateTime.now();
		// 2024-01-30T10:07:03.322143600
		System.out.println(dt);

		String pattern = "yyyy/MM/dd E요일   hh:mm:ss.SSS";
		// 형식화 클래스 
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
	    String result = formatter.format(dt);
	    System.out.println( result );
		 */

		// [2-2]
		/*
		String s = "2023.08.11 (금)";

		String pattern = "yyyy.MM.dd (E)"; 
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
	    LocalDate d = LocalDate.parse(s, formatter);
	    System.out.println( d ); // 2023-08-11
		 */

		// [3-2]
		/*
		ArrayList team1  = new ArrayList();
		team1.add("홍길동");
		team1.add("김길동");
		team1.add(1, "박길동");
		System.out.println( team1 );  // [홍길동, 박길동, 김길동]

		Iterator ir = team1.iterator();
		while (ir.hasNext()) {
			String name = (String) ir.next();
			System.out.println( name );
		}		
		System.out.println( team1.size() );		
		// team1.get(1);  team1.set(1, "다름이름");

		int index = team1.indexOf("홍길동");
		team1.remove(index);
		team1.removeIf( n -> ((String)n).charAt(0) =='이' );
		 */

		// [4]
		//   1) 설문 시작일 : 23.8.10   9:00:00
		//   2) 설문 종료일 : 23.8.15  18:00:00
		/*
		LocalDateTime s = LocalDateTime.of(2023, 8,10, 9,0,0);
		LocalDateTime e = LocalDateTime.of(2023, 8,15, 18,0,0);
		LocalDateTime now = LocalDateTime.now();

		System.out.println( now.isBefore(e) );
		System.out.println( now.isAfter(s) );

		if( now.isBefore(s) || now.isAfter(e) )  // 설문 불가능
		else   // 설문 가능
		 */

	}//m
}//c
