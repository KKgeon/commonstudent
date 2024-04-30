package days05;

/**
 * @author geon
 * @date 2024. 1. 5. - 오전 11:26:37
 * @subject
 * @content
 */
public class Ex02_03 {

	public static void main(String[] args) {

		// 함수(메서드)를 빠져나갈 때에는 return문
		// 제어문을 빠져나갈때에는		break문

		int kor = 60;

		switch ( kor / 10 ) {
		//jdk 14부터는 case 10, 9: 식으로 표현 가능하지만 그 이전버전은 불가
		case 10:
		case 9:
			System.out.println("수");
			break;			
		case 8:
			System.out.println("우");
			break;
		case 7:
			System.out.println("미");
			break;
		case 6:
			System.out.println("양");
			break;
		default:
			System.out.println("가");

		}

	}

}
