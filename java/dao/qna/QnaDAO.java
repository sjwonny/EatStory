package dao.qna;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.qna.QnaVO;
import vo.qna_image.QnaImageVO;

public class QnaDAO {
	private SqlSession sqlSession;

	public QnaDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<QnaVO> selectList(int userNo) {
		return sqlSession.selectList("qna.selectList", userNo);
	}

	public int selectCount(int no) {
		return sqlSession.selectOne("qna.selectCount", no);
	}

	public int insertQna(QnaVO vo) {
		return sqlSession.insert("qna.insertQna", vo);
	}

	public int insertQnaImage(QnaImageVO vo) {
		return sqlSession.insert("qna.insertQnaImage", vo);
	}

	public int selectQnaNo() {
		return sqlSession.selectOne("qna.selectQnaNo");
	}

	public List<QnaImageVO> selectImageVoList(int no) {
		return sqlSession.selectList("qna.selectQnaImageVoList", no);
	}

	public Map<String, Object> getContent(int no) {
		return sqlSession.selectOne("qna.getContent", no);
	}

	public QnaVO selectContent(int no) {
		return sqlSession.selectOne("qna.selectContent", no);
	}

	// update QnA
	public int updateQna(QnaVO vo) {
		return sqlSession.update("qna.updateQna", vo);
	}

	// delete QnA
	public int deleteQna(int no) {
		return sqlSession.delete("qna.deleteQna", no);
	}

	public int deleteQnaImage(int no) {
		return sqlSession.delete("qna.deleteQnaImage", no);
	}

}
