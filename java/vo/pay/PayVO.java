package vo.pay;

import java.sql.Date;

public class PayVO {

	private int no;
	private int order_list_no;
	private Date pay_date;
	private int pay_kind;
	
	
	public PayVO() {
		super();
	}


	public PayVO(int no, int order_list_no, Date pay_date, int pay_kind) {
		super();
		this.no = no;
		this.order_list_no = order_list_no;
		this.pay_date = pay_date;
		this.pay_kind = pay_kind;
	}


	public PayVO(int order_list_no, Date pay_date, int pay_kind) {
		super();
		this.order_list_no = order_list_no;
		this.pay_date = pay_date;
		this.pay_kind = pay_kind;
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


	public Date getPay_date() {
		return pay_date;
	}


	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}


	public int getPay_kind() {
		return pay_kind;
	}


	public void setPay_kind(int pay_kind) {
		this.pay_kind = pay_kind;
	}
	
	
}
