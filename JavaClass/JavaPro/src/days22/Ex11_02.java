package days22;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

import days11.Ex05_03;
import days14.Student;

public class Ex11_02 {
	public static void main(String[] args) throws IOException {

		ArrayList class1List = new ArrayList();
		ArrayList class2List = new ArrayList();
		ArrayList class3List = new ArrayList();


		ArrayList sistList = new ArrayList();

		sistList.add(class1List);
		sistList.add(class2List);
		sistList.add(class3List);


		char con = 'y';


		String name;
		int kor,eng,mat,tot,rank,wrank;
		double avg;
		//입력
		Scanner sc = new Scanner(System.in);
		int ban;
		do {
			System.out.printf(">반 입력 ? ");
			ban = sc.nextInt();
			ArrayList classList =(ArrayList)sistList.get(ban-1);
			System.out.printf("> %d반의 [%d]번 학생의 이름, 국어, 영어, 수학 입력 ? ", ban, classList.size()+1); 

			name = Ex05_03.getName();
			kor = Ex05_03.getScore();
			eng = Ex05_03.getScore();
			mat = Ex05_03.getScore();

			tot = kor+eng+mat;
			avg = (double)tot/3;
			wrank = rank = 1;



			Student s = new Student(name, kor, eng, mat, tot, avg, rank, wrank);

			classList.add(s);




			// 입력 계속 ? y 
			System.out.print("> 학생 입력 계속 ?");
			con = (char)System.in.read();
			System.in.skip(System.in.available());
		} while (Character.toUpperCase(con)=='Y');

		//출력
		dispStudentInfo(sistList);



	}//m

	private static void dispStudentInfo(ArrayList sistList) {
		// int totalStudents =  sistList.stream().mapToInt(ArrayList::size).sum();
		// IntStream 객체 [ 3, 2, 1 ]

		// System.out.printf("\t\t학생 정보 출력( %d명 )\n", totalStudents );

		int totalStudents = 0;


		int ban = 1;
		Iterator ir = sistList.iterator();
		while (ir.hasNext()) {
			ArrayList classList = (ArrayList) ir.next();
			totalStudents += classList.size();
			System.out.println("=".repeat(60));
			System.out.printf("[%d반 학생 : %d명 ] \n", ban++, classList.size());

			Iterator ir2 = classList.iterator();
			while (ir2.hasNext()) {
				// totalStudents++;
				Student s = (Student) ir2.next();
				s.dispInfo();

			}//while2

		}//while1
		System.out.printf("\t\t학생 정보 출력( %d명 )\n", totalStudents );

	}//dispSI
}//c
