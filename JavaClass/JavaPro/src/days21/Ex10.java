package days21;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Ex10 {
	public static void main(String[] args) {
		//DateTimeFormatter 형식화 클래스
		// [2]날짜문자열 -> 파싱 -> 핵심클래스 변환
		String source = "2023년 08월 10일 (목)";
		
		String pattern = "yyyy년 MM월 dd일 (E)";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
		LocalDate d = LocalDate.parse(source, formatter);
		
		System.out.println(d); //2023-08-10
		
		
		/*  [1]
		//			<-포맷 <-
		LocalDateTime dt = LocalDateTime.now();
		
		System.out.println(dt);//2024-01-29T14:03:21.942806700
		
		//
		String pattern = "yyyy/MM/dd E hh:mm:ss.SSS";
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(pattern);
		
		String output =  dtf.format(dt);
		System.out.println(output); //2024/01/29 월 02:05:39.420
		*/
		
		
	}//m
}//c
