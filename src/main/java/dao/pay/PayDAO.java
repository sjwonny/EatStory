package dao.pay;

import org.apache.ibatis.session.SqlSession;

public class PayDAO {
	private SqlSession sqlSession;

	public PayDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
