package dao.cart;

import org.apache.ibatis.session.SqlSession;

import vo.cart.CartVO;

public class CartDAO {

	private SqlSession sqlSession;

	public CartDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insertCart(CartVO vo) {
		return sqlSession.insert("cart.insertCart", vo);
	}

	public int checkCart(CartVO vo) {
		return sqlSession.selectOne("cart.checkCart", vo);
	}

	public int addCartQuantity(int quantity) {
		return sqlSession.update("cart.addCartQuantity", quantity);
	}

	public int updateCartQuantity(CartVO vo) {
		return sqlSession.update("cart.updateCartQuantity", vo);
	}

	public int deleteCart(int cartNo) {
		return sqlSession.delete("cart.deleteCart", cartNo);
	}

}
