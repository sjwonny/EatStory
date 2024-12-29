package vo.qna_image;

import org.springframework.web.multipart.MultipartFile;

public class QnaImageVO {

	private int no;
	private int qna_no;
	private String filename;

	private MultipartFile[] img;

	public QnaImageVO() {
		super();
	}

	public QnaImageVO(int qna_no, String filename, MultipartFile[] img) {
		super();
		this.qna_no = qna_no;
		this.filename = filename;
		this.img = img;
	}

	public QnaImageVO(int no, int qna_no, String filename, MultipartFile[] img) {
		super();
		this.no = no;
		this.qna_no = qna_no;
		this.filename = filename;
		this.img = img;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public MultipartFile[] getImg() {
		return img;
	}

	public void setImg(MultipartFile[] img) {
		this.img = img;
	}

}
