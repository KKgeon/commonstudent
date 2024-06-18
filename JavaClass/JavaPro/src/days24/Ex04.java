package days24;

public class Ex04 {
	public static void main(String[] args) {

		Button callButton = new Button();
		callButton.setListner(new CallListner());
		callButton.touch();

		Button messageButton = new Button();
		messageButton.setListner(new MessageListner());
		messageButton.touch();

	}//m
}//c

class Button{
	OnClickListener listner;

	public void setListner(OnClickListener listner) {
		this.listner = listner;
	}

	void touch() {
		this.listner.onClick();
	}
	interface OnClickListener {

		void onClick();

	}//onClick
}//c Button

class CallListner implements Button.OnClickListener{

	@Override
	public void onClick() {
		System.out.println("전화를건다");

	}

}
class MessageListner implements Button.OnClickListener{

	@Override
	public void onClick() {
		System.out.println("문자메시지를보낸다");

	}

}