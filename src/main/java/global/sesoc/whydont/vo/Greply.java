package global.sesoc.whydont.vo;

import lombok.Data;

@Data
public class Greply {
	private int replyno;
	private String writer;
	private String regdate;
	private String replytext;
	private String mid;
	private String tid;
	private int infono;
}
