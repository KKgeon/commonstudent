package days26;

import java.io.File;

public class Ex02_06 {
	public static void main(String[] args) {
		String pathname = ".\\src\\days26\\temp";
		File p = new File(pathname);
		
		if (p.exists()) {
			//delete() 메서드는 하위 디렉토리가 없어야 삭제가 될 수 있다.
			System.out.println(  p.delete());
			directoryDelete(p);
		} 
		
		System.out.println("end");
	}//m
	private static void directoryDelete( File f ) {
	      // f 삭제되지 않았을 경우 while 반복
	      while (  !f.delete() ) {  // true, false
	         
	          File[] list =   f.listFiles();
	          for (int i = 0; i < list.length; i++) {   
	             if (list[i].delete()) {
	               System.out.printf("%s  삭제 완료!!!\n", list[i] );
	            } else {
	               directoryDelete( list[i] );
	            } // if
	          } //
	         
	      } // while
	   }
}//c
