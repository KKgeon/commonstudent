package days10;

public class Ex01_02 {
	public static void main(String[] args) {
		int n = 125;
		int reminder, share;
		String strHex = "";

		while (n != 0) {
			share = n/16;
			reminder = n%16;

			switch (reminder) {
			case 10: reminder = 'A'; break;				
			case 11: reminder = 'B'; break;				
			case 12: reminder = 'C'; break;				
			case 13: reminder = 'D'; break;				
			case 14: reminder = 'E'; break;				
			case 15: reminder = 'F'; break;
			default: reminder = reminder + '0'; break;
			}
			//	System.out.println(reminder);
			strHex += "["+(char)reminder+"]";	
			n = share;		
		}//while

		System.out.println(strHex);



	}//m

}//c
