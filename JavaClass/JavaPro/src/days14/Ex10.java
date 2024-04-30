package days14;

public class Ex10 {
	public static void main(String[] args) {
		Ex10 obj = new Ex10();
		
		//메서드(기본형 매개변수, 참조형 매개변수)
		//[리턴자료형이 참조형(배열)인 경우~]
		int [] m = new int [3];
		m =	obj.increasArrays(m);

		System.out.println(m.length);

	}//m

	private int[] increasArrays(int[] m) {
		int [] temp = new int[m.length+3];
		return temp;
		//이때 함수안의 배열m이 지역변수라서 메인쪽을 참조하지 않아서 오류떨어진걸 해결하는 코딩함
	}//iA
}//c
