package dao.manager;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.goods.GoodsVO;
import vo.goods_detail_img.GoodsDetailImgVO;
import vo.goods_img.GoodsImgVO;
import vo.goods_option.GoodsOptionVO;
import vo.manager.brand.BrandVO;
import vo.manager.manager.ManagerVO;
import vo.qna.QnaVO;

public class ManagerDAO {
	private SqlSession sqlSession;

	public ManagerDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public ManagerVO checkLogin(ManagerVO vo) {
		return sqlSession.selectOne("manager.checkLogin", vo);
	}

	public List<QnaVO> selectQnaList() {
		return sqlSession.selectList("manager.selectQnaList");
	}

	public List<String> selectQnaImage(int no) {
		return sqlSession.selectList("manager.selectQnaImage", no);
	}

	public QnaVO selectQnaDetail(int no) {
		return sqlSession.selectOne("manager.selectQnaDetail", no);
	}

	public boolean updateAnswer(QnaVO vo) {
		if (sqlSession.update("manager.updateAnswer", vo) == 0) {
			return false;
		}
		return true;
	}
	
	public int deleteAnswer(int no) {
		return sqlSession.update("manager.deleteAnswer", no);
	}
	
	public List<BrandVO> selectBrandList() {
		return sqlSession.selectList("manager.selectBrandList");
	}
	
	public int selectBrandNo() {
		return sqlSession.selectOne("manager.selectBrandNo");
	}
	
	public int insertBrand(BrandVO vo) {
		return sqlSession.insert("manager.insertBrand", vo);
	}
	
	public int selectGoodsNo() {
		return sqlSession.selectOne("manager.selectGoodsNo");
	}
	
	public int insertGoods(GoodsVO vo) {
		return sqlSession.insert("manager.insertGoods", vo);
	}
	
	public List<GoodsVO> selectGoods() {
		return sqlSession.selectList("manager.selectGoods");
	}

	public int insertGoodsOption(GoodsOptionVO vo) {
		return sqlSession.insert("manager.insertGoodsOption", vo);
	}
	
	public GoodsVO selectGoodsVo(int no) {
		return sqlSession.selectOne("manager.selectGoodsVo", no);
	}
	
	public List<GoodsOptionVO> selectGoodsOptionVo(int no) {
		return sqlSession.selectList("manager.selectGoodsOptionVo", no);
	}
	
	public void updateGoods(GoodsVO vo) {
		sqlSession.update("manager.updateGoods", vo);
	}
	
	public List<Integer> selectGoodsOptionList(int no) {
		return sqlSession.selectList("manager.selectGoodsOptionList", no);
	}
	
	public void updateGoodsOption(GoodsOptionVO vo) {
		sqlSession.update("manager.updateGoodsOption", vo);
	}
	
	public void deleteGoodsOption(int no) {
		sqlSession.delete("manager.deleteGoodsOption", no);
	}
	
	public void insertGoodsImg(GoodsImgVO vo) {
		sqlSession.insert("manager.insertGoodsImg", vo);
	}
	
	public void insertGoodsDetailImg(GoodsDetailImgVO vo) {
		sqlSession.insert("manager.insertGoodsDetailImg", vo);
	}
	
	public List<GoodsImgVO> selectGoodsImg(int no) {
		return sqlSession.selectList("manager.selectGoodsImg", no);
	}
	
	public List<GoodsDetailImgVO> selectGoodsDetailImg(int no) {
		return sqlSession.selectList("manager.selectGoodsDetailImg", no);
	}
	
	public void deleteGoodsImg(GoodsImgVO vo) {
		sqlSession.delete("manager.deleteGoodsImg", vo);
	}
	
	public void deleteGoodsDetailImg(GoodsDetailImgVO vo) {
		sqlSession.delete("manager.deleteGoodsDetailImg", vo);
	}
	
	public int selectGoodsImgSeq(int no) {
		return sqlSession.selectOne("manager.selectGoodsImgSeq", no);
	}
	
	public int selectGoodsDetailImgSeq(int no) {
		return sqlSession.selectOne("manager.selectGoodsDetailImgSeq", no);
	}
}
