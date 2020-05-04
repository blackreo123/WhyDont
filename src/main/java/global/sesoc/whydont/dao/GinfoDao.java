package global.sesoc.whydont.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.whydont.vo.Ginfo;

@Repository
public class GinfoDao {

	@Autowired SqlSession session;
	//페이징(검색후에도
	public int ginfoCount(String searchItem, String searchWord) {
		GinfoMapper mapper = session.getMapper(GinfoMapper.class);
		Map<String, Object>map=new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);
		
		int totalRecordCount=mapper.getGinfoCount(map);
		return totalRecordCount;
	}
	//공지 리스트
	public List<Ginfo> ginfoList(String searchItem, String searchWord, int startRecord, int countPerPage) {
		GinfoMapper mapper = session.getMapper(GinfoMapper.class);
		List<Ginfo> ginfoList;
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		Map<String, Object>map=new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);
		
		ginfoList = mapper.ginfoList(map, rb);

		return ginfoList;
		
	}
	//공지 작성
	public int ginfoWrite(Ginfo ginfo) {
		int result=0;
		GinfoMapper mapper = session.getMapper(GinfoMapper.class);
		
		result=mapper.insertGinfo(ginfo);
		return result;
	}
	//공지 하나 읽기
	public Ginfo ginfoDetail(int infono) {
		Ginfo ginfo=null;
		GinfoMapper mapper = session.getMapper(GinfoMapper.class);
		
		ginfo=mapper.ginfoDetail(infono);
		return ginfo;
	}

	public void updateHit(int infono) {
		GinfoMapper mapper = session.getMapper(GinfoMapper.class);
		mapper.updateHit(infono);
	}
	//공지 삭제
	public int deleteGinfo(int infono) {
		GinfoMapper mapper = session.getMapper(GinfoMapper.class);
		int result = mapper.deleteGinfo(infono);
		return result;
	}
	//공지 수정
	public int updateGinfo(Ginfo oldGinfo) {
		int result=0;
		GinfoMapper mapper = session.getMapper(GinfoMapper.class);
		result=mapper.updateGinfo(oldGinfo);
		return result;
		
	}

}
