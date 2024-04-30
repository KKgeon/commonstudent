package days08;

public class Ex06_03 {
	public static void main(String[] args) {
		String rrn = "123456-1234567";
		
		String[] rrnArray = rrn.split("-");
		System.out.println(rrnArray[0]);
		System.out.println(rrnArray[1]);
		System.out.println(rrnArray[1].charAt(0));
		String printRRN = rrnArray[0] + "-" + rrnArray[1].charAt(0) + "******";
		
		System.out.println(printRRN);
	      // 주민등록번호를 출력

	}//m
}//c
