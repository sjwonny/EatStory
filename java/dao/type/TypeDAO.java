package dao.type;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.type.TypeVO;

public class TypeDAO {
	private SqlSession sqlSession;
	
	public TypeDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<TypeVO> selectList() {
		List<TypeVO> list = sqlSession.selectList("type.selectList");
		return list;
	}
}
