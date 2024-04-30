package days25;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.lang.reflect.Array;
import java.util.Arrays;

/**
 * @author geon
 * @date 2024. 2. 2. - 오후 2:18:01
 * @subject	-주로 다른 곳에 입출력하기전에
 * 메모리상에 데이터로 임시로 저장할 목적으로
 * 사용하는 스트림
 * @content
 */
public class Ex07 {
	public static void main(String[] args) {
		byte [] buf =  {0,1,2,3,4,5,6,7,8,9};

		try(ByteArrayInputStream bis = new  ByteArrayInputStream(buf);
				ByteArrayOutputStream bos = new ByteArrayOutputStream();) {
			int code;		
			while ((code=bis.read()) != -1) {
				//System.out.println(code);
				bos.write(code);
			}//while

			//buf[]-> bis 메모리스트림 -> bos 스트림 -> 출력 -> outpuf[] -> 출력확인

			byte [] outbuf = bos.toByteArray();

			System.out.println(Arrays.toString(outbuf));

			System.out.println("end");
		} catch (Exception e) {
			e.printStackTrace();
		}



	}//m
}//c
