package days07;

import java.util.stream.IntStream;

/**
 * @author geon
 * @date 2024. 1. 9. - 오후 5:06:27
 * @subject
 * @content
 */
public class Ex10_02 {

	public static void main(String[] args) {
		
		int [] arr = {1,2};
		System.out.println(sum(arr));
		
		int [] arr2 = {1,2,3,4,5,6};
		System.out.println(sum(arr2));

	}//m


	public static int sum( int [] m) {
		
		int result = 0;
		for (int i = 0; i < m.length; i++) {
			result += m[i];

		}
		return result;
		
		
		// [람다와 스트림]
		//return IntStream.of(m).sum();
	}//메서드
	
	
}//c
