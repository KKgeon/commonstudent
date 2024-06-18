package tennisScoreView;

public class Question {


	public static void main(String[] args) {
		String []  arr = {"a","b","c"};

		solution(arr);
	}

	public static String solution(String[] arr) {
		String answer = "";
		
		for (int i = 0; i < arr.length; i++) {
			
		answer += arr[i];
		}
		System.out.println(answer);
		return answer;
	}
}
