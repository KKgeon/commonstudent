package days21;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Period;

public class Ex09 {
	public static void main(String[] args) {
		//날짜-날짜 = Period
		//시간-시간 = Duration
		//문제) 수료일 - 오늘날짜 = 날짜간격
		
		/*
		LocalDate e = LocalDate.of(2024, 6, 14);
		LocalDate t = LocalDate.now();
		
		Period p = Period.between(t, e);
		
		//4개월 16일+1
		System.out.println(p.getYears());//0년
		System.out.println(p.getMonths());//4개월
		System.out.println(p.getDays());//16일
		*/
		
		LocalTime e = LocalTime.of(18, 0, 0);
		System.out.println(e);
		LocalTime t = LocalTime.now();
		
		Duration d = Duration.between(t, e);
		System.out.println(d.getSeconds());
		System.out.println(d.getSeconds()/60);
		System.out.println(d.getSeconds()/60/60);
		
	}//m
}//c
