package days22;

import java.util.PriorityQueue;
import java.util.Queue;

/**
 * @author geon
 * @date 2024. 1. 30. - 오후 12:36:58
 * @subject
 * @content
 */
public class Ex08 {
	public static void main(String[] args) {
		// List - ArrayList, Vector, LinkedList, Stack(LIFO), Queue(FIFO)
		// Set 	-
		// Map	-

		// [PriorityQueue] 컬렉션 클래스
		//	우선순위 + Queue
		//	우선순위 높은 것부터 꺼내오는 큐
		Queue q = new PriorityQueue();
		q.offer(3);
		q.offer(5);
		q.offer(2);
		q.offer(4);
		q.offer(1);

		System.out.println(q);

		while (!q.isEmpty()) {
			System.out.println(q.poll());	
		}//while
	}//m
}//c
