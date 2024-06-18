package days23;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;

public class Ex01 {
	public static void main(String[] args) {

		int n = 5;
		//Syntax error, insert "Dimensions" to complete ReferenceType
		LinkedHashSet<Integer> lotto = null;
		ArrayList<LinkedHashSet<Integer>> lottos = new ArrayList<>(n);

		//입력
		int ln = 0;
		for (int i = 0; i < n; i++) {
			lotto = new LinkedHashSet<Integer>(6);
			while (lotto.size()<6) {
				ln = (int)(Math.random()*45+1);
				lotto.add(ln);
			}//while	
			lottos.add(lotto);
			
		}//for

		
		LinkedList<Integer> list = null;
		//출력
		int cnt = 1;
		Iterator<LinkedHashSet<Integer>> ir = lottos.iterator();
		while (ir.hasNext()) {
			lotto = ir.next();//LinkedHashSet
			list = new LinkedList<Integer>(lotto);
			Collections.sort(list);
			System.out.printf("%d 게임 : ", cnt++);
			Iterator<Integer> ir2 = list
					.iterator();
			while (ir2.hasNext()) {
				ln = ir2.next();
				System.out.printf("[%02d]",ln);
			}//while2
			System.out.println();
		}//while1			

	}//m
}//c
