package days08;

import java.util.Arrays;
import java.util.Scanner;

public class Ex02_02 {
	public static void main(String[] args) {
		//배열 초기화
		int [] m = {10, 20};

		System.out.println(Arrays.toString(m));
		swap(m);// Call By reference
		System.out.println(Arrays.toString(m));


	}//main

	private static void swap(int[] m) {
		int temp = m[0];
		m[0] = m[1];
		m[1] = temp;

	}

	public static void swap(int x, int y) {

		System.out.printf("1. swap x=%d, y=%d\n", x, y);
		int temp = x;
		x = y;
		y = x;

		System.out.printf("2. swap x=%d, y=%d\n", x, y);

	}

}//class
