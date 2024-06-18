package days17;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import days16.Employee;
import days16.Temp;

/**
 * @author geon
 * @date 2024. 1. 23. - 오전 10:46:12
 * @subject
 * @content
 */
public class Ex04 {
	public static void main(String[] args) {
		/*
		//(업캐스팅)
		Employee emp = new Temp();
		 */

		List list = new ArrayList();
		test(list);
		test(new ArrayList()); // new SaleMan();
		test(new Vector());		// new Regular();
	}//m
	
	public static void test(List list) {//매개변수 다형성
		
	}
}//c
