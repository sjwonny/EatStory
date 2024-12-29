package dao.orderlist;

import org.apache.ibatis.session.SqlSession;

import vo.goods.GoodsVO;

public class OrderListDAO {
	
	private SqlSession sqlSession;
	
	public OrderListDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
//	public int insertOrderList(GoodsVO vo) {
//		return sqlSession.insert("order.insertOrderList", vo);
//	}
	
	
}
