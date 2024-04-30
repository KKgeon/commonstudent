package days09;

public class Ex07 {
	public static void main(String[] args) {
		//[주민등록번호]
		//1. 생년월일
		//2. 성별
		//3. 내국인/외국인
		//4. 출신지역
		//5. 나이
		//6. 검증


		//요구분석이 코딩에 들어가는것보다 더 중요하다.


		String rrn = "930821-1000003";
		//주민등록번호에서 생년월일을 가져오기
		// "1993년 8월 21일"
		String birthday = getBirth(rrn);
		System.out.println(birthday);
	}//m
	//기능 : 주민등록번호로 부터 성별 얻어오는 기능
	//매개변수 : 주민등록번호
	//리턴값(리턴자료형) : 남/여 1/2/G(정수)
	
	private static int getGender(String rrn) {
		return rrn.charAt(7) - 48;
		
	}
	

	private static String getBirth(String rrn) {
		int year = Integer.parseInt(rrn.substring(0,2));
		int month = Integer.parseInt(rrn.substring(2,4));
		int day = Integer.parseInt(rrn.substring(4,6));
		
		//9,0 1800
		//1,2,5,6 1900
		//3,4,7,8 2000
		switch (getGender(rrn)) {
		
		case 9: case 0:
			year += 1800;			
			break;
		case 1: case 2: case 5: case 6:
			year += 1900;			
			break;
		case 3: case 4: case 7: case 8: 	
			year += 2000;	
			break;
		}
		String birthday = String.format("%d년 %d월 %d일", year, month, day);
		//안되길래 왜 안되나 봤더니 이새끼가 38번 라인에 가있어가지고 스위치문의 year값을 못받고있었음. 그래서 year값 플러스되기 전의 값만 출력되는거였음ㅋㅋ
		//내가 착각한건 getGender함수를 굳이 gender에 담지않아도 되는건데 그거때문에 안되나생각하고있었음
		return birthday;


	}
}
