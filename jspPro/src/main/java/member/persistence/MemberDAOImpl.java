package member.persistence;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days05.MemberInfo;
import domain.EmpVO;
import domain.SalgradeVO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@NoArgsConstructor
@Setter
@Getter
@AllArgsConstructor
public class MemberDAOImpl implements MemberDAO {
	
	private Connection conn = null;
//	private PreparedStatement pstmt = null;
	
	@Override
	public int join(MemberInfo info) throws SQLException {
		int rowCount = 0;
		String sql = "INSERT INTO member (id, passwd, name, email ) VALUES ( ?, ?, ?, ?)";

		PreparedStatement pstmt = null;

		try {
			pstmt = this.conn.prepareStatement(sql); 
			pstmt.setString(1,  info.getId() );
			pstmt.setString(2,  info.getPasswd() );
			pstmt.setString(3,  info.getName() );
			pstmt.setString(4,  info.getEmail() );
		
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
		}

			return rowCount;
	}

}
