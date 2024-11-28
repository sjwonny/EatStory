package vo.type;

public class TypeVO {
	private int no;
	private String type;
	
	public TypeVO() { }
	
	public TypeVO(String type) {
		this.type = type;
	}
	
	public TypeVO(int no, String type) {
		this.no = no;
		this.type = type;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String gettype() {
		return type;
	}
	public void settype(String type) {
		this.type = type;
	}
	
}
