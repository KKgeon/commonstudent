package days19;

import java.util.StringTokenizer;

public class Ex04 {
	public static void main(String[] args) {

		// StringTokenizer 클래스
		// String.split()
		String s = "구본혁, 권맑음, 김영진, 김진성";
		StringTokenizer st = new StringTokenizer(s, ",");

		/*
		System.out.println(st.countTokens());
		System.out.println(st.hasMoreTokens());
		System.out.println(st.nextToken());
		System.out.println(st.hasMoreTokens());
		System.out.println(st.nextToken());
		System.out.println(st.hasMoreTokens());
		System.out.println(st.nextToken());
		 */

		while (st.hasMoreTokens()) {
			String name = st.nextToken();
			System.out.println(name.stripLeading());
		}
	}//m
}//c
