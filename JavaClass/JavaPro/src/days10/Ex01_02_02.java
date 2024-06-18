package days10;

public class Ex01_02_02 {
	public static void main(String[] args) {
		int n = 125;
		int reminder, share;
		//		String strHex = "";
		StringBuilder sb = new StringBuilder();

		String hex = "0123456789ABCDEF";

		while (n != 0) {
			share = n/16;
			reminder = n%16;
			//	System.out.println(reminder);
			sb.append(hex.charAt(reminder));
			//sb.insert(0,hex);
			n = share;		
		}//while
		System.out.println(sb.reverse());




	}//m

}//c
