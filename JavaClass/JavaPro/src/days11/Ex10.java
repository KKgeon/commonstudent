package days11;

import java.util.Arrays;

/**
 * @author geon
 * @date 2024. 1. 15. - 오후 3:43:40
 * @subject
 * @content
 */
public class Ex10 {

	public static void main(String[] args) {
		//정렬( sort ) - 일정한 순서로 다시 배열하는 것.
		// 오름차순 정렬
		// 예) 숫자	0 1 2 3 4 5
		//			a b c d e f
		//			가 나 다 라 마
		// 내림차순 정렬
		//			5 4 3 2 1 0
		//			f e d c b a
		//			마 라 다 나 가

		//정렬방법

		int [] m = {3,5,2,4,1};
		System.out.println(Arrays.toString(m));

		//1) 버블 정렬 (bubble sort) - 시험내기로함. 코딩외우기.
		//		bubblesort(m);
		//		System.out.println(Arrays.toString(m));


		//2) 선택 정렬
		selectionSort2(m);
		System.out.println(Arrays.toString(m));



		//3) 삽입 정렬
		//4) 병합 정렬

	}//m


	private static void selectionSort2(int[] m) {
		for (int i = 0; i < m.length; i++) {//선택된위치
			int minIndex = i;
			for (int j = i+1; j < m.length; j++) {
				if (m[minIndex]>m[j]) minIndex=j;
			}
			if (minIndex==i) continue;
				
					
			
				int temp = m[i];
				m[i] = m[minIndex];
				m[minIndex] = temp;

			System.out.println(Arrays.toString(m));
		}//for i
		System.out.println();
}


	private static void selectionSort(int[] m) {
		// 3,5,2,4,1
		for (int i = 0; i < m.length-1; i++) {
			for (int j = i+1; j <= 4; j++) {
				System.out.printf("%d-%d",i,j);
				if (m[i]>m[j]) {
				System.out.print(" *** ");
				int temp = m[i];
				m[i] = m[j];
				m[j] = temp;
				}
				System.out.println(Arrays.toString(m));
			}
			System.out.println();
		}//for
	}


	//오름차순정렬( 화살표만 바꾸면 내림차순 정렬) a>b
	private static void bubblesort(int[] m) {
		// 3,5,2,4,1
		//회전하기 전
		// 3,2,4,1,[5]
		//1회전 0-1 1-2 2-3 3-4
		// 2,3,1,[4],[5]
		//2회전 0-1 1-2 2-3 
		// 2,1,[3],[4],[5]
		//3회전 0-1 1-2 
		//[1],[2],[3],[4],[5]
		//4회전 0-1

		// 1회전하게 되면 오른쪽에 가장 큰 수가 오게 된다.

		//버블정렬코딩
		for (int i = 1; i <= 4; i++) {
			for (int j = 1; j <= 5-i; j++) {
				System.out.printf("%d-%d",j-1,j);
				if (m[j-1]>m[j]) {
					System.out.print(" *** ");
					int temp = m[j-1];
					m[j-1] = m[j];
					m[j] = temp;
				}
				System.out.println(Arrays.toString(m));
			}
			System.out.println();
		}//for


	}
}//c
