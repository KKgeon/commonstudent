package days19;

import java.util.Arrays;

public class Ex01_03 {
	public static void main(String[] args) {

		String [] names = {"구본혁", "권맑음", "김영진", "김진성"};

		System.out.println(Arrays.toString(names));

		//		Arrays.sort(names, Collections.reverseOrder());


		/*
		Arrays.sort(names, new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {

				return o2.compareTo(o1);
			}
		}
		);
		 */

		//위 주석 코딩하고 100% 동일한 코딩 => 람다식으로 표현
		Arrays.sort(names, (o1,o2) ->o2.compareTo(o1));
	}//m
}//c
