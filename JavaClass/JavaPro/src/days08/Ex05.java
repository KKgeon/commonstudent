package days08;

import java.util.Random;

/**
 * @author geon
 * @date 2024. 1. 10. - 오후 2:00:54
 * @subject
 * @content
 */
public class Ex05 {
	public static void main(String[] args) {
		//[로또 게임]
		//Lotto 6/45
		// 1~45 사이의 임의의 숫자를 6개 발생시키기
		//




		/*
		for (int i = 1; i <= 6; i++) {
			System.out.println((int) (Math.random()*45) + 1);		
		}	
		 */	


		//java.util.Random 클래스
		Random rnd = new Random();
		for (int i = 1; i <= 90000; i++) {
			int lottoNumber = rnd.nextInt(45)+1;
			if (lottoNumber<0 || lottoNumber>45) {
				System.out.println(lottoNumber);
			}//if
		}//for
		System.out.println("end");
	}//m

}//c
