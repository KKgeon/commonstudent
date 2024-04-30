package days15;

import java.util.Date;

public class Ex04 {
	public static void main(String[] args) {
		//어제 했던 코딩을 생성자 사용해서 수정
		//생성자 사용 예제
		
		int year = 2024;
		int month = 1;
		int day = 19;
		
		Date d = new Date(year - 1900, month - 1, day );
		System.out.println(d.toString());
		System.out.println(d.toGMTString());
		System.out.println(d.toLocaleString());
		
		System.out.println(d.getDay());//5(금)0(일)~6(토)
				
	}//m
}//c
