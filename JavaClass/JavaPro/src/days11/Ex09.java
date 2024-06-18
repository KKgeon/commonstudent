package days11;

import java.util.Arrays;

/**
 * @author geon
 * @date 2024. 1. 15. - 오후 3:20:18
 * @subject
 * @content
 */
public class Ex09 {
	public static void main(String[] args) {
		//		int[]m = new Random().ints(100, 0, 10).toArray();
		int [] m = { 8, 3, 3, 0, 1, 7, 0, 1, 1, 4, 2, 0, 1, 7, 1, 9, 3, 9, 5, 0, 5, 0, 0, 9, 1, 4, 7, 8, 3, 2, 1, 7, 1, 1, 7, 3, 8, 3, 4, 0, 4, 3, 2, 3, 6, 1, 3, 1, 8, 8, 0, 4, 1, 8, 9, 9, 2, 2, 2, 5, 2, 7, 6, 1, 2, 0, 6, 6, 2, 6, 4, 9, 7, 8, 0, 6, 7, 6, 6, 0, 7, 3, 9, 2, 5, 6, 7, 8, 7, 7, 7, 5, 1, 3, 2, 7, 9, 8, 0, 4};

		System.out.println( Arrays.toString(m));

		/*
	    String strM = Arrays.toString(m);
	    // "[83301701142017193950   ]"
	   strM = strM.replaceAll(", ", "") ;
	    System.out.println(strM.length()  );
	    System.out.println(strM.replaceAll("0", "").length() );
		 */
		// 풀이 [1]
		
		int count=0 ;
		// i=0  j=m[0] ~  m[99]
		// i=1  j=m[0] ~  m[99]
		// :
		// i=9  j=m[0] ~  m[99]  
		for (int i = 0; i <10; i++) {
			count = 0;
			for (int j = 0; j < m.length; j++) { 
				if (i==m[j]) {
					count++;
				}  
			}
			System.out.println(i +"-"+count+"개");
		}
		 
/*
		// [2]		
		int [] countArray= new int[10];
		for (int i = 0; i < m.length; i++) {
			int index = m[i];
			countArray [  index   ]++; // 8
		}		
		System.out.println( Arrays.toString(countArray));
*/

		// [출력결과]
		// 0 -  5개
		// 1 - 16개
		// :
		// 9 - 22개
	}//m
}//c
