package days07;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//인증받은 사용자 정보를 저장하는 클래스
public class AuthInfo {

	private String id;
	private String name;
	private String authority; //권한
}
