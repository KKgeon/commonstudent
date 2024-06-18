package days09;

import java.util.Arrays;

/**
 * @author geon
 * @date 2024. 1. 11. - 오전 11:34:25
 * @subject
 * @content
 */
public class Ex06 {
	public static void main(String[] args) {
		int [] binaryArr = new int [32];
		int n = 10;
		int index = binaryArr.length-1; //윗첨자값 = 배열크기 -1 지금은 끝자리부터 이진수를 채워야하기때문에 씀.
		int reminder; //나머지 저장할 변수

		while (n != 0) {
			reminder = n%2;
			n /= 2;
			binaryArr[index--] = reminder;
		}//w
//		System.out.println( Arrays.toString(binaryArr));
		
		for (int i = 0; i < binaryArr.length; i++) {
			System.out.printf("%d", binaryArr[i]);
			if (i%8 == 7) System.out.print(" ");
			
		}//for
	}//m
}//c

