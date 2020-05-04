package global.sesoc.whydont.dao;

import java.util.ArrayList;
import global.sesoc.whydont.vo.Gtrainer;

public interface TrainerMapper {
//아이디 중복검사
	Gtrainer tidCheck(String tid);
//트레이너 등록
	int insertT(Gtrainer gt);
	//로그인할때 대조
	Gtrainer tselectOne(Gtrainer gt);
	//수정할 정보 찾기
	Gtrainer getOne(String tid);
	//트레이너 정보 수정
	int tUpdate(Gtrainer gt);
	//트레이너 탈퇴
	int deleteT(String tid);
	//트레이너 리스트
	ArrayList<Gtrainer> getList();

}
