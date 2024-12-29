package vo.review;

import java.sql.Date;

public class ReviewVO {
 
	private int review_no;
	private int users_no;
	private int goods_no;
	private int score;
	private String content;
	private Date write_date;
	
	private String users_name;
	
	public ReviewVO() {
		super();
	}


	public ReviewVO(int review_no, int users_no, int goods_no, int score, String content, Date write_date) {
		super();
		this.review_no = review_no;
		this.users_no = users_no;
		this.goods_no = goods_no;
		this.score = score;
		this.content = content;
		this.write_date = write_date;
	}


	public int getReview_no() {
		return review_no;
	}


	public void setReview_no(int review_no) {
		this.review_no = review_no;
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


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getWrite_date() {
		return write_date;
	}


	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}


	public String getUsers_name() {
		return users_name;
	}


	public void setUsers_name(String users_name) {
		this.users_name = users_name;
	}

	
	

}
	