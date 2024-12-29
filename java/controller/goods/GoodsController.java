package controller.goods;

import java.util.List;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.goods.GoodsService;
import vo.cart.CartVO;
import vo.goods.GoodsVO;
import vo.goods.goods.goodsVO;
import vo.goods_detail_img.GoodsDetailImgVO;
import vo.goods_img.GoodsImgVO;
import vo.goods_option.GoodsOptionVO;
import vo.manager.brand.BrandVO;
import vo.review.ReviewVO;
import vo.users.UsersVO;
import vo.wish.WishVO;

@Controller
public class GoodsController {
	private GoodsService goodsService;

	@Autowired
	private ServletContext application;

	public GoodsController(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	@RequestMapping("/goods/list")
	public String storeList(HttpSession session, Model model) {

		List<GoodsVO> goodsList = goodsService.selectGoods();
		int count = goodsService.selectCount();

		model.addAttribute("goodsList", goodsList);
		model.addAttribute("count", count);

		return "/goods/list";
	}

	@RequestMapping("/goods/{no}")
	public String detail(Model model, @PathVariable("no") int no, HttpSession session) {
		Integer login = (Integer) session.getAttribute("login");

		GoodsVO goodsDetail = goodsService.selectGoodsDetail(no);
		List<GoodsImgVO> imgGoodsList = goodsService.selectGoodsImgList(no);
		List<GoodsDetailImgVO> imgDetailGoodsList = goodsService.selectGoodsDetailImgList(no);
		List<GoodsOptionVO> optionList = goodsService.selelctGoodsOption(no);
		int detailImgCount = goodsService.detailImageCount(no);
		List<ReviewVO> reviewList = goodsService.selectReviewList(no);

		model.addAttribute("login", login);
		model.addAttribute("vo", goodsDetail);
		model.addAttribute("imgGoodsList", imgGoodsList);
		model.addAttribute("imgDetailGoodsList", imgDetailGoodsList);
		model.addAttribute("optionList", optionList);
		model.addAttribute("detailImgCount", detailImgCount);
		model.addAttribute("rList", reviewList);
		

		return "/goods/detail";
	}

	@RequestMapping("/goods/cart")
	public String cart(Model model, HttpSession session, @RequestParam("options") int[] options,
			@RequestParam("quantity") int[] quantity) {
		Integer users_no = (Integer) session.getAttribute("login");

		if (users_no == null) {
			return "redirect:/login/loginform";
		}

		CartVO cvo = new CartVO();
		cvo.setUsers_no(users_no);

		for (int i = 0; i < options.length; i++) {

			cvo.setGoods_option_no(options[i]);
			cvo.setQuantity(quantity[i]);

//			if (goodsService.checkCart(cvo) != 0) {
//				goodsService.addCartQuantity(quantity[i]);
//			} else {
			goodsService.insertCart(cvo);
//			}

		}

		List<GoodsVO> goodsVo = goodsService.selectCart(users_no);

		model.addAttribute("usersNo", users_no);
		model.addAttribute("goodsVo", goodsVo);

		return "/goods/cart";
	}

	@RequestMapping("/cart/delete")
	public String cartDelete(Model model, HttpSession session, @RequestParam("cartNo") int[] cartNo) {

		Integer usersNo = (Integer) session.getAttribute("login");

		if (usersNo == null) {
			return "redirect:/login/loginform";
		}

		// CartVO cvo = new CartVO();
		for (int i = 0; i < cartNo.length; i++) {
			goodsService.deleteCart(cartNo[i]);
		}

		List<GoodsVO> goodsVo = goodsService.selectCart(usersNo);

		model.addAttribute("goodsVo", goodsVo);

		return "/goods/cart";
	}

	@RequestMapping("/order/order")
	public String order(Model model, HttpSession session, @RequestParam("cartNo") int[] cartNo) {

		Integer users_no = (Integer) session.getAttribute("login");

		if (users_no == null) {
			return "redirect:/login/loginform";
		}

		CartVO cvo = new CartVO();
		cvo.setUsers_no(users_no);

		List<GoodsVO> goodsVo = goodsService.selectCart(users_no);

		// totalPrice 
		int totalPrice = 0;
		int totalDeliveryPrice = 0;

		for (GoodsVO vo : goodsVo) {
			totalPrice += vo.getOption_price() * vo.getQuantity();
			totalDeliveryPrice += vo.getDelivery_price();
		}

		model.addAttribute("usersNo", users_no);
		model.addAttribute("goodsVo", goodsVo);
		model.addAttribute("totalPrice", totalPrice); // totalPrice瑜� 紐⑤뜽�뿉 異붽�
		model.addAttribute("totalDeliveryPrice", totalDeliveryPrice); // totalDeliveryPrice瑜� 紐⑤뜽�뿉 異붽�

		return "/order/order";
	}

	@RequestMapping("/order/purchase")
	public String purchase(Model model, HttpSession session, @RequestParam("carNo") int[] carNo) {

		Integer users_no = (Integer) session.getAttribute("login");

		if (users_no == null) {
			return "redirect:/login/loginform";
		}

		return "";
	}	
	
	@RequestMapping("/brand/list")
	public String list(Model model) {
       
		List<BrandVO> list = goodsService.selectList();
		
		model.addAttribute("list",list);
		
		return "brand/list";
	}
	
	@RequestMapping("/product/{no}") //list페이지에서 브랜드 번호 가져옴
	public String detail(Model model,@PathVariable("no") int no){
		
		  List<goodsVO> gList = goodsService.selectGoodsList(no);
			BrandVO brandVo = goodsService.selectBrandName(no); 
			
		  model.addAttribute("gList", gList);
			 model.addAttribute("brandVo",brandVo); 
				
		 
		return "/goods/productPage";
	}
	
	
	@RequestMapping("/goods/wish/{no}")
	public String wishList(Model model,HttpSession session ,@PathVariable("no") int no,@RequestParam("options") int[] options, @RequestParam("quantity") int quantity) {
       
		Integer users_no = (Integer) session.getAttribute("login"); 
		
		System.out.println("수량" + quantity);
		  WishVO wvo = new WishVO(); 
		  wvo.setUsers_no(users_no);
		  wvo.setGoods_no(no);
		  System.out.println("여기까지되나?");
	      wvo.setQuantity(quantity);
	      System.out.println("여기까지되나?1");
		  for (int i = 0; i < options.length; i++) {
			wvo.setGoods_option_no(options[i]);
		  }
		  int wno = goodsService.checkWishList(wvo);
		if(wno == 0) {
		int su1 = goodsService.insertWish(wvo);
		System.out.println("인서트 됐는지" + su1);
		model.addAttribute("su1",su1);
		}
		
		
		
		List<Map<String, Object>> list = goodsService.printWish(users_no);
		
		model.addAttribute("list",list);
	 
		return "zzimPage";
	}
	
	
	@RequestMapping("/goods/deleteWish/{no}")
	public String deleteWish (Model model,HttpSession session, @PathVariable("no") int no) {
		Integer users_no = (Integer) session.getAttribute("login"); 
	
   int su2 = goodsService.deleteWishList(no);
		
	
    List<Map<String, Object>> list = goodsService.printWish(users_no);

    model.addAttribute("list",list);
    model.addAttribute("su2",su2);
    
		return "zzimPage";
		
	}

}
