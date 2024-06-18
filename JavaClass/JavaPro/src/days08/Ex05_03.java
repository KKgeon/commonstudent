package days08;

import java.util.Random;

public class Ex05_03 {
	public static void main(String[] args) {
		int [] lotto = new int [6];

		fillLotto(lotto); // Call By Reference

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

		CON:while (index<=5) {
			lottoNumber = rnd.nextInt(45)+1;
			System.out.println(lottoNumber);
			for (int i = 1; i < index; i++) {
				if (lottoNumber == lotto[i]) {
					continue CON; // 안됐던 이유 : while문으로 컨티뉴돼야하는데 감싸고 있는 반복문이 for문이라 for만 반복돼서 제대로 작동하지않음.
				}//if

			}//for
			lotto[index++] = lottoNumber;
			//index++;


		}//while


		//몇번만에 채울지 알 수 없을때는 for문보다는 while문이 낫다.
	}//m

}//c



