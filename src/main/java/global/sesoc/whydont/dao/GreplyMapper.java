package global.sesoc.whydont.dao;

import java.util.List;

import global.sesoc.whydont.vo.Greply;

public interface GreplyMapper {
	
	public int replycount(int infono);
	//댓글 목록
	public List<Greply> replyList(int infono);
	//댓글 삭제
	public int replyDelete(int replyno);
	//댓글 쓰기
	public int replyWrite(Greply greply);
	//댓글 수정
	public int reU(Greply greply);
	
	
	

}
