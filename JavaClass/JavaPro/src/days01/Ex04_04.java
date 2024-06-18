package days01;

public class Ex04_04 {

	public static void main(String[] args) {
		
		String name = "권맑음";
		int age = 31-1;
		
		// 출력형식 = 이름은 "권맑음"이고, 나이는 31살이다.
		// System.out.printf("출력형식",매개변수값...);
		// String %s
		// int 	  %d
		System.out
		.printf("이름은\"%s\"이고, 나이는 %d살이다.", name, age)
		.println("종료");
	}
}
