package days16;

import days14.Tv;

public class Ex04 {
	public static void main(String[] args) {
		// 기존 Tv
		// 자막 기능 O + 새로운 Tv 필요
		CationTv ctv = new CationTv();
		
		ctv.channel = 11;
		ctv.channelDown();
		System.out.println(ctv.channel);
		
		ctv.dispCaption("Hello World~");
		ctv.caption = true;
		ctv.dispCaption("Hi~");
		
	}//m
}//c


class CationTv extends Tv{
	//필드
	boolean caption; //자막기능 On(true) Off(false)

	
	//메서드
	void dispCaption (String text) {
		if (this.caption) {
			System.out.println(text);
		}//if
	}
	
}