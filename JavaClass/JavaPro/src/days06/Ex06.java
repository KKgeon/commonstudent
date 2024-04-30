package days06;

import java.util.Iterator;
import java.util.Scanner;

public class Ex06 {

	public static void main(String[] args) {
		//6. 본인의 영어이름을 입력받아서 char [] 로 변환후 foreach문을 사용해서 출력하는 코딩을 하세요.

		String name;
		Scanner sc = new Scanner(System.in);

		name = sc.nextLine();

		System.out.println(name.length());
		System.out.printf("name : %s\n", name);

		int arrayLength = name.length();

		char [] nameCharArray =  new char[arrayLength];
		for (int i = 0; i < arrayLength; i++) {
			nameCharArray[i] = name.charAt(i);

		}//for

		for (char c : nameCharArray) {
			System.out.printf("%c\n", c);

		}//for
	}//m

}//c
