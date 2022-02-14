package com.project.emosic.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {

	private int no;
	private String category;
	private String title;
	private String userId;
	private String contents;
	private String writeDate;
	private int readCount;
	private int likeCount;
	
	//private int attachCount;	//첨부파일 갯수
	
}
