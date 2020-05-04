package global.sesoc.whydont.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.whydont.vo.Gmember;

@Repository
public class MemberDao {
	@Autowired
	SqlSession session;
	//아이디중복체크
	public Gmember idCheck(String mid) {
		MemberMapper mapper=session.getMapper(MemberMapper.class);
		Gmember gm=mapper.idCheck(mid);
		
		return gm;
	}
	//회원등록
	public int insertM(Gmember gm) {
		MemberMapper mapper=session.getMapper(MemberMapper.class);
		int res=mapper.insertM(gm);
		return res;
	}
	//로그인할때 정보 찾기
	public Gmember selectOne(Gmember gm) {
		MemberMapper mapper=session.getMapper(MemberMapper.class);
		Gmember m=mapper.selectOne(gm);
		return m;
	}
	//회원정보 수정할때 로그인한 아이디로 멤버 정보 찾기
	public Gmember getOne(String mid) {
		MemberMapper mapper=session.getMapper(MemberMapper.class);
		Gmember m=mapper.getOne(mid);
		return m;
	}
	//회원정보 수정!
	public int mUpdate(Gmember gm) {
		MemberMapper mapper=session.getMapper(MemberMapper.class);
		int res=mapper.mUpdate(gm);
		return res;
	}
	public int deleteM(String mid) {
		MemberMapper mapper=session.getMapper(MemberMapper.class);
		int res=mapper.deleteM(mid);
		return res;
	}
	//결제 했을때 쿠폰+1
	public int cuponU(String mid) {
		MemberMapper mapper=session.getMapper(MemberMapper.class);
		int res=mapper.cuponU(mid);
		return res;
	}
	//피티등록
	public int pton(HashMap<String, Object> map) {
		MemberMapper mapper=session.getMapper(MemberMapper.class);
		int res = mapper.pton(map);
		return res;
	}
	//자신의 피티 회원들
	public List<Gmember> getPt(String tid) {
		MemberMapper mapper=session.getMapper(MemberMapper.class);
		List<Gmember> list = mapper.getPt(tid);
		return list;
	}
	//차감 -1
	public int saku(String mid) {
		MemberMapper mapper=session.getMapper(MemberMapper.class);
		int res= mapper.saku(mid);
		return res;
	}
	//Pt 관둬!
	public int deletePt(String mid) {
		MemberMapper mapper=session.getMapper(MemberMapper.class);
		int res = mapper.deletePt(mid);
		return res;
		
	}

}
