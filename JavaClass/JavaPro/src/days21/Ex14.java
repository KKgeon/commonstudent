package days21;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

import days14.Student;
import days14.StudentManagement;

public class Ex14 {
	public static void main(String[] args) throws IOException {
		//
		// 한 반에 30명 학생 - 이,국,영,수,총,평,등 성적처리
		//1차원
		//2차원
		//3차원
		//Student 클래스 배열 처리 + ArrayList 컬렉션 클래스 사용하기
		String name;
		int kor, eng, mat, tot;
		double avg;
		int rank;

		ArrayList list = new ArrayList();


		Scanner scanner = new Scanner(System.in);
		char con = 'y';

		do {
			System.out.printf("> %d번 이름, 국어, 영어, 수학 입력 ? "
					, list.size()+1);
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

		proRank(list);

		dispStudent(list);

	}//m

	private static void proRank(ArrayList list) {
		Iterator ir = list.iterator();
		while (ir.hasNext()) {
			Student s = (Student) ir.next();
			s.rank = 1;
			for (int i = 0; i < list.size(); i++) {
				int targerTot = ((Student) list.get(i)).tot;
				if (s.tot<targerTot) {
					s.rank++;
				}//if
			}//for
		}//while

	}//pro

	private static void dispStudent(ArrayList list) {
		Iterator ir = list.iterator();
		while (ir.hasNext()) {
			Student s = (Student) ir.next();
			s.dispInfo();

		}//while

	}//dsip


}//c
