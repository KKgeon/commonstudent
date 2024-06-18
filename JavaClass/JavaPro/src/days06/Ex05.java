package days06;

import java.util.Iterator;
import java.util.Scanner;

/**
 * @author geon
 * @date 2024. 1. 8. - 오후 3:39:17
 * @subject
 * @content
 */
public class Ex05 {
	public static void main(String[] args) {
		// 5. 두 정수(x, y)를 입력받아서
		// 두 정수 사이의 합을 출력하는 코딩을 하세요.
		
		
		
		
		int x, y, sum = 0;
		Scanner sc = new Scanner(System.in);
		x = sc.nextInt();
		y = sc.nextInt();
		int min = Math.min(x, y);
		int max = Math.max(x, y);
		
		if (min % 2 !=0) min++;
		for (int i = min; i < max; i+=2) {
			sum +=i;
			System.out.printf("%d+", i);
			
			
		}//for
		System.out.printf("=%d\n", sum);
		
		
		/*      						1번코딩
		for (int i = min; i <= max; i++) {
			if (i % 2 == 0) {
				sum += i;
				System.out.printf("%d+", i);
				
			}//if
			
		}//for
		System.out.printf("=%d\n", sum);
		*/
		
		
		
		
	}//m
}//c
