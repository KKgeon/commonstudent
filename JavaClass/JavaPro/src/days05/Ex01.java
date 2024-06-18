package days05;

public class Ex01 {
	public static void main(String[] args) {

		//배열선언 + 초기화(동시) == [배열 초기화]

		/*
		int [] kors = new int [3];
		// 초기화(입력)
		kors[0] = 90;
		kors[1] = 38;
		kors[2] = 88;
		 */
		//위의 과정을 동시에 하는것을 배열 초기화라고 앞으로 부른다.



		// 배열초기화 = 선언 + 생성 + 초기화
		//int [] kors = new int [] { 90, 38, 88 };
		int [] kors = { 90, 38, 88 }; // 이 형식은 암기하기. 배열초기화 방식.
		
		for (int i = 0; i < kors.length; i++) {
			System.out.printf("kors[%d]=%d\n", i , kors[i]);

		}
	}
}