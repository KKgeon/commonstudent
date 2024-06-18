package days22;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Scanner;

import days14.Student;

public class Ex11 {
	public static void main(String[] args) throws IOException {
		//	3반 30명 학생의 성적 처리
		//	Student 클래스 배열 선언
		//Student [] students = new Student[30];
		//Student [][] students = new Student[3][30];

		//1) Student 클래스 사용
		//2) 입력받는순서 유지 - List : ArrayList 컬렉션 클래스

		ArrayList list = new ArrayList();

		String name;
		int kor, eng, mat, tot;
		double avg;
		int rank;

		Scanner scanner = new Scanner(System.in);
		char con = 'y';


		do {
			System.out.printf("> %d번 이름, 국어, 영어, 수학 입력 ? ", list.size()+1);
			name = scanner.next();    // 이름
			kor = scanner.nextInt();   // 국
			eng = scanner.nextInt();   // 영
			mat = scanner.nextInt();   // 수
			tot = kor + eng + mat;
			avg = (double)tot / 3;
			rank = 1;
			Student s = new Student();

			s.name = name;
			s.kor = kor;
			s.eng = eng;
			s.mat = mat;
			s.tot = tot;
			s.avg = avg;		
			s.rank = rank;

			list.add(s);
			// 입력 계속 ? y 
			System.out.print("> 학생 입력 계속 ?");
			con = (char)System.in.read();
			System.in.skip(System.in.available());

		} while (Character.toUpperCase(con) == 'Y');
		procRank(list);
		dispStudentInfo(list);
	}//m

	private static void procRank(ArrayList list) {
		Iterator ir = list.iterator();
		while (ir.hasNext()) {
			Student s = (Student) ir.next();
			s.rank=1; 
			Iterator ir2 = list.iterator();
			while (ir2.hasNext()) {
				Student s2 = (Student) ir2.next();
				if( s.tot < s2.tot ) s.rank++;
			} // while 

		} // while

	}//procRank

	private static void dispStudentInfo(ArrayList list) {
		System.out.printf("총 %d명 : \n", list.size());
		Iterator ir = list.iterator();
		while (ir.hasNext()) {
			Student s = (Student) ir.next();
			s.dispInfo();

		}

	}
}//c
