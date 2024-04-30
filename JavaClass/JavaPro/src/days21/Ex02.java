package days21;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class Ex02 {
	public static void main(String[] args) {

		
		//[j.t 핵심 클래스]
		LocalDate ld = LocalDate.now();				//날짜만 다루는 클래스 (시간X)
		System.out.println(ld.toString());	 //2024-01-29
		
		LocalTime lt = LocalTime.now();				//시간만 다루는 클래스
		System.out.println(lt); 			//10:26:26.450446500
		
		LocalDateTime ldt = LocalDateTime.now();	//날짜와 시간을 모두 다루는 클래스
		System.out.println(ldt); 			//2024-01-29T10:27:40.642041900
		
		
		//of() 메서드
		ld = LocalDate.of(2023, 12, 29);
		System.out.println(ld);				//2023-12-29
		
		lt = LocalTime.of(3, 20, 11);
		System.out.println(lt);				//03:20:11
		
		ldt = LocalDateTime.of(ld, lt);
		System.out.println(ldt); 			//2023-12-29T03:20:11


				
	}//m
}//c
