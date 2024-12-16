package dao.wish;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.wish.WishVO;

public class WishDAO {

	private SqlSession sqlSession;

	public WishDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Map<String, Object>> printWish(int users_no) {
		return sqlSession.selectList("wish.printWish",users_no);
	}

	
	 public int deleteWishList(int no) { 
        return sqlSession.delete("wish.deleteWishList",no); 
	 }
	 
	
	
	  public int insertWish(WishVO vo) { return
	  sqlSession.insert("wish.insertWish", vo); }
	
	public int checkWishList(WishVO vo) {
		return sqlSession.selectOne("wish.checkWishList",vo);
	}
}
