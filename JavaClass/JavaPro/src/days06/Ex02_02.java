package days06;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Random;

public class Ex02_02 {

	public static void main(String[] args) {
		// 1. 배열 선언.
		// 2. 5~15 -5 사이의 무작위 숫자
		//	  0~10
		// 5 <= (int)(Math.random() *11) +5
		// 3. 배열의 각 요소를 출력하는 코딩
		//[람다식과 스트림]설명
		
		/*
		int [] m = new Random().ints(5, 16).limit(10).toArray();//Arrays 는 배열을 사용하기 쉽도록 만들어진 클래스
		
		System.out.println(Arrays.toString(m));
		*/

		
		int max = new Random().ints(5, 15).limit(10).max().getAsInt();
		
		System.out.println(max);
		
		
	}//m

}//c
