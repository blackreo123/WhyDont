package global.sesoc.whydont.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.whydont.vo.Gmember;
import global.sesoc.whydont.vo.Gtrainer;

@Repository
public class TrainerDao {
	@Autowired
	SqlSession session;
	//아이디 중복체크
	public Gtrainer tidCheck(String tid) {
		TrainerMapper mapper=session.getMapper(TrainerMapper.class);
		Gtrainer gt=mapper.tidCheck(tid);
		return gt;
	}
	//트레이너 등록
	public int insertT(Gtrainer gt) {
		TrainerMapper mapper=session.getMapper(TrainerMapper.class);
		int res=mapper.insertT(gt);
		return res;
	}
	//로그인할때 대조
	public Gtrainer tselectOne(Gtrainer gt) {
		TrainerMapper mapper=session.getMapper(TrainerMapper.class);
		Gtrainer t=mapper.tselectOne(gt);
		return t;
	}
	//트레이너 수정할때 정보 찾기
	public Gtrainer getOne(String tid) {
		TrainerMapper mapper=session.getMapper(TrainerMapper.class);
		Gtrainer gt = mapper.getOne(tid);
		return gt;
	}
	//트레이너 정보 수정
	public int tUpdate(Gtrainer gt) {
		TrainerMapper mapper=session.getMapper(TrainerMapper.class);
		int res= mapper.tUpdate(gt);
		return res;
	}
	//트레이너 탈퇴
	public int deleteT(String tid) {
		TrainerMapper mapper=session.getMapper(TrainerMapper.class);
		int res= mapper.deleteT(tid);
		return res;
	}
	//트레이너 리스트
	public ArrayList<Gtrainer> getList() {
		TrainerMapper mapper=session.getMapper(TrainerMapper.class);
		ArrayList<Gtrainer> trainerList=mapper.getList();
		return trainerList;
	}
	
}
