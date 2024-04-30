package days05;

public class Ex03_02 {
	public static void main(String[] args) {
		//임의의 수를 발생시키는 방법
		//Math.random(); <- 얘는 랜덤으로 실수값을 리턴해줌 범위 0.0<= double < 1.0

		for (int i = 0; i < 1000; i++) {

			int com = (int)(Math.random() * 3) +1;
			String comStr = null;
			
			
			
			
			/*
			switch (com) {
			case 1:
				comStr = "가위";
				break;
			case 2:
				comStr = "바위";
				break;
			case 3:
				comStr = "보";
				break;

			default:
				break;
			}
			
			System.out.printf("%d\n", com);
					
				*/
		}

		//1~3 임의의 정수
		//0 <= int (int)(Math.random() * 3) < 4


	}
}
