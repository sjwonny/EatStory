package dao.ingre;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ingre.IngreVO;

public class IngreDAO {
	private SqlSession sqlSession;
	
	public IngreDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<IngreVO> selectList() {
		return sqlSession.selectList("ingre.selectList");
	}
}
