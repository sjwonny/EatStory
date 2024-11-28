package dao.goods;

import java.util.List;


import org.apache.ibatis.session.SqlSession;

import vo.goods.GoodsVO;
import vo.goods.goods.goodsVO;
import vo.goods_detail_img.GoodsDetailImgVO;
import vo.goods_img.GoodsImgVO;
import vo.goods_option.GoodsOptionVO;
import vo.review.ReviewVO;


public class GoodsDAO {
	private SqlSession sqlSession;

	public GoodsDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<GoodsVO> selectGoods() {
		return sqlSession.selectList("goods.selectGoods");
	}

	public int selectCount() {
		return sqlSession.selectOne("goods.selectCount");
	}

	public int selectGoodsNo() {
		return sqlSession.selectOne("goods.selectGoodsNo");
	}

	public GoodsVO selectGoodsDetail(int no) {
		return sqlSession.selectOne("goods.selectGoodsDetail", no);
	}

	public List<GoodsImgVO> selectGoodsImgList(int no) {
		return sqlSession.selectList("goods.selectGoodsImgList", no);
	}

	public List<GoodsDetailImgVO> selectGoodsDetailImgList(int no) {
		return sqlSession.selectList("goods.selectGoodsDetailImgList", no);
	}

	public List<GoodsOptionVO> selectGoodsOption(int no) {
		return sqlSession.selectList("goods.selectGoodsOption", no);
	}

	public int detailImageCount(int no) {
		return sqlSession.selectOne("goods.detailImageCount", no);
	}

	public int insertWish(int optionNo) {
		return sqlSession.insert("goods.insertWish", optionNo);
	}

	public List<GoodsVO> selectWish(int usersNo) {
		return sqlSession.selectList("goods.selectWish", usersNo);
	}

	public List<GoodsVO> selectCart(int usersNo) {
		return sqlSession.selectList("goods.selectCart", usersNo);
	}

	public int deleteWish(int wishNo) {
		return sqlSession.delete("wish.deleteWish", wishNo);
	}

	public int deleteCart(int cartNo) {
		return sqlSession.delete("cart.deleteCart", cartNo);
	}

	public List<GoodsVO> purchaseCart(int cartNo) {
		return sqlSession.selectList("goods.purchaseCart", cartNo);
	}

	public List<goodsVO> selectGoodsList(int no) {
		return sqlSession.selectList("goods.selectGoodsList", no);
	}
	public List<ReviewVO> selectReviewList(int no){
		return sqlSession.selectList("review.selectReviewList",no);
	}
	
}
