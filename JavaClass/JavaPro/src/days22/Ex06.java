package days22;

import java.util.Stack;

public class Ex06 {
	public static void main(String[] args) {
		//[스택(Stack) 구조와 큐(Queue)구조]
		//[스택(Stack) 구조]
		//LIFO last input first output
		
		//
		//
		//
		
		//Stack -> Vector -> List
		Stack s = new Stack();
		
		s.push("권맑음");
		s.push("이동찬");
		s.push("김영진");
		/*
		System.out.println(s.pop());
		System.out.println(s.pop());
		System.out.println(s.pop());
		*/
		/*
		while (s.empty()) {
			System.out.println(s.pop());
		}
		*/
		
		System.out.println(s.search("홍길동")); //-1
		
	}//m
}//c
