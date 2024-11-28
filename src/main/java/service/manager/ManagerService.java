package service.manager;

import java.util.List;

import dao.manager.ManagerDAO;
import vo.goods.GoodsVO;
import vo.goods_detail_img.GoodsDetailImgVO;
import vo.goods_img.GoodsImgVO;
import vo.goods_option.GoodsOptionVO;
import vo.manager.brand.BrandVO;
import vo.manager.manager.ManagerVO;
import vo.qna.QnaVO;

public class ManagerService {
	private ManagerDAO managerDao;
	
	public ManagerService(ManagerDAO managerDao) {
		this.managerDao = managerDao;
	}
	
	public ManagerVO checkLogin(ManagerVO vo) {
		return managerDao.checkLogin(vo);
	}
	
	public List<QnaVO> selectQnaList() {
		return managerDao.selectQnaList();
	}
	
	public List<String> selectQnaImage(int no) {
		return managerDao.selectQnaImage(no);
	}
	
	public QnaVO selectQnaDetail(int no) {
		return managerDao.selectQnaDetail(no);
	}
	
	public boolean updateAnswer(QnaVO vo) {
		return managerDao.updateAnswer(vo);
	}
	
	public int deleteAnswer(int no) {
		return managerDao.deleteAnswer(no);
	}
	
	public List<BrandVO> selectBrandList() {
		return managerDao.selectBrandList();
	}
	
	public int selectBrandNo() {
		return managerDao.selectBrandNo();
	}
	
	public int insertBrand(BrandVO vo) {
		return managerDao.insertBrand(vo);
	}
	
	public int selectGoodsNo() {
		return managerDao.selectGoodsNo();
	}
	
	public void insertGoods(GoodsVO goodsVo) {
		managerDao.insertGoods(goodsVo);
	}
	
	public List<GoodsVO> selectGoods() {
		return managerDao.selectGoods();
	}
	
	public GoodsVO selectGoodsVo(int no) {
		return managerDao.selectGoodsVo(no);
	}
	
	public List<GoodsOptionVO> selectGoodsOptionVo(int no) {
		return managerDao.selectGoodsOptionVo(no);
	}
	
	public void updateGoods(GoodsVO vo) {
		managerDao.updateGoods(vo);
	}
	
	public List<Integer> selectGoodsOptionList(int no) {
		return managerDao.selectGoodsOptionList(no);
	}
	
	public void updateGoodsOption(GoodsOptionVO vo) {
		managerDao.updateGoodsOption(vo);
	}
	
	public void deleteGoodsOption(int no) {
		managerDao.deleteGoodsOption(no);
	}
	
	public void insertGoodsOption(GoodsOptionVO vo) {
		managerDao.insertGoodsOption(vo);
	}
	
	
	public void updateGoodsOptions(int goodsNo, GoodsOptionVO oVo) {

		List<Integer> beforeOptionList = selectGoodsOptionList(goodsNo);
		int beforeOptionCount = beforeOptionList.size();
		int afterOptionCount = oVo.getOption_detail().length;
		
		if (beforeOptionCount == afterOptionCount && oVo != null) {
			for (int i = 0; i < oVo.getOption_count().length; i++) {
				GoodsOptionVO optionVo = new GoodsOptionVO();
				optionVo.setNo(beforeOptionList.get(i));
				optionVo.setDetail(oVo.getOption_detail()[i]);
				optionVo.setCount(oVo.getOption_count()[i]);
				optionVo.setPrice(oVo.getOption_price()[i]);
				updateGoodsOption(optionVo);
			}
		} else if (beforeOptionCount > afterOptionCount && oVo.getCount() != 0) {
			for (int i = 0; i < afterOptionCount; i++) {
				GoodsOptionVO optionVo = new GoodsOptionVO();
				optionVo.setNo(beforeOptionList.get(i));
				optionVo.setDetail(oVo.getOption_detail()[i]);
				optionVo.setCount(oVo.getOption_count()[i]);
				optionVo.setPrice(oVo.getOption_price()[i]);
				updateGoodsOption(optionVo);
			}
			for (int i = beforeOptionCount - 1; i >= afterOptionCount; i--) {
				int optionNo = beforeOptionList.get(i);
				deleteGoodsOption(optionNo);
			}
		} else if (beforeOptionCount > afterOptionCount && oVo.getCount() != 0){
			for (int i = 0; i < beforeOptionCount; i++) {
				GoodsOptionVO optionVo = new GoodsOptionVO();
				optionVo.setNo(beforeOptionList.get(i));
				optionVo.setDetail(oVo.getOption_detail()[i]);
				optionVo.setCount(oVo.getOption_count()[i]);
				optionVo.setPrice(oVo.getOption_price()[i]);
				updateGoodsOption(optionVo);
			}
			for (int i = beforeOptionCount; i < afterOptionCount; i++) {
				GoodsOptionVO optionVo = new GoodsOptionVO();
				optionVo.setGoods_no(goodsNo);
				optionVo.setDetail(oVo.getOption_detail()[i]);
				optionVo.setCount(oVo.getOption_count()[i]);
				optionVo.setPrice(oVo.getOption_price()[i]);
				insertGoodsOption(optionVo);
			}
		}
	}
	
	public void insertGoodsImg(GoodsImgVO vo) {
		managerDao.insertGoodsImg(vo);
	}
	
	public void insertGoodsDetailImg(GoodsDetailImgVO vo) {
		managerDao.insertGoodsDetailImg(vo);
	}
	
	public List<GoodsImgVO> selectGoodsImg(int no) {
		return managerDao.selectGoodsImg(no);
	}
	
	public List<GoodsDetailImgVO> selectGoodsDetailImg(int no) {
		return managerDao.selectGoodsDetailImg(no);
	}
	
	public void deleteGoodsImg(String[] deleteImgList, int no) {
		for (String img : deleteImgList) {
			if (img.contains("main")) {
				GoodsImgVO vo = new GoodsImgVO();
				vo.setGoods_no(no);
				vo.setImg(img);
				managerDao.deleteGoodsImg(vo);
			} else if (img.contains("detail")){
				GoodsDetailImgVO vo = new GoodsDetailImgVO();
				vo.setGoods_no(no);
				vo.setImg(img);
				managerDao.deleteGoodsDetailImg(vo);
			}
		}
	}
	
	public int selectGoodsImgSeq(int no) {
		return managerDao.selectGoodsImgSeq(no);
	}
	
	public int selectGoodsDetailImgSeq(int no) {
		return managerDao.selectGoodsDetailImgSeq(no);
	}
}
