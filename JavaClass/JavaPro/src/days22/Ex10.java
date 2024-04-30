package days22;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;
import java.util.Scanner;

public class Ex10 {
	public static void main(String[] args) {
		// 로또 게임 횟수를 입력받아서
		// 로또 번호를 출력하는 코딩...

		/*
	HashSet  lotto = new HashSet();
      lotto.add(10);
      lotto.add(10);
      lotto.add(10);
      lotto.add(10);
      lotto.add(15);
      lotto.add(45);
      lotto.add(45);
      lotto.add(20);
      lotto.add(8);
      lotto.add(45);
      lotto.add(32);

      System.out.println(lotto);
		 */

		int gameNumber = 1;
		Scanner sc = new Scanner(System.in);
		System.out.print("> 게임 횟수 입력? ");
		gameNumber = sc.nextInt();	//3


		ArrayList lottos = new ArrayList();

		HashSet lotto = null;

		for (int i = 0; i < gameNumber; i++) {
			lotto = new HashSet();
			fillLotto(lotto);
			lottos.add(lotto);
		}//for
		System.out.println("========");
		dispLottos(lottos);


	}//m

	private static void dispLottos(ArrayList lottos) {
		Iterator ir = lottos.iterator();
		int cnt = 1;
		while (ir.hasNext()) {
			HashSet lotto = (HashSet) ir.next();
			System.out.printf("%d 게임 : ", cnt++);
			
			Iterator ir2 = lotto.iterator();
			while (ir2.hasNext()) {
				int n = (int) ir2.next();
				System.out.printf("[%d]", n);

			}//while2
			System.out.println();
	
		}//while1
		System.out.println();
	}//dispLotto

	private static void fillLotto(HashSet lotto) {
		Random rnd = new Random();
		while (lotto.size()<6) {
			int n = rnd.nextInt(45)+1;
			//System.out.println(n);
			lotto.add(n);

		}//while


	}//fillLotto

}//c
