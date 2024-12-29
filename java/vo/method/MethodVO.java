package vo.method;

public class MethodVO {
	private int no;
	private String method;
	
	public MethodVO() { }
	
	public MethodVO(String method) {
		this.method = method;
	}
	
	public MethodVO(int no, String method) {
		this.no = no;
		this.method = method;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getmethod() {
		return method;
	}
	public void setmethod(String method) {
		this.method = method;
	}
	
}
