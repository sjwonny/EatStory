package vo.users;

import java.sql.Date;

public class UsersVO {

	private int no;
	private String id;
	private String pw;
	private String phone;
	private String birth; //없는 날짜 받으면 400번 오류 뜸
	private String email;
	private String name;
	private int kind;
	private int state;
	private String img;
	private String msg;
	private Date join_date;
	private int mileage;
	
	
	public UsersVO() {
		
	}

	public UsersVO(int no, String id, String pw, String phone, String birth, String email, String name, int kind,
			int state, String img, String msg, Date join_date, int mileage) {
		super();
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
		this.name = name;
		this.kind = kind;
		this.state = state;
		this.img = img;
		this.msg = msg;
		this.join_date = join_date;
		this.mileage = mileage;
	}

	public UsersVO(String id, String pw, String phone, String birth, String email, String name, int kind, int state,
			String img, String msg, Date join_date, int mileage) {
		super();
		this.id = id;
		this.pw = pw;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
		this.name = name;
		this.kind = kind;
		this.state = state;
		this.img = img;
		this.msg = msg;
		this.join_date = join_date;
		this.mileage = mileage;
	}

	
	public UsersVO(int no, String id, String pw, String phone, String birth, String email, String name) {
		super();
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
		this.name = name;
	}


	public int getNo() {
		return no;
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public String getPhone() {
		return phone;
	}

	public String getBirth() {
		return birth;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}

	public int getKind() {
		return kind;
	}

	public int getState() {
		return state;
	}

	public String getImg() {
		return img;
	}

	public String getMsg() {
		return msg;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public int getMileage() {
		return mileage;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public void setState(int state) {
		this.state = state;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	
}
