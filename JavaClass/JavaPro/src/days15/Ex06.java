package days15;

/**
 * @author geon
 * @date 2024. 1. 19. - 오후 2:03:01
 * @subject	다음주 시험문제 3
 * @content
 */
public class Ex06 {
	public static void main(String[] args) {
		/*
		Person p1 = new Person("홍길동", 20);
		p1.dispPerson();
		*/
		
		//Point p1 = new Point();
		Point p1 = new Point(100,200);
		p1.dispPoint();
		
		p1.moveNewPoint(50).dispPoint();
		p1.dispPoint();
		
		
		
		
		/*
		 * [this 키워드]
       * 1. 정의 : 객체 자기 자신의 주소값을 가지는 참조변수
       * 
       * 2. this 세가지 용도
       * 	1)	멤버들을 가리키는 this의 용도
       *  	2)	생성자에서 또 다른 생성자를 호출할 때의 this
       * 	3)	매개변수, 리턴값으로 사용되는 this
       * 
       * 
       * 
       * 
       *    class Point{
       *      int x;
       *      int y;
       *      
       *      public Point(int x, int y){
       *        x = x;
       *        y = y;
       *      }
       *      
       *      public void dispPoint(){
       *        syso("x,y");
       *      }
       *    }
       *    
       *    Point p1 = new Point(1,2);
       *    Point p2 = new Point(1,2);
       *    
       *    Heap
       *    0x500
       *    [1][2][100][0x500]
       *     x y        this                            Stack
       *                                               [0x500]
       *                                                 p2
       *                                                 
       *    0x200
       *    [1][2][100][0x200]
       *     x y        this                            Stack
       *                                               [0x200]
       *                                                 p1
       *    
       *    
       *    p1.dispPoint()
       *    p2.dispPoint()
       *    
       *    Method
       *     [100]
       *     dispPoint(){
       *        %d, %d this.x, this.y  
       *     }
       * */ 
	}//m
}//c
