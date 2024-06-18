package days21;

import java.time.LocalDate;

public class Ex05 {
	public static void main(String[] args) {
		// 날짜 시간 비교 isAfter(), isBefore(), isEqual()
		// 홍길동의 생일 1999.1.20
		// 올해 홍길동의 생일이 지났는지? 지나지않았는지? 오늘인지 체크하고싶을때


		LocalDate today = LocalDate.now();
		LocalDate birth = LocalDate.of(1999, 1, 20);
		System.out.println( today ); // 2024-01-29
		
		birth = birth.withYear( today.getYear() );
		System.out.println( birth ); // 1999-01-20
		
		System.out.println( today.isAfter(birth)  );  //  >
		System.out.println( today.isBefore(birth)  ); //  <
		System.out.println( today.isEqual(birth)  ); //  ==
		
		// 0 양수 음수
		System.out.println( today.compareTo(birth)  ); // 9(양수)
		
		
		
		
		
		/*  내가 한 예제풀이
		LocalDate hongBd = LocalDate.of(1999, 1, 20);
		LocalDate today = LocalDate.now();

		if (hongBd.isAfter(today)) {
			System.out.println("홍길동의 생일 안지남");
		} else if (hongBd.isBefore(today)) {
			System.out.println("홍길동의 생일 지남");
		}else if (hongBd.isEqual(today)) {
			System.out.println("오늘은 홍길동의 생일입니다");
		}
		*/
		
	}//m
}//c
