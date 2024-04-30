package days08;

import java.util.Arrays;

public class Ex06_02 {
	public static void main(String[] args) {
		String rrn = "123456-1234567";
		  // String split()
	      // "830412" + "1******"
	      // String -> char []
	      char [] rrnArr = new char[ rrn.length() ];
	      System.out.println( Arrays.toString(rrnArr) );
	      // String Arrays.toString(배열)
	      Arrays.fill(rrnArr, '*');
	      
	      for (int i = 0; i < 8; i++) {         
	         //if(i >=8) {
	         //   rrnArr[i]= '*';
	         //}else {
	            rrnArr[i]= rrn.charAt(i);
	         //}          
	      }      
	      System.out.println( Arrays.toString(rrnArr) );
	      // char[] -> String 
	      String printRRN = String.valueOf(rrnArr);
	      System.out.println( printRRN );
	      
	      
	      // 주민등록번호를 출력
	      // 830412-1******


	}//m
}//c
