package vo.orderlist;

import java.sql.Date;

public class OrderListVO {

	private int no;
	private int users_no;
	private int status;
	private Date order_date;
	private int used_mileage;
	private int pay_price;
	private int delibery_price;
	private int delivery_detail_no;
	private int refund;
    private int pay_no;
    
	private String userName;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	
	public OrderListVO() {
		super();
	}

	

	public OrderListVO(int no, int users_no, int status, Date order_date, int used_mileage, int pay_price,
			int delibery_price, int delivery_detail_no, int refund, int pay_no, String userName) {
		super();
		this.no = no;
		this.users_no = users_no;
		this.status = status;
		this.order_date = order_date;
		this.used_mileage = used_mileage;
		this.pay_price = pay_price;
		this.delibery_price = delibery_price;
		this.delivery_detail_no = delivery_detail_no;
		this.refund = refund;
		this.pay_no = pay_no;
		this.userName = userName;
	}

	public OrderListVO(int users_no, int status, Date order_date, int used_mileage, int pay_price, int delibery_price,
			int delivery_detail_no, int refund, int pay_no, String userName) {
		super();
		this.users_no = users_no;
		this.status = status;
		this.order_date = order_date;
		this.used_mileage = used_mileage;
		this.pay_price = pay_price;
		this.delibery_price = delibery_price;
		this.delivery_detail_no = delivery_detail_no;
		this.refund = refund;
		this.pay_no = pay_no;
		this.userName = userName;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getUsed_mileage() {
		return used_mileage;
	}

	public void setUsed_mileage(int used_mileage) {
		this.used_mileage = used_mileage;
	}

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}

	public int getDelibery_price() {
		return delibery_price;
	}

	public void setDelibery_price(int delibery_price) {
		this.delibery_price = delibery_price;
	}

	public int getDelivery_detail_no() {
		return delivery_detail_no;
	}

	public void setDelivery_detail_no(int delivery_detail_no) {
		this.delivery_detail_no = delivery_detail_no;
	}

	public int getRefund() {
		return refund;
	}

	public void setRefund(int refund) {
		this.refund = refund;
	}


	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	
}
