package days08;

public class Ex06_04 {
	public static void main(String[] args) {
		String rrn = "123456-1234567";
		
		//String 	String.subsrting(beginIndex, endIndex) String 문자열의 n번째자리부터 n번째자리까지 읽어와주는 함수이다. 
		
		//사용예
		
		System.out.println(rrn.substring(0, 8) + "******");
		
		// String.concat(); String문자열을 연결해주는 함수이다.
		//사용예 (잘 쓰진않음 +로 문자열 붙이는게 훨씬 쉬우니깐)
		System.out.println(rrn.substring(0, 8).concat("******"));


		// 주민등록번호를 출력
	}
}
