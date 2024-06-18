package days13;

/**
 * @author geon
 * @date 2024. 1. 17. - 오후 4:13:00
 * @subject
 * @content 개노잼이지만 이걸 하는 이유는 이 로직이 정보처리기사 실기시험에 나오기 때문이다.
 * 				그럼해야지뭐 ㅎ
 */
public class Ex02 {

	public static void main(String[] args) {

		int [][] m = new int[5][5];
		magicSquere(m);


		//fillM04(m);
		//fillM03(m);
		//fillM02(m);
		//fillM01(m);

		dispM(m);
	} // main



	//1)첫번째행의 가운데열
	//2)출력할 값이 5의배수일시 행만 증가
	//3)출력할 값이 5의 배수가 아닐지 열 증가
	//
	private static void magicSquere(int[][] m) {

		int i, j;


	}




	/*
	 * 
	 * 오늘의 교훈 -> 로직을 아는것도 중요하지만 배운 여러 로직을 잘 섞어써먹는것도 중요하다.
	 * if문과 삼항연산자의 활용이 쏠쏠?
	 * 
	 */

	private static void fillM04(int[][] m) {
		for (int i = 0; i < m.length; i++) { // 행갯수
			for (int j = 0; j < m[i].length; j++) { // 열갯수
				m[i][j] = 5*i + j+1;
			} // for j         
		} // for i

	}

	private static void fillM03(int[][] m) {
		for (int i = 0; i < m.length; i++) { // 행갯수
			for (int j = 0; j < m[i].length; j++) { // 열갯수
				m[i][j] = 5-i + 5*j;
			} // for j         
		} // for i

		/*
      [05][10][15][20][25]
      [04][09][14][19][24]
      [03][08][13][18][23]
      [02][07][12][17][22]
      [01][06][11][16][21]

      00 -> 40
      01 -> 30
      02 -> 20
      03 -> 10
      04 -> 00

      10 -> 41
      11 -> 31
      12 -> 21
      13 -> 11
      14 -> 01

      20 -> 42
      21 -> 32
      22 -> 22
      23 -> 12
      24 -> 02



		 */
		// i=0 j=01234
		// i=1 j=01234
		// i=2 j=01234
		// i=3 j=01234
		// i=4 j=01234


		// [1]
		/*
      for (int i = 0; i < m.length; i++) { // 행갯수
         for (int j = 0; j < m[i].length; j++) { // 열갯수
            m[4-j][i] = 5*i+j+1; 
         } // for j         
      } // for i
		 */


	}

	private static void fillM02(int[][] m) {
		/*
      [25][24][23][22][21]
      [20][19][18][17][16]
      [15][14][13][12][11]
      [10][09][08][07][06]
      [05][04][03][02][01] 
		 */
		// p114~230 

		/*
      for (int i = 0, value = 25; i < m.length; i++) { // 행갯수
         for (int j = 0; j < m[i].length; j++, value--) { // 열갯수
            m[i][j] = value; 
         } // for j         
      } // for i

      for (int i = 0; i < m.length; i++) { // 행갯수
         for (int j = 0; j < m[i].length; j++) { // 열갯수
            m[i][j] = 25 - (5 * i + j) ; 
         } // for j         
      } // for i
		 */

		for (int i = 0; i < m.length; i++) { // 행갯수
			for (int j = 0; j < m[i].length; j++) { // 열갯수
				m[4-i][4-j] = 5 * i + j + 1; // 1,2,3,4,~ 25
			} // for j         
		} // for i


	}

	// 00  1
	// 01  2
	// *** 2차원 -> 1차원
	// 1차원 -> 2차원
	// [2]
	/*
   private static void fillM01(int[][] m) {
      for (int i = 0; i < m.length; i++) { // 행갯수
         for (int j = 0; j < m[i].length; j++) { // 열갯수
             m[i][j] = 5 * i + j + 1; // 1,2,3,4,~ 25
         } // for j         
      } // for i

   } // dispM
	 */

	// [1]
	/*
   private static void fillM01(int[][] m) {
      for (int i = 0, value = 1; i < m.length; i++) { // 행갯수
         for (int j = 0; j < m[i].length; j++, value++) { // 열갯수
             m[i][j] = value;
         } // for j         
      } // for i

   } // dispM
	 */

	private static void dispM(int[][] m) {
		for (int i = 0; i < m.length; i++) { // 행갯수
			for (int j = 0; j < m[i].length; j++) { // 열갯수
				System.out.printf("[%02d]", m[i][j]);
			} // for j
			System.out.println();
		} // for i

	} // dispM

} // class







