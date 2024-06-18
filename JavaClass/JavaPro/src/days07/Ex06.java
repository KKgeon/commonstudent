package days07;

public class Ex06 {
	public static void main(String[] args) {
		double sum = 0;
		for (int i = 2; i <= 10; i++) {
			System.out.printf("%d/%d+", i-1, i);
			sum += (i-1)/(double)i;
							
		}//for i
		System.out.printf("=%f\n", sum);
		
		
		
	}//m
}//c
