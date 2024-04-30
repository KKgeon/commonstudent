package days14;

public class Student {

	public Student() {	
		
	}
	


	public Student(String name, int kor, int eng, int mat, int tot, double avg, int rank, int wrank) {
		
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.tot = tot;
		this.avg = avg;
		this.rank = rank;
		this.wrank = wrank;
	}



	//field
	//[인스턴스변수]
	public String name;

	public int kor, eng, mat, tot;
	public double avg;
	public int rank, wrank;

	//Alt+Shift+A
	//method
	public void dispInfo() {
		System.out.printf("%s\t%d\t%d\t%d\t%d\t%.2f\t%d등\t%d등\n",
				name,
				kor,
				eng,
				mat,
				tot,
				avg,
				rank,
				wrank);
	}

}//class
