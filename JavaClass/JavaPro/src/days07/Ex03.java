package days07;

import java.util.Iterator;
import java.util.Scanner;

/**
 * @author geon
 * @date 2024. 1. 9. - 오전 10:26:17
 * @subject
 * @content
 */
public class Ex03 {
	public static void main(String[] args) {

		int row, col;
		Scanner sc = new Scanner(System.in);

		System.out.println(">행의 갯수를 입력하시오?");
		row = sc.nextInt();
		col = 2 * row -1;


		//[8] 복습 3번문제 풀이
		for (int i = 1; i <= row; i++) {
				System.out.printf("%d : ", i);
			for (int j = 1; j <= col; j++) {
				//System.out.print(i+j>=4?"*":"_");
				//System.out.print(j-i<=2?"*":"_");
				System.out.print(i+j>=row+1 && j-i<=row-1 ? "*":"_");
			}//forj
			System.out.println();
		}//fori


// 이해 제대로 못했으니 따로 복습하자













		/*
		//[7] 5행 5열

		for (int i = 1; i <= 5; i++) {
			for (int j = 1; j <= 5; j++) {
//1번방법			//	if (i==j) System.out.print("*");
				//	else System.out.print("_");

//2번방법			System.out.print(i==j?"*":"_");		

			}//for j	
			System.out.println();
		}//for i


		 */









		//[6]		공백	별
		//__*	i=1 j=0	4
		//_***	i=2 j=1	3
		//*****	i=3 j=2	3


		/*
		for (int i = 1; i <= 3; i++) { //행갯수
			// 공백 출력 for
			for (int j = 1; j <= 3-i; j++) { //공백갯수
				System.out.print("_");
			}//for j
			//별 출력 for
			for (int k = 1; k <= i*2-1; k++) { //별갯수
				System.out.print("*");
			}//for
			System.out.println();
		}//for i

		 */		









		/*
		//[5]		공백	별
		//****	i=1 j=0	4
		//_***	i=2 j=1	3
		//__**	i=3 j=2	3
		//___*	i=4 j=3	1


		for (int i = 1; i <= 4; i++) { //행갯수
			// 공백 출력 for
			for (int j = 1; j <= i-1; j++) { //공백갯수
				System.out.print("_");
			}//for j
			//별 출력 for
			for (int k = 1; k <= 5-i; k++) { //별갯수
				System.out.print("*");
			}//for k
			System.out.println();
		}//for i
		 */












		/*
		//[4]
		//___*	i=1 j=1
		//__**	i=2 j=1,2
		//_***	i=3 j=1,2,3
		//****	i=4 j=1,2,3,4


		for (int i = 1; i <= 4; i++) { 
			for (int j = 1; j <= 4; j++) {
				System.out.print(i+j >= 5 ?"*":"_");
			}//for j			
			System.out.println();
		}//for i 

		 */









		//[3]
		//****	i=1 j=1,2,3,4
		//***	i=2 j=1,2,3
		//**	i=3 j=1,2
		//*		i=4 j=1
		// i + j = 5
		// j = 5-i

		/*
		for (int i = 1; i <= 4; i++) { //행갯수
			for (int j = 1; j <= i; j++) { //열 갯수
				System.out.print("*");
			}//for j
			System.out.println();
		}//for i

		 */









		//[2]
		//*		i=1 j=1
		//**	i=2 j=1,2
		//***	i=3 j=1,2,3
		//****	i=4 j=1,2,3,4

		/*
		for (int i = 1; i <= 4; i++) { //행갯수
			for (int j = 1; j <= i; j++) { //열 갯ㅅ
				System.out.print("*");
			}//for j
			System.out.println();
		}//for i

		 */



		//[1]
		/*
		for (int i = 1; i <= 4; i++) {
			System.out.println("*".repeat(i));
		}
		 */
	}//main

}//class
