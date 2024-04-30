package days02;

/**
 * @author geon
 * @date 2024. 1. 2. - 오전 9:56:18
 * @subject
 * @content
 */
public class Ex01 {
	/**
	 * @param args
	 */
	public static void main(String[] args){
		//식별자 - 변수명, 클래스명, 메서드명 등등
		//식별자는 부여하는 방법은 검색해서 알아보기
		/*
		n 변수
		'n' 한 문자
		"n" 문자열 = 'n' + '\0' <-억슬래시 0을 널문자라고 부름

		 */
		/*
		String name = "강명건";
		String height = "174.9";

		System.out.printf("이름 : \"%s\", 키 : %scm", name, height);
		 */
		String name = "강명건";
		//Type mismatch: cannot convert from String to int
		double height = 174.9;

		System.out.printf("이름 : \"%s\", 키 : %fcm", name, height);
	}
} 
