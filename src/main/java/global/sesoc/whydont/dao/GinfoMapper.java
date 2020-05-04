package global.sesoc.whydont.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.whydont.vo.Ginfo;

public interface GinfoMapper {
	//전체 공지 목록
	List<Ginfo> ginfoList(Map<String, Object> map, RowBounds rb);
	//공지작성
	int insertGinfo(Ginfo ginfo);
	//공지하나 읽기
	Ginfo ginfoDetail(int infono);
	//공지 삭제
	int deleteGinfo(int infono);
	//공지 수정
	int updateGinfo(Ginfo oldGinfo);
	//페이지ㅣ이이잉
	int getGinfoCount(Map<String, Object> map);
	//조회 수
	void updateHit(int infono);

}
