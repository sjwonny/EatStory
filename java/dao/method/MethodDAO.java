package dao.method;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.method.MethodVO;

public class MethodDAO {
	private SqlSession sqlSession;
	
	public MethodDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<MethodVO> selectList() {
		return sqlSession.selectList("method.selectList");
	}
}
