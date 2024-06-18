package days19;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collections;
import java.util.stream.Stream;

public class Ex01_02 {
	public static void main(String[] args) {

		int [] m = {3,5,2,4,1};
		
		System.out.println(Arrays.toString(m));

		/*
		int [] temp = new int[m.length];
		for (int i = 0; i < temp.length; i++) {
			temp[m.length-1-i]= m[i];
		}
		
		Arrays.sort(m, Collections.reverseOrder());
		
		 */
		/*
		 * int[] ->Integer[]변환
		 * IntStream -> Stream<Integer> -> Integer[]
		 * boxing, unboxing
		 */
		
		Integer [] temp =  Arrays.stream(m).boxed().toArray(Integer[]::new);
		Arrays.sort(temp, Collections.reverseOrder());
		
		//IntStream <- Stream<Integer> <- Integer[]
		Stream.of(temp).mapToInt(Integer::intValue).toArray();
		
		System.out.println(Arrays.toString(m));

	}//m
}//c
