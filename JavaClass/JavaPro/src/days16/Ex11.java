package days16;

public class Ex11 {
	public static void main(String[] args) {
		//[다형성]
		// - "여러가지 형태를 가질 수 있는 능력"
		// E e1 = new R();
		// E e2 = new S();
		// E e3 = new T();
		
		/*
		Regular emp1 = new Regular("주강민", "서울 양천구"
	             , "010-3123-2311", "2021.03.21", 4000000);
	      SalesMan emp2 = new SalesMan(
	            "임경재", "경기도 성남시"
	            , "010-9837-2342", "2021.03.12"
	            , 500000BB
	            , 20, 70000);
	      Temp emp3 =  new Temp("박정호", "서울 목동", "010-2319-3422"
	            , "2020.01.01", 20, 250000);
	      
	      // 급여 계산
	      emp1.getPay();
	      emp2.getPay();
	      emp3.getPay();
	      */
		
		Employee [] emps = {
				new Regular("주강민", "서울 양천구"
			             , "010-3123-2311", "2021.03.21", 4000000),
				new SalesMan(
			            "임경재", "경기도 성남시"
			            , "010-9837-2342", "2021.03.12"
			            , 500000
			            , 20, 70000),
				new Temp("박정호", "서울 목동", "010-2319-3422"
			            , "2020.01.01", 20, 250000)
		};
		
		for (int i = 0; i < emps.length; i++) {
			emps[i].getPay();
		}
		
	}//m


}//c
