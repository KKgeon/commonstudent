package days11;

import java.util.Arrays;
import java.util.Random;

public class Ex04 {
	public static void main(String[] args) {
	
		int [] m = new int [10];
		for (int i = 0; i < m.length; i++) {
			m[i] = i+1;
		}
		System.out.println(Arrays.toString(m));
		//배열섞기
		//1. 랜덤하게위치찾기
		//2. 위치바꾸기
		//3. 그것을 반복 (가급적이면 제한을 수만큼 둘수있는 for문)
		suffle(m);
		
		
		
		/*
		int foundIndex = indexOf(m,Math.random());
		System.out.println(Arrays.toString(foundIndex));
		*/
		
		
		
		System.out.println(Arrays.toString(m));
	}//m

	private static void suffle(int[] m) {
		int idx1 = 0, idx2;
		
		for (int i = 0; i < 10; i++) {
			idx2 = (int)(Math.random()*9)+1;
			

			int temp = m[idx1];
			m[idx1] = m[idx2];
			m[idx2] = temp;
			
		}
		
/*		for (int i = 0; i < 10; i++) {
			idx1 = (int)(Math.random()*m.length);
			idx2 = (int)(Math.random()*m.length);

			int temp = m[idx1];
			m[idx1] = m[idx2];
			m[idx2] = temp;
			
		}
		*/
		
	}
	

}//c
