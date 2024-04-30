package days24;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//[Value Object] ==  값을 저장할 용도의 객체
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
@Builder

public class MemberVO {
	private String name;
	private String position;
}
