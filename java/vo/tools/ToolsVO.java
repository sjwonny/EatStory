package vo.tools;

public class ToolsVO {
	private int no;
	private String tools;
	
	public ToolsVO() { }
	
	public ToolsVO(String tools) {
		this.tools = tools;
	}
	
	public ToolsVO(int no, String tools) {
		this.no = no;
		this.tools = tools;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String gettools() {
		return tools;
	}
	public void settools(String tools) {
		this.tools = tools;
	}
	
}
