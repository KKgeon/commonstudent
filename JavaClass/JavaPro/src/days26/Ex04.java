package days26;

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class Ex04 {
	public static void main(String[] args) {
		//[직렬화]		객체->스트림
		//[역직렬화]		스트림->객체
		//객체를 직렬화해서 읽기/쓰기 할수 있는 바이트 스트림
		//ObjectInputStream	ObjectOutputStream
		//클래스를 직렬화할수있으려면 Serializable 인터페이스를 구현한 하면 된다.


		// *** 상속관계 - 직렬화 ***
		// 1) 부모는 직렬화할수있는 implements Serializable 구현한 클래스
		//		자식은 Serializble 구현하지 않은 클래스

		//자식은 구현하지 않아도 구현됨 상속받음
		//  부모 : inplements Serializable X
		//  자식 : inplements Serializable O
		//		(결과 : 부모의 멤버는 직렬화 대상에서 제외되더라)
		//	(	부모 멤버도 직렬화 대상이 되도록 처리)

		Child c = new Child();
		c.name="홍길동";
		c.age=20;

		String name = ".\\src\\days26\\Child.ser";	

		try (FileOutputStream fos = new FileOutputStream(name);
				ObjectOutputStream oos = new ObjectOutputStream(fos)){

			oos.writeObject(c);
			oos.flush();

			System.out.println(">c 객체를 직렬화시켜서 oos파일로 저장 완료.");



		} catch (Exception e) {
			e.printStackTrace();
		}
	}//m
}//c
class Parent{
	String name;

}
class Child extends Parent  implements Serializable{
	int age;
}
/*	//[1]
class Parent implements Serializable{
	String name;

}
class Child extends Parent{
	int age;
}
 */