package days14;

import java.io.IOException;
import java.util.Scanner;

/**
 * @author geon
 * @date 2024. 1. 18. - 오후 2:45:17
 * @subject	days11.Ex05_02.java
 * @content	Student 학생 클래스 수정...
 */ //1번
public class Ex08 {
	public static void main(String[] args) throws IOException {
		String name;
		int kor, eng, mat, tot;
		double avg;
		int rank;

		final int STUDENT_COUNT = 23;

		Student [] students = new Student[STUDENT_COUNT];
		Scanner scanner = new Scanner(System.in);
		int count = 0;  // 실제 입력받은 학생수 
		char con = 'y';

		do {
			System.out.printf("> %d번 이름, 국어, 영어, 수학 입력 ? ", count+1);
			name = scanner.next();    // 이름
			kor = scanner.nextInt();   // 국
			eng = scanner.nextInt();   // 영
			mat = scanner.nextInt();   // 수
			tot = kor + eng + mat;
			avg = (double)tot / 3;
			rank = 1;
			students[count] = new Student();

			students[count].name = name;
			students[count].kor = kor;
			students[count].eng = eng;
			students[count].mat = mat;
			students[count].tot = tot;
			students[count].avg = avg;		
			students[count].rank = rank;

			count++;  // 1명

			// 입력 계속 ? y 
			System.out.print("> 학생 입력 계속 ?");
			con = (char)System.in.read();
			System.in.skip(System.in.available());

		} while (Character.toUpperCase(con) == 'Y');
		StudentManagement.procRank(students, count);

		dispStudentInfo(students, count);

	}//m

	private static void dispStudentInfo(Student[] students, int count) {
		System.out.printf("총 %d명 \n", count);
		for (int i = 0; i < count; i++) {
			System.out.printf("%d번\t", i+1);
			students[i].dispInfo();
			/*
			System.out.printf("%d번\t%s\t%d\t%d\t%d\t%d\t%.2f\t%d등\n"
					, i+1, students[i].name, students[i].kor, students[i].eng, students[i].mat, students[i].tot
					, students[i].avg, students[i].rank );
			 */

		}//for
	}//dispSI

}//c
