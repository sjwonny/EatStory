package dao.order_item;

import org.apache.ibatis.session.SqlSession;

public class Order_itemDAO {
	private SqlSession sqlSession;

	public Order_itemDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
