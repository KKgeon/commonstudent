package days10;

public class Ex01_03 {
	public static void main(String[] args) {
		int n = 125;
		int reminder, share;
		String strHex = "";
		char[] ch = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};

		System.out.println(Integer.toHexString(n));
		while (n != 0) {
			share = n/16;
			reminder = n%16;


			//	System.out.println(reminder);
			strHex += "["+reminder+"]";	
			n = share;		
		}//while

		System.out.println(strHex);



	}//m

}//c
