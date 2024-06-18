package days15;

public class Person {
	//field
	private String name;
	private int age;
	private boolean gender;
	//은닉화 예시


	//constructor
	public Person() {}
	public Person(String n, int age) {
		this.name = name;
		//The assignment to variable age has no effect
		this.age=age;
	}

	//getter, setter
	public void setAge(int a) {
		if (age >= 0 && age <= 125) {
			this.age=age;      
		} else {
			System.out.println("나이의 범위가 벗어났다.");
		}
	}


	public int getAge() {
		return this.age;
		

	}
	public void dispPerson() {
		System.out.printf(">이름 %s 나이 %d", this.name,this.age);
	}
}
