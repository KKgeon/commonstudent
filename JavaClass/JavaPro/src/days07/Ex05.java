package days07;

public class Ex05 {
	public static void main(String[] args) {
		//
		// 10까지의 수를 더했다뺐다하기
		// 스위칭변수이용
		// 번갈아반복
		int sum = 0;
		boolean sw = false;

		for (int i = 1; i <= 10; i++) {

			//[4]
			System.out.printf(sw? "%d+":"%d-", i);
			sum += sw ? -i:i;
			sw=!sw;






			//[3] 스위칭 변수를 사용하는 방법 (기억) 시험냄

			/*
			if (sw) { //짝수
				System.out.printf("%d+", i);
				sum -= i;
			}//if
			else { //홀수
				System.out.printf("%d-", i);
				sum += i;
				sw = !sw;
			}//else
			 */

			/*	[2]
			System.out.printf(i%2 == 0? "%d+":"%d-", i);
			sum += i%2==0? -i:i;
			 */


			/*  [1]
			if (i%2 ==0) { //짝수
				System.out.printf("%d+", i);
				sum -= i;
			}//if
			else { //홀수
				System.out.printf("%d-", i);
				sum += i;
			}//else
			 */
		}//for i
		System.out.printf("%d=", sum);



	}//main
}//class
