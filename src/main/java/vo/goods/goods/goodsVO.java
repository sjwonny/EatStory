package vo.goods.goods;

import org.springframework.web.multipart.MultipartFile;

public class goodsVO {
	private int no;
	private int brand_no;
	private String name;
	private String sub_info;
	private int price;
	private int delivery_price;
	private int free_condition;
	private int dc_price;
	private int dc_amount;
	private int status;
	private int rating;
	private String delivery_info;
	private int hot_deal;
	private String img; //i.img를 뽑아오려면 이게 꼭 있어야 함(아마 goods.xml에 resultType을 goods라고 써서 그런 듯//테이블에 추가하라는 건 아님)//sql문에서 i.img가 g.img로 바뀌는 것은 아님
	
	
	private MultipartFile goods_photo;

	private String store_img;
	private String brand_name;
	private String detail;
	private int quantity;
	private int option_price;
	private int cartNo;
	private int goodsNo;

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getOption_price() {
		return option_price;
	}

	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public MultipartFile getGoods_photo() {
		return goods_photo;
	}

	public void setGoods_photo(MultipartFile goods_photo) {
		this.goods_photo = goods_photo;
	}

	public String getStore_img() {
		return store_img;
	}

	public void setStore_img(String store_img) {
		this.store_img = store_img;
	}
	
	
	
	
	
	
	
	
	public String getImg() { //게터 세터도 만듦
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBrand_no() {
		return brand_no;
	}

	public void setBrand_no(int brand_no) {
		this.brand_no = brand_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSub_info() {
		return sub_info;
	}

	public void setSub_info(String sub_info) {
		this.sub_info = sub_info;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDelivery_price() {
		return delivery_price;
	}

	public void setDelivery_price(int delivery_price) {
		this.delivery_price = delivery_price;
	}

	public int getFree_condition() {
		return free_condition;
	}

	public void setFree_condition(int free_condition) {
		this.free_condition = free_condition;
	}

	public int getDc_price() {
		return dc_price;
	}

	public void setDc_price(int dc_price) {
		this.dc_price = dc_price;
	}

	public int getDc_amount() {
		return dc_amount;
	}

	public void setDc_amount(int dc_amount) {
		this.dc_amount = dc_amount;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getDelivery_info() {
		return delivery_info;
	}

	public void setDelivery_info(String delivery_info) {
		this.delivery_info = delivery_info;
	}

	public int getHot_deal() {
		return hot_deal;
	}

	public void setHot_deal(int hot_deal) {
		this.hot_deal = hot_deal;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	

}
