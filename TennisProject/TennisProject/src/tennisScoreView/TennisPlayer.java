package tennisScoreView;

public class TennisPlayer {
	String name;
	boolean gender;
	
	
	
	
	
	public TennisPlayer() {
		super();
	
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isGender() {
		return gender;
	}
	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public TennisPlayer(String name, boolean gender) {
		super();
		this.name = name;
		this.gender = gender;

	}
	@Override
	public String toString() {
		return "TennisPlayer [name=" + name + ", gender=" + gender + "]";
	}
	
	
	
}
