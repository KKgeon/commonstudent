package days19;

import java.util.Arrays;

public class Ex02 {
	public static void main(String[] args) {

		String my_str = "abc1Addfggg4556b"	;
		int n = 12;

		String [] answer = solution(my_str, n);


		System.out.println(Arrays.toString(answer));
	}//m
	public static String[] solution(String my_str, int n) {
		String[] answer = {};

		int arraylength = (int) Math.ceil( (double)my_str.length()/n);

		answer = new String[arraylength];

		StringBuilder sb = new StringBuilder(my_str);
		/*
		answer[0] = sb.substring(0,6); sb.delete(0, 6);
		answer[1] = sb.substring(0,6); sb.delete(0, 6);
		answer[2] = sb.substring(0); sb.delete(0, 6);
		 */
		for (int i = 0; i < answer.length-1; i++) {
			answer[i] = sb.substring(0,n); sb.delete(0, n);
			
		}//for
		answer[answer.length-1] = sb.substring(0);
		

		return answer;
	}//solution

}//c
