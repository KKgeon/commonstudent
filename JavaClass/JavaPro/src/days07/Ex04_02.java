package days07;

public class Ex04_02 {

	public static void main(String[] args) {
		// 12:02 수업시작~
		int [] kors = { 99, 1, 100, -10, 101 };
		String regex = "[1-9]?\\d|100"; // 2
		
		for (int i = 0; i < kors.length; i++) {
			int kor = kors[i];			
			/*
			if( kor >= 0 && kor <= 100) {
				System.out.println( kor );
			}
			*/
			if( (kor+"").matches(regex) ) {
				System.out.println( kor );
			}
			
		} //for i

	} // main

}
