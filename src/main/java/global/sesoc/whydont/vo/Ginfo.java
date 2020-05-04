package global.sesoc.whydont.vo;

import lombok.Data;

@Data
public class Ginfo {
	private int infono;
	private String writer;
	private String title;
	private String content;
	private String regdate;
	private int hitcount;
	private String originalfilename;
	private String savedfilename;
	private int greplycount;
	private String tid;
}
