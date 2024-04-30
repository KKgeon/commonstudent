package days21;

import java.util.ArrayList;
import java.util.Arrays;

public class Ex15 {
	public static void main(String[] args) {

		String my_str = "abc1Addfggg4556b"	;
		int n = 6;

		String [] answer = solution(my_str, n);

		System.out.println(Arrays.toString(answer));
	}//m


	public static String[] solution(String my_str, int n) {
		String[] answer = {};

		ArrayList list = new ArrayList();

		StringBuilder sb = new StringBuilder(my_str);
		try {
			while (true) {
				list.add(sb.substring(0,n)); sb.delete(0, n);
			}
		} catch (Exception e) {
			list.add(sb.substring(0));
		}






//		System.out.println(list);
		
		
		//ArrayList -> String [] 변환
//		list.forEach(name-> System.out.println(name));
		
		//[JAVA 8 Stream 사용한 예제]
		//answer = (String[])list.stream().toArray(String[]::new);

		answer = (String[]) list.toArray(new String[0]);
		
		return answer;
	}//solution
}//c
