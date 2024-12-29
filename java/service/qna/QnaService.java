package service.qna;

import java.io.BufferedReader;



import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.qna.QnaDAO;
import vo.qna.QnaVO;
import vo.qna_image.QnaImageVO;

public class QnaService {
	private QnaDAO qnaDao;

	public QnaService(QnaDAO qnaDao) {
		this.qnaDao = qnaDao;
	}

	public List<QnaVO> selectList(int userNo) {
		return qnaDao.selectList(userNo);
	}

	public int selectCount(int no) {
		return qnaDao.selectCount(no);
	}

	public int insertQna(QnaVO vo) {
		return qnaDao.insertQna(vo);
	}

	public int insertQnaImage(QnaImageVO vo) {
		return qnaDao.insertQnaImage(vo);
	}

	public int selectQnaNo() {
		return qnaDao.selectQnaNo();
	}

	public List<QnaImageVO> selectImageVoList(int no) {
		return qnaDao.selectImageVoList(no);
	}

	public Map<String, Object> getContent(int no) {

		Map<String, Object> map = qnaDao.getContent(no);

		String str = "";

		StringBuffer buf = new StringBuffer();

		Clob clob = (Clob) map.get("CONTENT");

		BufferedReader br = null;
		try {
			br = new BufferedReader(clob.getCharacterStream());
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			while ((str = br.readLine()) != null) {
				buf.append(str);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return map;
	}

	public QnaVO selectContent(int no) {
		return qnaDao.selectContent(no);
	}

	public int updateQna(QnaVO vo) {
		return qnaDao.updateQna(vo);
	}

	public int deleteQna(int no) {
		
		return qnaDao.deleteQna(no);
	}
	
	public int deleteQnaImage(int no) {
		return qnaDao.deleteQnaImage(no);
	}

	
	
	
	
	
	
	
}
