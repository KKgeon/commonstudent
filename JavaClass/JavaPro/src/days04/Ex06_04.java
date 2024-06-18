package days04;

/**
 * @author geon
 * @date 2024. 1. 4. - 오후 4:43:29
 * @subject
 * @content
 */
public class Ex06_04 {
	public static void main(String[] args) {
	// [문제] 1~10까지의 합 구해서 출력.
		int sum = 0;
		for (int i = 15; i >= 6; i--) {
			System.out.printf("%d+", i-5);
		sum = sum + i-5;
			
		}
		System.out.printf("\b=%d\n", sum);
	}

}
