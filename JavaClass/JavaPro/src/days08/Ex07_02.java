package days08;

public class Ex07_02 {
	public static void main(String[] args) {
		// [정보 처리 기사 실기]
		int money = 125760;
		int count = 0;
		// 화폐단위 : 5만원, 1만원, 5천원, 1천원, 5백원, 1백원, 5십원, 1십원, 5원, 1원
		int [] unit = { 50000, 10000, 5000, 1000, 500, 100, 50, 10, 5, 1 };
		String [] sunit = { "5만원", "1만원", "5천원", "1천원", "5백원", "1백원", "5십원", "1십원", "5원", "1원" };
		
		for (int  i  = 0; i < unit.length; i++) {
			count = money/unit[i];
			System.out.printf("%s : %d개\n", sunit[i], count);
			money %= unit[i]; 
		}

		
	}//m
}//c
