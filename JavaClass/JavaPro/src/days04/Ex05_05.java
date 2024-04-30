package days04;

import java.util.Scanner;

/**
 * @author geon
 * @date 2024. 1. 4. - 오후 3:08:54
 * @subject 조건문 if, if~else 활용
 * @content	국어 점수를 입력받아서
 * 			등급(수, 우, 미, 양, 가) 출력
 * 
 * 
 */			
public class Ex05_05 {
	public static void main(String[] args) {

		/*
		int grade;


		try(Scanner scanner = new Scanner(System.in);) { 
			System.out.println(">국어 점수 입력?");
			grade = scanner.nextInt();
			if (grade >= 90 && grade <= 100) {
				System.out.println("수");

			}
			if (grade >= 80 && grade <= 90) {
				System.out.println("우");

			}
			if (grade >= 70 && grade <= 90) {
				System.out.println("미");

			}
			if (grade >= 60 && grade <= 70) {
				System.out.println("양");				
			}
			else {System.out.println("가");

			}

		} catch (Exception e) {// TODO: handle exception
		}
		 */
		int kor;


		try(Scanner scanner = new Scanner(System.in);) { 
			System.out.println(">국어 점수 입력?");
			kor = scanner.nextInt();
			if (kor > 90 && kor <= 100) {
				System.out.println("수");
			}
			if (kor > 80 && kor < 90) {
				System.out.println("수");
			}
			if (kor > 70 && kor < 80) {
				System.out.println("수");
			}
			if (kor > 60 && kor < 70) {
				System.out.println("수");
			}
			if (kor >= 0 && kor <= 60) {
				System.out.println("수");
			}
			
		}

	}
}
