package days12;

import java.io.IOException;
import java.util.Random;
import java.util.Scanner;

/**
 * @author geon
 * @date 2024. 1. 16. - 오전 11:01:45
 * @subject	1차원 배열-> 2차원 배열로 변경하는 코딩 수정
 * @content	 복습(내일 시험 1번)
 */
public class Ex03 {
	public static void main(String[] args) throws IOException {

		String name;
		int kor, eng, mat, tot;
		double avg;
		int rank;

		final int STUDENT_COUNT = 23;

		
		String [] names = new String[STUDENT_COUNT];
		/*
		int [] kors = new int[STUDENT_COUNT];0열
		int [] engs = new int[STUDENT_COUNT];1열
		int [] mats = new int[STUDENT_COUNT];2열
		int [] tots = new int[STUDENT_COUNT];3열
		int [] ranks = new int[STUDENT_COUNT];4열
		 */
		int [][] infos = new int[STUDENT_COUNT][5];
		double [] avgs = new double [STUDENT_COUNT];

		Scanner scanner = new Scanner(System.in);
		int count = 0;  // 실제 입력받은 학생수 
		char con = 'y';


		do {
			System.out.printf("> %d번 이름, 국어, 영어, 수학 입력 ? ", count+1);
			name = getName();    // 이름
			kor = getScore();   // 국
			eng = getScore();   // 영
			mat = getScore();   // 수
			tot = kor + eng + mat;
			avg = tot / 3;
			rank = 1;
			 
			names[count] = name;
			
			// [infos 2차원배열로 수정]
			infos[count][0] = kor;
			infos[count][1] = eng;
			infos[count][2] = mat;
			infos[count][3] = tot;
			avgs[count] = (int) avg;		
			infos[count][4] = rank;
			
			count++;  // 1명
			
			// 입력 계속 ? y 
			System.out.print("> 학생 입력 계속 ?");
			con = (char)System.in.read();
			System.in.skip(System.in.available());
			
		} while (Character.toUpperCase(con) == 'Y');
		
		// 등수처리
		procRank(infos, count);

		// 학생 정보 출력 
		dispStudentInfo(names, infos, avgs, count);

	} // main

	private static void procRank(int[][] infos, int count) {
		// 1   나머지 총점 비교
		// 2   나머지 총점 비교
		// 7   나머지 총점 비교
		// i=0    j=0,1,2,3
		// i=1    j=0,1,2,3
		// i=2    j=0,1,2,3
		// i=3    j=0,1,2,3
		for (int i = 0; i < count; i++) {
			infos[i][4] = 1;
			for (int j = 0; j < count; j++) {
				// if( i == j ) continue;
				if( infos[i][3] < infos[j][3] ) infos[i][4]++;
			}
		}
		
	}

	private static void dispStudentInfo(String[] names, int [][] infos, double[] avgs,int count) {
		 
		System.out.printf("총 %d명 \n", count);
		for (int i = 0; i < count; i++) {
			System.out.printf("%d번\t%s\t%d\t%d\t%d\t%d\t%.2f\t%d등\n"
					, i+1, names[i], infos[i][0], infos[i][1], infos[i][2], infos[i][3]
							, avgs[i], infos[i][4] );
		} // 
		
	}
	
	// 랜덤하게 점수를 발생시키는 함수( 0~100 )
	public static int getScore() {
		return (int)(Math.random()*101);
	}
	
	public static String getName() {
	   String[]  lastNames = {"김","이", "박", "최", "권", "홍"};  
	   Random rnd = new Random();
	   
	   int index = rnd.nextInt(lastNames.length); // 0<= int  <6
	   String lastName = lastNames[index];  // 성
	   
	   // 이름
	   char [] firstNames = new char[2];
	   for (int i = 0; i < firstNames.length; i++) {
		  firstNames[i] = (char)(rnd.nextInt('힣' - '가' + 1) + '가');
	   }
	   
	   String name = lastName + firstNames[0] + firstNames[1];	   
	   return name;
	   
	}

} // class





