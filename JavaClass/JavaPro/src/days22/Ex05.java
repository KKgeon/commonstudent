package days22;

public class Ex05 {

	public static void main(String[] args) {

		//[LinkesList 컬렉션 클래스]
		//사슬(고리) 연결된 +List
		
		//		단방향 링크드리스트
		//		더블(양방향)링크드리스트
		//	[참조변수]-[]-[노드]-[노드]-[노드]-[]-[]
		//		주소
		// 1) 배열
		//		(1) 장점 = 읽기 성능이 가장 빠르다.
		//		(2) 단점 = 배열크기x, 삽입 & 삭제 무지속도느림
		
		// 2) 링크드리스트
		//	(1)특징-비연속적, 삽입&삭제 성능 빠르다.
		
		Node node1 = new Node();
		node1.value = 10;
		
		Node node2 = new Node();
		node2.value = 20;
		
		Node node3 = new Node();
		node3.value = 30;
		
		Node node4 = new Node();
		node4.value = 40;
		
		Node node5 = new Node();
		node5.value = 50;
		
		node1.next = node2;
		node2.next = node3;
		node3.next = node4;
		node4.next = node5;
		node5.next=null;
		
		// 모든 노드들의 value 출력.
		Node node = node1;
		while (node != null) {
			System.out.println(node.value);
			node = node.next;
		}
		
		
	}//m
}//c

class Node {
	int value; //값
	
	//다음 노드를 참조할 수 있는 참조변수
	Node next=null;
	Node prev=null;
	
	
}