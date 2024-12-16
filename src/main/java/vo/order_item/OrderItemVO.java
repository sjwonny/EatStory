package vo.order_item;

public class OrderItemVO {

	private int no;
	private int order_list_no;
	private int goods_no;
	private int goods_option_no;
	private int quantity;
	
	
	public OrderItemVO() {
		super();
	}
	
	public OrderItemVO(int no, int order_list_no, int goods_no, int goods_option_no, int quantity) {
		super();
		this.no = no;
		this.order_list_no = order_list_no;
		this.goods_no = goods_no;
		this.goods_option_no = goods_option_no;
		this.quantity = quantity;
	}
	public OrderItemVO(int order_list_no, int goods_no, int goods_option_no, int quantity) {
		super();
		this.order_list_no = order_list_no;
		this.goods_no = goods_no;
		this.goods_option_no = goods_option_no;
		this.quantity = quantity;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getOrder_list_no() {
		return order_list_no;
	}

	public void setOrder_list_no(int order_list_no) {
		this.order_list_no = order_list_no;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public int getGoods_option_no() {
		return goods_option_no;
	}

	public void setGoods_option_no(int goods_option_no) {
		this.goods_option_no = goods_option_no;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
