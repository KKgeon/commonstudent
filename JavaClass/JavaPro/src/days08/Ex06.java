package days08;

import java.util.Random;

public class Ex06 {
	public static void main(String[] args) {
		//신용카드
		String card = "7655-8988-9234-5677";
		
		
		
		
		//카드결제 영수증
		String regex = "-";
		String cardArr [] = card.split(regex);
		/*
		for (String c : cardarr) {
			System.out.println(c);
			
		}//foreach
		*/
		
		/*
		for (int i = 0; i < cardarr.length; i++) {
			System.out.printf("cardarr[%d]=%s\n", i, cardarr[i]);
		}//for
		*/
		Random rnd = new Random();
		int index = rnd.nextInt(4);
		cardArr[index] = "****";
		/*
		String printCard = String.format("%s-%s-%s-%s", cardArr[0], cardArr[1], cardArr[2], cardArr[3]);
		*/
		//String.join() // 2~n번째 문자열 사이사이에 첫번째 문자열을 집어넣어주는 메서드? 잘모름 제대로 안들음
		String printCard = String.join("-", cardArr);
		
		System.out.println(printCard);
		
		
	}//m
}//c
