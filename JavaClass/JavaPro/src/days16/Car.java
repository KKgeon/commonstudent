package days16;

public class Car {

	//필드
	String name;
	String gearType;
	int door;
	//결합력이 높은 코딩 =>>좋은코딩 X
	//엔진 객체
	//private Engine engine = new Engine();	// has-a관계
	private Engine engine = null;
	
	//Getter Setter
	public Engine getEngine() {
		return engine;
	}
	public void setEngine(Engine engine) {
		this.engine = engine;
	}
	//생성자
	public Car() {
		engine = new Engine(); // 생성자초기화 //결합력이 높은 코딩
	}
	public Car(Engine engine) {
		this.engine = engine;
	}

	//메서드
	void speedUp(int fuel) {
		//engine객체  -  NullPointerException 예외(에러) 발생.
		//this.engine = new Engine();
		this.engine.moreFuel(fuel);
	}
	void speedDown(int fuel) {
		//this.engine = new Engine();
		this.engine.lessFuel(fuel);
	}
	void stop() {
		this.engine.stop();
	}
}
