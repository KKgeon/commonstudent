package days16;
//static import문
import static java.lang.Math.random;
public class Ex08 {
	public static void main(String[] args) {

		/*
		 * 1. 패키지(package)
		 * 	- 서로 관련있는 클래스 ,인터페이스들의 묶음
		 * 	- 클래스를 효율적으로 관리.
		 * 	예) java.io 패키지
		 * 			input	입력
		 * 			output	출력
		 * 	-days 14.Point
		 * 	-days 15.Point
		 * 	동일한 클래스일지라도 충돌을 막기 위해서 패키지 사용
		 * 
		 * 	예) 다른 개발자가 구현한 클래스명이 
		 * 		또다른 개발자가 구현한 클래스와 이름이 같을지라도
		 * 		충돌을 막고 구분해서 사용할 수 있다.
		 * 
		 * - 도메인명 == 패키지명
		 * 
		 * naver.com
		 * sist.org
		 * - 패키지는 물리적으로는 디렉토리directory(폴더)가 생성
		 * 예)	java.lang.System 클래스
		 * 		java 폴더
		 * 			ㄴ lang 폴더
		 * 				ㄴ System.class 파일
		 * - 클래스를 선언할 때 소스파일의 첫 번째 라인에 package를 선언한다
		 * - 패키지명은 소문자로 작명한다.
		 * - 소스파일에 다른 패키지의 클래스를 사용하려면 import문을 사용해서 클래스가 포함된 패키지명을 적어야된다.
		 * - [클래스의 풀네임(full name)]을 적으세요
		 *   = 패키지명.클래스명
		 * -import문이 없는 경우 ctrl shift o 단축키 자동으로 import문 작성
		 * - import java.io.*;
		 * 			java.io 패키지 안의 모든 것을 import하겠다.
		 *    
		 */
			System.out.println(random());
//			System.out.println(Math.PI);
		
	}//m
}//c
