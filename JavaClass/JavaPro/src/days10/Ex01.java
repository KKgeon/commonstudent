package days10;

public class Ex01 {
	public static void main(String[] args) {
		int n = 10;
		int reminder, share;
		String strResult = "";

		while (n != 0) {
			share = n/8;
			reminder = n%8;
			//	System.out.println(reminder);
			strResult += reminder;	
			n = share;		
		}//while

		System.out.println(strResult);

		String reverseStrResult = "";
		for (int i = 0; i < strResult.length(); i++) {
			reverseStrResult += strResult.charAt(strResult.length()-1-i);

		}
		System.out.println(reverseStrResult);



	}//m

}//c
