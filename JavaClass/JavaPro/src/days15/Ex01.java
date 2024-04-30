package days15;

import java.io.IOException;
import java.util.Scanner;

import days11.Ex05_03;
import days14.Student;

public class Ex01 {
	public static void main(String[] args) throws IOException {
		final int STUDENT_COUNT = 30;
		final int CLASS_COUNT= 3;

		//2차원 - 클래스 배열 선언
		Student [][] students = new Student[CLASS_COUNT][STUDENT_COUNT];

		char con = 'y';
		//int count = 0;
		int [] counts = new int [CLASS_COUNT];

		String name;
		int kor,eng,mat,tot,rank,wrank;
		double avg;

		Scanner sc = new Scanner(System.in);

		int ban;

		do {
			System.out.printf(">반 입력 ? ");
			ban = sc.nextInt();

			System.out.printf("> %d반의 [%d]번 학생의 이름, 국어, 영어, 수학 입력 ? ", ban, counts[ban-1]+1); //이해 잘 안됨.. 디버깅해봐야겟음

			name = Ex05_03.getName();
			kor = Ex05_03.getScore();
			eng = Ex05_03.getScore();
			mat = Ex05_03.getScore();

			tot = kor+eng+mat;
			avg = (double)tot/3;
			wrank = rank = 1;


/*
			Student s = new Student();
			s.name = name;
			s.kor = kor;
			s.eng = eng;
			s.mat = mat;
			s.tot = tot;
			s.rank = rank;
			s.wrank = wrank;
			s.avg=avg;
*/
			
			Student s = new Student(name, kor, eng, mat, tot, avg, rank, wrank);
			students[ban-1][counts[ban-1]]= s;

			counts[ban-1]++;




			// 입력 계속 ? y 
			System.out.print("> 학생 입력 계속 ?");
			con = (char)System.in.read();
			System.in.skip(System.in.available());
		} while (Character.toUpperCase(con)=='Y');

		for (int i = 0; i < counts.length; i++) {
			System.out.printf("[%d반 학생 : %d명 ] \n", i+1, counts[i]);
			for (int j = 0; j < counts[i]; j++) {
				students[i][j].dispInfo(); 

			}
		}
	}//m

}//c
