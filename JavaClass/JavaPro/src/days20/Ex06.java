package days20;

import java.text.DecimalFormat;

/**
 * @author geon
 * @date 2024. 1. 26. - 오후 2:26:23
 * @subject	[ 형식화 클래스 4가지 ]
 * @content
 * 			SimpleDate	Format ***
 * 			Decimal		Format
 * 			Choice		Format
 * 			Message		Format
 * 		
 */
public class Ex06 {
	public static void main(String[] args) {

		//[Decimal	Format]
		//숫자 형식화하는 클래스
		//int money = 3257600;
		//double money = 3257600.826;
		double money = 3257600.8;


		//[3]
		
		//String pattern = "#,###.00";//3,257,600.80
		String pattern = "#,###.##";//3,257,600.8
		//String pattern = "\u00A4#,###";
		DecimalFormat df = new DecimalFormat(pattern);
		String result =  df.format(money);
		System.out.println(result);
		
		
		

		/*
		 * 
		 * 
		 * [2]
		String result = String.format("%,d", money);
		System.out.println(result);
		 */

		/*
		String strMoney = money +"";
	      int moneyLength = strMoney.length();
	      String result = "";
	      for (int i = 0; i < moneyLength; i++) {
	         char one = strMoney.charAt(i);
	         int placeValue = moneyLength - i;
	         // System.out.println( one +" " + placeValue);
	         result += one;
	         //if( placeValue != 1 && placeValue % 3 == 1 ) 
	         if(  placeValue % 3 == 1 )
	             //System.out.println(",");
	            result +=",";
	      }   
	      System.out.println( result );
	      System.out.println( result.substring(0, result.length() -1) );
		 */



	}//m
}//c
