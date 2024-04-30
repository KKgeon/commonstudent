package days06;

import java.util.Scanner;

public class Ex01_05 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int a, b, c;

		System.out.println(">정수 a_b_c 입력?");
		
		a = sc.nextInt();
		b = sc.nextInt();
		c = sc.nextInt();
		
		int max = Math.max(Math.max(a,b), c);
		int min = Math.min(Math.min(a,b), c);
		
		System.out.printf("가장 큰 수는 %d, 가장 작은 수는 %d", max, min);
	}
}
