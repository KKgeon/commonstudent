package days17;

public class Car {

	//필드
	String name;
	String gearType;
	int door;
	//		인터페이스 (	다형성	)
	private Engine engine = null;
	
	//Getter Setter
	public Engine getEngine() {
		return engine;
	}
	
	//						H,S,K_Engine 매개변수 다형성
	public void setEngine(Engine engine) {
		this.engine = engine;
	}
	//생성자
	public Car() {
	
	}
	//						H,S,K_Engine 매개변수 다형성
	public Car(Engine engine) {
		this.engine = engine;
	}

	//메서드
	void speedUp(int fuel) {
		this.engine.moreFuel(fuel);
	}
	void speedDown(int fuel) {
		this.engine.lessFuel(fuel);
	}
	void stop() {
		this.engine.stop();
	}
}
