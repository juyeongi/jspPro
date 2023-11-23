package member.persistence;

import java.sql.SQLException;
import java.util.ArrayList;

import days04.board.domain.BoardDTO;
import days05.MemberInfo;

public interface MemberDAO {

	int join(MemberInfo info) throws SQLException;

	// 비밀번호 확인
	/* String getOriginalPwd(int seq) throws SQLException; */
}
