package days23;

import java.util.Collections;
import java.util.TreeSet;

public class Ex05_03 {
	public static void main(String[] args) {
//		int [] score = { 80, 95, 50, 85, 45, 65, 10, 100 };
		// 1) 80 보다 큰 점수를 얻어와서 출력

		/*
		for (int i = 0; i < score.length; i++) {
			if( score[i] > 80  ) System.out.println( score[i]);
		}
		 */

		// int []  ->    TreeSet<Integer> 변환
		//[1]

		/*
		TreeSet<Integer> ts = new TreeSet<>();
		for (int i = 0; i < score.length; i++) {
			 ts.add( score[i] );
		}
		 */

		// [2] int []  ->    TreeSet<Integer> 변환

		//Integer [] 변환 -> List<Integer> -> TreeSet<Integer>
		/*
		Integer[] scoreArray = new Integer[]{80,95,50,85,45,65,10,100};
	    TreeSet<Integer> ts = new TreeSet<Integer>(Arrays.asList(scoreArray));
		*/
		/*
		TreeSet<Integer> treeSet = Arrays.stream(score)
                .boxed()
                .collect(TreeSet::new, TreeSet::add, TreeSet::addAll);
		 */ 

		Integer [] score = { 80, 95, 50, 85, 45, 65, 10, 100 };
		TreeSet<Integer> ts = new TreeSet<>();
		Collections.addAll(ts, score);
	

		//     
		// int [] -> IntStream  -> boxed() Stream<Integer>-> collect() List ->  (ArrayList<Integer>)  -> TreeSet<Integer> 변환

		/*
		ArrayList<Integer> list =  (ArrayList<Integer>) Arrays
				.stream(score).boxed().collect(Collectors.toList());
		TreeSet<Integer> ts = new TreeSet<Integer>(list);
		 */


		// 지정된 값보다 작은 값의 객체를 반환하는 메서드
		//ts.headSet(null);

		// 지정된 값보다 큰값의 객체를 반환하는 메서드 
		// System.out.println( ts.tailSet(80) ); // [80, 85, 95, 100]
		// System.out.println( ts.tailSet(80, true) ); // [80, 85, 95, 100]

		System.out.println( ts.tailSet(80, false) ); // [ 85, 95, 100]

	}//m
}//c
