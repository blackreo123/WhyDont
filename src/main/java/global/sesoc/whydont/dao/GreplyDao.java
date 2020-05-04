package global.sesoc.whydont.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.whydont.vo.Greply;

@Repository
public class GreplyDao {
	
	@Autowired
	SqlSession session;
	
	//각 공지사항당 댓글 개수
	public int replycount(int infono) {
		int result=0;
		GreplyMapper mapper = session.getMapper(GreplyMapper.class);
		result	= mapper.replycount(infono);
		return result;
	}
	//댓글목록 가져오기
	public List<Greply> replyList(int infono) {
		GreplyMapper mapper = session.getMapper(GreplyMapper.class);
		return mapper.replyList(infono);
	}
	//댓글쓰기
	public int replyWrite(Greply greply) {
		GreplyMapper mapper = session.getMapper(GreplyMapper.class);
		int result=mapper.replyWrite(greply);
		return result;
	}
	//댓글삭제
	public int replyDelete(int replyno) {
		GreplyMapper mapper = session.getMapper(GreplyMapper.class);
		int result=	mapper.replyDelete(replyno);
		return result;
	}
	//댓글 수정
	public int reU(Greply greply) {
		GreplyMapper mapper = session.getMapper(GreplyMapper.class);
		int result	= mapper.reU(greply);
		return result;
	}
}
