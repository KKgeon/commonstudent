package days06;


public class Ex02 {

	public static void main(String[] args) {

		// 1. 배열 선언.
		int [] m = new int [10];

		// 2. 5~15 -5 사이의 무작위 숫자
		//	  0~10
		// 5 <= (int)(Math.random() *11) +5
		//3 ) 배열의 각 요소를 출력하는 코딩

		for (int i = 0; i < m.length; i++) {
			m[i] = (int)(Math.random() *11) + 5;
			System.out.printf("m[%d]=%d\n", i, m[i]);

			//			int max = Math.max(m[i], i);
			//			System.out.println(max);
			//			int min = Math.min(m[i], i);		
			//			System.out.println(min);

			

		}//for

		int min = m[0];
		for (int i = 1; i < m.length; i++) {
			min = Math.min(min, m[i]);

		}

		System.out.printf("min : %d", min);
		//[추가문제] m이라는 배열과 가장 큰값, 가장 작은값을 구해서 출력


	}//m

}//c
