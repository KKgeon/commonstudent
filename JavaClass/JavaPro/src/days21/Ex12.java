package days21;

import java.util.Arrays;

public class Ex12 {
	public static void main(String[] args) {

		/*
		 * 1. ArrayList 컬렉션 클래스
		 * 	1) Collection 
		 * 		ㄴ List 인터페이스를 구현한 컬렉션 클래스이다.
		 *  2) 	List 인터페이스의 특징 : 순서유지 O 중복허용 X
		 *  3) Array(배열) + List(목록)
		 *  	배열의 단점이 보완
		 *  	요소(Element)
		 */
		String [] names = new String[3];
		names[0] = "주강민";
		names[1] = "정하영";
		names[2] = "임경재";
		System.out.println(names.length);
		for (int i = 0; i < names.length; i++) {
			if (names[i].equals("정하영")) {
				System.out.println(names[i]);
				
			}
			
		}
		
		Arrays.fill(names, null);
		System.out.println(Arrays.toString(names));
	}//m
}//c
