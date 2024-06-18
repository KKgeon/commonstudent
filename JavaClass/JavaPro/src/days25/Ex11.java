package days25;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.SequenceInputStream;
import java.util.Enumeration;
import java.util.Vector;

/**
 * @author geon
 * @date 2024. 2. 2. - 오후 3:37:57
 * @subject	Sequence[InputStream]
 * @content			순차적 + 입력용 바이트 스트림
 * 					ㄴ하나의 파일 용량이 너무 커서 여러개의 파일로 분리했다고 가정하면 
 * 					그 분리된 파일을 여러개의 입력스트림으로 만들고 연속적으로 그 입력스트림을 연결해서
 * 					하나의 스트림처럼 데이터를 처리할 수 잇는 바이트 스트림.
 * 
 * 					a.dat
 * 						a_1.dat -> Stream
 * 						a_2.dat	-> Stream
 * 						a_3.dat	-> Stream
 * 						   :
 * 						   :
 */
public class Ex11 {
	public static void main(String[] args) throws IOException {

		byte [] a = {1,2,3};
		byte [] b = {4,5,6};
		byte [] c = {7,8,9};
		
		
		//byte [] -> ByteArrayInputStream 메모리스트림
		ByteArrayInputStream a_bis = new ByteArrayInputStream(a);
		ByteArrayInputStream b_bis = new ByteArrayInputStream(b);
		ByteArrayInputStream c_bis = new ByteArrayInputStream(c);
		
		
		/*[1] a~b 처리 후 c 처리하겠다
		//Sequence[InputStream] 사용 : a_bis, b_bis, c_bis
		SequenceInputStream sis1 = new SequenceInputStream(a_bis, b_bis);
		SequenceInputStream sis2 = new SequenceInputStream(sis1, c_bis);
		*/
		
		
		//[2] 처리하는 순서 a_bis, b_bis, c_bis
		// List 구현한 클래스 ArrayList, Vector
		Vector<ByteArrayInputStream> v = new Vector<>();
		
		v.add(a_bis);
		v.add(b_bis);
		v.add(c_bis);
		
		Enumeration<ByteArrayInputStream> en = v.elements();
		SequenceInputStream sis = new SequenceInputStream(en);
		
		int code;
		while ((code = sis.read()) != -1) {
			System.out.println(code);
			
		}
	}//m
}//c
