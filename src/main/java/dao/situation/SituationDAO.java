package dao.situation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.situation.SituationVO;

public class SituationDAO {
	private SqlSession sqlSession;
	
	public SituationDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<SituationVO> selectList() {
		return sqlSession.selectList("situation.selectList");
	}
}
