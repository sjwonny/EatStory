package service.goods;

import java.util.List;


import java.util.Map;

import dao.brand.BrandDAO;
import dao.cart.CartDAO;
import dao.goods.GoodsDAO;
import dao.orderlist.OrderListDAO;
import dao.wish.WishDAO;
import vo.cart.CartVO;
import vo.goods.GoodsVO;
import vo.goods.goods.goodsVO;
import vo.goods_detail_img.GoodsDetailImgVO;
import vo.goods_img.GoodsImgVO;
import vo.goods_option.GoodsOptionVO;
import vo.manager.brand.BrandVO;
import vo.review.ReviewVO;
import vo.wish.WishVO;


public class GoodsService {
	private GoodsDAO goodsDao;
	private CartDAO cartDao;
	private WishDAO wishDao;
	private OrderListDAO orderListDao;
	private BrandDAO brandDao;
	
	//������� ����	
		public BrandDAO getBrandDao() {
			return brandDao;
		}

		public void setBrandDao(BrandDAO brandDao) {
			this.brandDao = brandDao;
		}
		
		
		 public GoodsDAO getGoodsDao() { return goodsDao; }
		 
		 public void setGoodsDao(GoodsDAO goodsDao) { this.goodsDao = goodsDao; }
		 
	//������� ����

	public GoodsService(GoodsDAO goodsDao, CartDAO cartDao, WishDAO wishDao, OrderListDAO orderListDao,BrandDAO brandDao) {
		this.goodsDao = goodsDao;
		this.cartDao = cartDao;
		this.wishDao = wishDao;
		this.orderListDao = orderListDao;
		this.brandDao = brandDao;
	}

	public List<GoodsVO> selectGoods() {
		return goodsDao.selectGoods();
	}

	public int selectCount() {
		return goodsDao.selectCount();
	}

	public int selectGoodsNo() {
		return goodsDao.selectGoodsNo();
	}

	public GoodsVO selectGoodsDetail(int no) {
		return goodsDao.selectGoodsDetail(no);
	}

	public List<GoodsImgVO> selectGoodsImgList(int no) {
		return goodsDao.selectGoodsImgList(no);
	}

	public List<GoodsDetailImgVO> selectGoodsDetailImgList(int no) {
		return goodsDao.selectGoodsDetailImgList(no);
	}

	public List<GoodsOptionVO> selelctGoodsOption(int no) {
		return goodsDao.selectGoodsOption(no);
	}

	public int detailImageCount(int no) {
		return goodsDao.detailImageCount(no);
	}

	public int insertWish(int optionNo) {
		return goodsDao.insertWish(optionNo);
	}

	public List<GoodsVO> selectWish(int usersNo) {
		return goodsDao.selectWish(usersNo);
	}

	public List<GoodsVO> selectCart(int usersNo) {
		return goodsDao.selectCart(usersNo);
	}

//	public int deleteWish(int wishNo) {
//		return wishDao.deleteWish(wishNo);
//	}
	public int insertCart(CartVO vo) {
		return cartDao.insertCart(vo);
	}

	public int deleteCart(int cartNo) {
		return cartDao.deleteCart(cartNo);
	}

	public int checkCart(CartVO vo) {
		return cartDao.checkCart(vo);
	}

	public int addCartQuantity(int quantity) {
		return cartDao.addCartQuantity(quantity);
	}

	public List<GoodsVO> purchaseCart(int cartNo) {
		return goodsDao.purchaseCart(cartNo);
	}

	public int insertOrderList(GoodsVO vo) {
		return orderListDao.insertOrderList(vo);
	}
	public List<BrandVO> selectList() {
		List<BrandVO> list = brandDao.selectList();
		
		if (list.isEmpty()) {
			list = null;
		}
		
		return list;
	}
	//����
	public List<goodsVO> selectGoodsList(int no) {
		List<goodsVO> list = goodsDao.selectGoodsList(no);
		
		if (list.isEmpty()) {
			list = null;
		}
		
		return list;
	}

	  public BrandVO selectBrandName(int no) { 
		  return brandDao.selectBrandName(no);
	  }
	  
	  
	  public List<Map<String, Object>> printWish(int users_no) {
			List<Map<String, Object>> list = wishDao.printWish(users_no);
			
			if (list.isEmpty()) {
				list = null;
			}
			
			return list;
		}
	  
		
	 public int deleteWishList(int no) { 
		  return wishDao.deleteWishList(no); 
	 }
		
		
	  public int insertWish(WishVO vo){ 
		  return wishDao.insertWish(vo);
	}
		 
	  public List<ReviewVO> selectReviewList(int no){
		  return goodsDao.selectReviewList(no);
	  }
}

