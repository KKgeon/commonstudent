package days16;
//[정규직] 사원클래스
public class Regular extends Employee {

	//[Object] 멤버들도 상속
	//[Employee] 멤버들도 상속
	//필드 - name, addr, tel, hiredate
	//생성자는 상속되지 않는다. X
	//메서드 - dispEmpInfo(), @toString()
	private int basePay; //기본급

	//생성자


	public Regular() {
		super(); // 생성자에서 부모의 생성자를 호출할 때의 super 키워드
		System.out.println("> Regular 디폴트 생성자 호출됨.");
	}

	public Regular(String name, String addr, String tel, String hiredate, int basePay) {
		//The field Employee.name is not visible
		//		this.name= name;
		super(name, addr, tel, hiredate);
		this.basePay = basePay;
		System.out.println("> Regular 5 생성자 호출됨.");
	}


	//Getter, Setter
	public int getBasePay() {
		return basePay;
	}

	public void setBasePay(int basePay) {
		this.basePay = basePay;
	}

	@Override
	public void dispEmpInfo() {

		/*
		super.dispEmpInfo();
		System.out.printf(", 기본급:%d\n", this.basePay);
		 */
		System.out.printf("사원명:%s, 주소:%s, 연락처:%s, 입사일자:%s, 기본급 : %d", this.getName(), this.getAddr(), this.getTel(), this.getHiredate(), this.basePay);
	}

	@Override
	public String toString() {

		return super.toString() + "Regular [basePay=" + basePay + "]";


	}



	
	//급여 계산 메서드
	@Override
	public int getPay() {
		return this.basePay;

	}




}//c
