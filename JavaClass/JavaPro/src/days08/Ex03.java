package days08;

import java.util.Scanner;

import com.util.MyCalendar;

public class Ex03 {
	public static void main(String[] args) {
		//연도를 입력받아서 윤년/평년 체크해서 출력하는 코딩
		
		int year;
		year = getYear();

		//율리우스력	1년 = 365.25
		//태양년		1년 = 365.24219878
		//공전 		1년 = 365.2422 
		//그레고리력	1년 = 365.2425
		
		//[3]
		if ( MyCalendar.isLeapYear(year)  ) {
			System.out.println("윤년(leap year)");
		} else {
			System.out.println("평년(common year)");
		}

		
		//[2]
		/*
		String result = MyCalendar.isLeapYear(year);//[2]-1
		if ( result.equals("윤년") ) { //[2]-1
		
		//if (MyCalendar.isLeapYear(year).equals("윤년")) { //[2]-2
			System.out.println("윤년(leap year)");
		} else {

			System.out.println("평년(common year)");
		}
		
		*/
		
		/* [1]
	       if ( year % 4 == 0 && year % 100 != 0 || year%400 == 0) {
	         System.out.println("윤년(leap year)");
	      } else {
	         System.out.println("평년(common year)");
	      }
		 */
	}//m

	public static int getYear() {
		int year;
		System.out.println("> 연도를 입력하세요");
		Scanner sc = new Scanner(System.in);
		//연도 유효성검사
		//String regex = "\\d*[1-9]";
		year = sc.nextInt();
		return year;//여기에 0값넣어서 작동안했었음.
	}
}//c
