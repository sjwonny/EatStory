package dao.users;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.users.UsersVO;

public class UsersDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int checkLogin(UsersVO vo) {

		int no = 0;

		try {
			no = sqlSession.selectOne("users.checkLogin", vo);
		} catch (NullPointerException e) {
			e.printStackTrace();
		}

		return no;
	}

	public String findId(UsersVO vo) {
		return sqlSession.selectOne("users.findId", vo);
	}

	public String findPw(UsersVO vo) {
		return sqlSession.selectOne("users.findPw", vo);
	}

	public int insert(UsersVO vo) {
		return sqlSession.insert("users.insert", vo);
	}

	public UsersVO selectOne(int no) {
		return sqlSession.selectOne("users.selectOne", no);
	}

	public int update(UsersVO vo) {
		return sqlSession.update("users.update", vo);
	}

	public int delete(int no) {
		return sqlSession.delete("users.delete", no);
	}

	public String checkId(String id) {
		return sqlSession.selectOne("users.checkId", id);
	}

	public String checkEmail(String email) {
		return sqlSession.selectOne("users.checkEmail", email);
	}

	public String checkPhone(String phone) {
		return sqlSession.selectOne("users.checkPhone", phone);
	}

	public UsersVO selectByEmail(String email) {
		return sqlSession.selectOne("users.selectByEmail", email);
	}

	public int updatePw(String id, String pw) {
		Map<String, String> parameterMap = new HashMap<String, String>();
		parameterMap.put("id", id);
		parameterMap.put("pw", pw);
		return sqlSession.update("users.updatePw", parameterMap);
	}

}
