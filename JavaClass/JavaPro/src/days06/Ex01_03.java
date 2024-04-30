package days06;

/**
 * @author kenik
 * @date 2024. 1. 8. - 오전 10:35:09
 * @subject
 * @content
 */
public class Ex01_03 {

	public static void main(String[] args) {

		// 한 문자가 특수문자(#@$!) 체크
		char one = '$';      
		// [2]
		String strCheck = "#@$!";

		// 문자열 길이 구하는 함수 : String.length()
		// System.out.println( strCheck.length() ); // 4
		boolean flag = false;
		// char String.charAt(index)
		for (int i = 0; i < strCheck.length() ; i++) {
			System.out.printf("%d - '%c'\n", i, strCheck.charAt(i));
			if( one == strCheck.charAt(i) ) {
				flag = true; 
				break;
			}

				/*
         if( one == strCheck.charAt(i) ) {
            // 특수문자
            System.out.println("특수문자 O");
            break;
         }else {
            System.out.println("특수문자 X");
         }         
				 */
			
			//
		}
			if (flag) {
				System.out.println("특수문자 O");
			} else {
				System.out.println("특수문자 X");
			}
		

		/* [1]
      if ( one == '#' || one == '@' || one == '$' || one == '!' ) {

      } else {

      }

      for (int i = 32; i <=127; i++) {
         System.out.printf("%d :  [%c]\n", i, i);
      }
		 */




	} // main

} // class








