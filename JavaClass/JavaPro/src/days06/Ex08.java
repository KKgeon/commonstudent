package days06;

public class Ex08 {

	public static void main(String[] args) {
		//LG공채시험 3번째문제
		//[이름 (lable)] 붙은 반복문
		// break 라벨명;
		// continue 라벨명;
		// for문에도 이름을 붙일 수 있다
		// 브레이크 컨티뉴 명령어를 통해 for문을 바로 빠져나가거나 바로 들어갈 수 있다.
		OUT:for (int i = 2; i <= 9; i++) {
			IN:for (int j = 1; j <= 9; j++) {
				System.out.printf("%d*%d=%02d ", i, j, i*j);
				if (i*j == 24) break OUT;		}
			System.out.println();
		}
	}//m

}//c
