package days09;

import java.util.Random;

/**
 * @author geon
 * @date 2024. 1. 11. - 오전 10:28:24
 * @subject days8 ex05_04예제
 * @content 이건 내가 한거 복붙.
 */
public class Ex02_02 {	
	public static void main(String[] args) {
		//로또 게임 횟수 입력 (n) ; 3
		int n = 3;
		
		int [] lotto = new int [n*6]; //18

		fillLotto(lotto);

		dispLotto(lotto);

	}//m

	private static void dispLotto(int[] lotto) {
		for (int i = 0; i < lotto.length; i++) {
			System.out.printf("lotto[%d]=[%d]\n", i , lotto[i]);
		}

	}

	private static void fillLotto(int[] lotto) {
		//1.
		Random rnd = new Random();
		//2. lotto[0]
		int lottoNumber = rnd.nextInt(45)+1;
		lotto[0] = lottoNumber;
		System.out.println(lottoNumber);
		//3
		int index = 1;//이거부터 이해 안됨.. 왜 이게 작동함? 그냥 1줬을뿐인데

		while (index<=lotto.length-1) {
			lottoNumber = rnd.nextInt(45)+1;
			System.out.println(lottoNumber);

			if(!isDuplicateLotto(lotto, lottoNumber, index))
				lotto[index++] = lottoNumber;
			//index++;


		}//while



	}//m

	private static boolean isDuplicateLotto(int[] lotto, int lottoNumber, int index) {
		for (int i = 0; i < index; i++) {
			if (lottoNumber == lotto[i]) {
				return true;

			}//if

		}//for
		return false;
	}

}
