package global.sesoc.whydont.dao;

import java.util.HashMap;
import java.util.List;

import global.sesoc.whydont.vo.Gmember;

public interface MemberMapper {
	//아이디 중복검사
	Gmember idCheck(String mid);
	//회원등록
	int insertM(Gmember gm);
	//로그인 할때 정보대조
	Gmember selectOne(Gmember gm);
	//회원수정 할때 회원 정보
	Gmember getOne(String mid);
	//회원정보 수정
	int mUpdate(Gmember gm);
	//회원탈퇴
	int deleteM(String mid);
	//결제 했을때 쿠폰+1
	int cuponU(String mid);
	//피티등록
	int pton(HashMap<String, Object> map);
	//자신의 피티 회원들
	List<Gmember> getPt(String tid);
	//차감 -1
	int saku(String mid);
	//피티 관두기
	int deletePt(String mid);
	
	

}
