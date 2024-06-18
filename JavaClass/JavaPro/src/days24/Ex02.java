package days24;

import java.util.ArrayList;
import static java.util.Collections.*;

public class Ex02 {
	public static void main(String[] args) {


		//Arrays클래스 : 배열 사용하기 쉽도록 기능(메서드)이 구현된 클래스
		//[Collection 클래스]

		ArrayList<Integer> list = new ArrayList<>();

		addAll(list,  1,2,3,4,5);
		System.out.println(list);
		/*

		//rotate() 자리바꿈
		int distance = 2;
		rotate(list, distance);
		System.out.println(list);
		 */

		/*
		//swap() 자리바꿈
		swap(list, 0, 3);
		System.out.println(list);
		 */

		/*
		//shuffle() 임의의 자리변경
		shuffle(list);
		shuffle(list);
		shuffle(list);
		 */
		shuffle(list);
		System.out.println(list);

		//오름차순 정렬
		sort(list);
		System.out.println(list);
		
		sort(list, reverseOrder());
		System.out.println(list);
		
		fill(list, 100);
		System.out.println(list);
	}//m

}//c
