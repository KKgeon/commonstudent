package days18;

/**
 * @author geon
 * @date 2024. 1. 24. - 오후 12:16:11
 * @subject		[문자열 다루는 클래스]
 * @content		1. String	***		변경 불가능한 클래스
 * 				2. StringBuffer
 * 				3. StringBuilder
 * 				4. StirngTokenizer
 */
public class Ex04 {
	public static void main(String[] args) {

		String name = "홍길동";
		name += "님";
		name += "안녕!!!";
		System.out.println(name);

		//String name = "홍길동";
		//name = "이창익";

		// [S]tring 타입 (자료형) - 클래스, 참조타입

		//		String name = new String("홍길동");

		//[String method 이해, 암기]
		// 1. char .charAt(int index)
		// 2. .length()
		/*
		int leng = name.length();
		for (int i = 0; i < leng; i++) {
			System.out.printf("name[%d]=%c\n", i, name.charAt(i));
			}
		 */

		// 3. .substring() 	90[01][12]-1700001
		//name 문자열 속에서 "안녕"이라는 문자열이 있는지 여부 확인 후 "안녕"을 "Hi" 문자열로 변경하자
		 name = "이창익님 안녕!!!";

		boolean isExist = name.contains("안녕");
		if (isExist) {
			System.out.println("안녕있음");
		} else {
			System.out.println("안녕없음");

		}

		int foundIndex = -1;

		if ((foundIndex = name.indexOf("안녕"))==-1) {
			System.out.println("안녕없음");
		} else {
			System.out.printf("안녕은 %d 위치에 있음\n", foundIndex);

			String s = name.substring(0, foundIndex);
			System.out.println(s.concat("Hi")
					.concat(	
							name.substring( foundIndex + ("안녕".length()) )	)	
					);
			
			System.out.println(name.replace("안녕", "구와악"));
		}



	}//m
}//c
