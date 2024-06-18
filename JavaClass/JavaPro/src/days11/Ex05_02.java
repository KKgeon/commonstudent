package days11;

import java.io.IOException;
import java.util.Scanner;

public class Ex05_02 {	
	public static void main(String[] args) throws IOException {
		// 한 반에 최대 23명 학생의
		// 성적 처리를 배열을 사용해서 해 보자.
		// 성적 처리( 국,영,수, 총, 평, 등수 ) 
		// 1. 입력 - 이름, 국, 영, 수
		// 2. 처리 - 총점, 평균, 등수
		// 3. 파일 입출력, DB 입출력 X
		String name;
		int kor, eng, mat, tot;
		double avg;
		int rank;


		final int STUDENT_COUNT = 23;

		String [] names = new String[STUDENT_COUNT];
		int [] kors = new int[STUDENT_COUNT];
		int [] engs = new int[STUDENT_COUNT];
		int [] mats = new int[STUDENT_COUNT];
		int [] tots = new int[STUDENT_COUNT];
		double [] avgs = new double[STUDENT_COUNT];
		int [] ranks = new int[STUDENT_COUNT];

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
			 
			names[count] = name;
			kors[count] = kor;
			engs[count] = eng;
			mats[count] = mat;
			tots[count] = tot;
			avgs[count] = avg;		
			ranks[count] = rank;
			
			count++;  // 1명
			
			// 입력 계속 ? y 
			System.out.print("> 학생 입력 계속 ?");
			con = (char)System.in.read();
			System.in.skip(System.in.available());
			
		} while (Character.toUpperCase(con) == 'Y');

		// 
		dispStudentInfo(names, kors, engs, mats, tots, avgs, ranks, count);

	} // main

	private static void dispStudentInfo(String[] names, int[] kors, int[] engs, int[] mats, int[] tots, double[] avgs,
			int[] ranks, int count) {
		 
		System.out.printf("총 %d명 \n", count);
		for (int i = 0; i < count; i++) {
			System.out.printf("%d번\t%s\t%d\t%d\t%d\t%d\t%.2f\t%d등\n"
					, i+1, names[i], kors[i], engs[i], mats[i], tots[i]
							, avgs[i], ranks[i] );
		} // 
		
	}

}//c
