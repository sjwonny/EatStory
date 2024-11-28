package vo.goods_option;

public class GoodsOptionVO {
	private int no;
	private int goods_no;
	private String detail;
	private int price;
	private int count;

	private String option_detail[];
	private int option_price[];
	private int option_count[];
	private int users_no;
	private int quantity;

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getUsers_no() {
		return users_no;
	}

	public void setUsers_no(int users_no) {
		this.users_no = users_no;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String[] getOption_detail() {
		return option_detail;
	}

	public void setOption_detail(String[] option_detail) {
		this.option_detail = option_detail;
	}

	public int[] getOption_price() {
		return option_price;
	}

	public void setOption_price(int[] option_price) {
		this.option_price = option_price;
	}

	public int[] getOption_count() {
		return option_count;
	}

	public void setOption_count(int[] option_count) {
		this.option_count = option_count;
	}

}
