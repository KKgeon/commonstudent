package days14;

public class StudentManagement {


	//등수 처리 메서드
	public static void procRank(Student[] students, int count) {
		for (int i = 0; i < count; i++) {
			//			students[i].tot;
			students[i].rank = 1;
			for (int j = 0; j < count; j++) {
				if (students[i].tot < students[j].tot) {
					students[i].rank++;

				}

			}
		}

	}
}//c
