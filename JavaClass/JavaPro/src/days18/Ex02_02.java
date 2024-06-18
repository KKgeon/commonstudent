package days18;

/**
 * @author geon
 * @date 2024. 1. 24. - 오전 11:05:39
 * @subject Object. 메서드
 * @content
 */
public class Ex02_02 {
	public static void main(String[] args) {

		//현실에서는 주민번호가 같으면 같은사람이다.
		Person p1 = new Person("234", "김길동");
		Person p2 = new Person("111", "홍길동");
		
		//[ Thread method] <-안배울예정이라안함

		//The method clone() from the type Object is not visible
		//Object.clone();
		try {

			//			Person p1Clone = (Person) p1.clone();
			Person p1Clone = p1.clone();// 다운캐스팅 할 필요가 없다.
			System.out.println(p1Clone);
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}




		/*
		// [ Object toString() ]
		// "객체의 풀네임@hashcode()의 16진수값"
		System.out.println(p1.toString()); //days18.Person@73a28541 <- 클래스 해시코드의 16진수값
		System.out.println(p2);
		 */

		//		System.out.println(Integer.toHexString(1940030785));


		/*
		System.out.println(p1.hashCode());	//1940030785
		System.out.println(p2.hashCode());	//1869997857
		 */

		/*[Object.getClass()]
		//제네릭<> ???아직안배움
		//Class<? extends Person> cls = p1.getClass();
		Class cls = p1.getClass();
		String fullName =  cls.getName();
		System.out.println(fullName);					//days18.Person <- 이걸 풀네임이라고 함. 클래스 이름만 적으면 안되고 패키지이름.클래스이름 적어야 풀네임.
		String packageName = cls.getPackageName();
		System.out.println(packageName);				//days18
		String className = cls.getSimpleName();
		System.out.println(className);					//Person
		 */

	}//m
}//c


class Person implements Cloneable{
	String rrn;
	String name;

	public Person( String rrn, String name) {
		super();
		this.name = name;
		this.rrn = rrn;
	}
	//지금까지 우리는 일일히 disp()메서드를 만들어 사용했다 (공부목적으로) 이젠 안한다.
	//왜 안하냐? toSring()을 오버라이딩해서 쓰면 되니까
	//객체의 정보를 출력하는 용도

	@Override
	public String toString() {
		//		return "Person [rrn=" + rrn + ", name=" + name + "]";
		return String.format("> 주민번호:%s, 이름:%s", rrn, name);
	}


	// Person pclone = p1.clone();
	// 얕은복제가 되어서 오류(예외)발생
	// 깊은 복제?

	/*
	@Override
	protected Object clone() throws CloneNotSupportedException {
		Person pclone = null;
		pclone = (Person) super.clone();
		return pclone;
	}
	 */
	//JDK1.5 공변반환타입 추가
	//Object 클래스의 clone() 메서드를 오버라이딩했기때문에
	//리턴타입은 Object여야 되지만 재정의하는 자식클래스의
	//타입으로 변경이 가능하도록 문법이 추가!

	@Override
	protected Person clone() throws CloneNotSupportedException {
		Person pclone = null;
		pclone = (Person) super.clone();
		return pclone;
	}


	/*
	@Override
	protected Person clone() {
		Person pclone = null;
		try{
			pclone = (Person) super.clone();
		} catch(CloneNotSupportedException e){
		}
		return pclone;
	}
	 */

}//c