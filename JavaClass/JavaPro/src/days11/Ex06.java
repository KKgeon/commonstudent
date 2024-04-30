package days11;

import java.util.Arrays;
import java.util.Random;
import java.util.stream.IntStream;

public class Ex06 {
	public static void main(String[] args) {
		int [] m = { 3, 92, 3, 40, 71, 91, 61, 92, 76, 71, 59, 54, 64, 48, 66, 92, 25, 20, 73, 37 };
		//max, min, sum, avg

		int max, min, sum;
		double avg;
		max = min = sum = m[0];
		/*
		for (int i = 1; i < m.length; i++) {
			sum+=m[i];
		}
		System.out.println(sum);
		 */	//max구하는 코딩
		
		
		for (int i = 1; i < m.length; i++) {
			if( max < m[i] ) max = m[i];
			else if( min > m[i])  min = m[i];
			sum += m[i];         
		} // for

		/*
		for (int i = 0; i < m.length; i++) {
			int sum=0;
			sum =+ m[i] ;
			System.out.print(Arrays.toString(m));
		}
		 */

		System.out.println(min);
		System.out.println(max);
		System.out.println( sum );
		avg = (double)sum / m.length;
		System.out.println(avg);





		System.out.println("-".repeat(30));
		max = IntStream.of(m).max().getAsInt();
		min = IntStream.of(m).min().getAsInt();
		sum = IntStream.of(m).sum();
		avg = IntStream.of(m).average().getAsDouble();
		//
		int [] score = new Random().ints(20,0,101).toArray();




	}//m
	
	
	
}//c
