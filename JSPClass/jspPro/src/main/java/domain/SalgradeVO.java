package domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SalgradeVO {
	private int grade;
	private int losal;
	private int hisal;
	
	private int cnt;

	@Override
	public String toString() {
		return "SalgradeVO [grade=" + grade + ", losal=" + losal + ", hisal=" + hisal + ", cnt=" + cnt + ", getGrade()="
				+ getGrade() + ", getLosal()=" + getLosal() + ", getHisal()=" + getHisal() + ", getCnt()=" + getCnt()
				+ "]";
	}
}//c
