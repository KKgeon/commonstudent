package days06;

public class Ex01_04 {

	public static void main(String[] args) {
		char one = '7';
		String strCheck = "@#$!";
		
		// 정규표현식
		//[0-9] 는 [0123456789]와 같은뜻
		String regex = "[@#$!]";
		if ((one+"").matches(regex)) {
			System.out.println("특수문자 O");			
		} else {
			System.out.println("특수문자 X");
		}
		



	}

}
