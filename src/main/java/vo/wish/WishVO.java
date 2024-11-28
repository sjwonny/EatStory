package vo.wish;

public class WishVO {

	private int no;
	private int users_no;
	private int goods_no;
	private int goods_option_no;

	public WishVO() {
		super();
	}

	public WishVO(int no, int users_no, int goods_no, int goods_option_no) {
		super();
		this.no = no;
		this.users_no = users_no;
		this.goods_no = goods_no;
		this.goods_option_no = goods_option_no;
	}

	public WishVO(int users_no, int goods_no, int goods_option_no) {
		super();
		this.users_no = users_no;
		this.goods_no = goods_no;
		this.goods_option_no = goods_option_no;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUsers_no() {
		return users_no;
	}

	public void setUsers_no(int users_no) {
		this.users_no = users_no;
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
	
	
	
	
}