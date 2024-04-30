package days16;

import java.util.Arrays;

/**
 * @author geon
 * @date 2024. 1. 22. - 오전 10:15:23
 * @subject 요즘 너무 열심히 안한다..
 * @content
 */
public class Ex01 {
	public static void main(String[] args) {
		String n = "keNik";   
		String m= "kKnie";   
		
		
		//1. n,m 대문자로 변환
		
		n = n.toUpperCase();
		m = m.toUpperCase();
		
		//2. n, m 문자열 오름차순 정렬
		char [] nArr = n.toCharArray();
		Arrays.sort(nArr);
		System.out.println(Arrays.toString(nArr));
		
		char [] mArr = m.toCharArray();
		Arrays.sort(mArr);
		System.out.println(Arrays.toString(mArr));
		
		//3. n, m 같은지 묻기 true/false
		n= String.valueOf(nArr);
		m= String.valueOf(mArr);
		System.out.println(n.equals(m));
		
		
		
		
		
	}//m
}//c
