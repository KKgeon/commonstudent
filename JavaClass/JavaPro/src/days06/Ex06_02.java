package days06;

import java.util.Arrays;
import java.util.Scanner;

public class Ex06_02 {

	public static void main(String[] args) {

		String name;
		Scanner sc = new Scanner(System.in);
		name = sc.nextLine();
		System.out.printf("name : %s\n", name);

		//String.toCharArray()
		// String -> char[] 변환하는 함수(메서드)
		char [] nameCharArray = name.toCharArray();

		//배열 안의 값을 확인하는 용도로 Arrays.toString() 메서드를 사용.
		//[ k,a,n,g,m,y,o,u,n,g,g,e,o,n]
		System.out.println(Arrays.toString(nameCharArray));

		// char을 string배열로 바꿔주는 코딩
		name = String.valueOf(nameCharArray);
	      System.out.printf("name:%s\n",name);
		
		
//		for (char c : nameCharArray) {
//			System.out.printf("%c\n", c);
//		}//for

	}//m

}//c
