package days17;

/**
 * @author kenik
 * @date 2024. 1. 23. - 오후 2:49:30
 * @subject
 * @content
 */
public class Ex11 {

	public static void main(String[] args) {
		
		//     구문분석
		String parsingFile = "hello.html";
		String docType = "html";
		
		// 3:02 수업 시작~ 
		Parseable parser = ParserManager.getParser(docType);
		parser.parse(parsingFile);
		
		System.out.println("end");

	} // main

} // class

interface Parseable{
	void parse(String fileName);
	default  void print() {
		System.out.println("각각 parser에서 인쇄기능 구현..");
	}
}

// XML파일을 구문분석하는 클래스
class XMLParser implements Parseable{

	@Override
	public void parse(String fileName) { 
		System.out.println("> XML파일 구문 분석 코딩...."); 
	}
	
}

// HTML파일을 구문분석하는 클래스
class HTMLParser implements Parseable{

	@Override
	public void parse(String fileName) { 
		System.out.println("> HTML파일 구문 분석 코딩...."); 
	}
	
}

// Xml파일 -> XmlParser
// Html파일 -> HtmlParser
class ParserManager{
	
	//            리턴자료형  인터페이스 다형성
	public static Parseable getParser(String docType) {
		if (docType.equals("xml")) {
			return new XMLParser();
		} else if( docType.equals("html")){
			return new HTMLParser();
		} else {
			return null;
		}
	}
}







