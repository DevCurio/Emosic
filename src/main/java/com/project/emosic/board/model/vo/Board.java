package com.project.emosic.board.model.vo;

import java.util.Date;

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
	private Date writeDate;
	private int viewCount;
	private int likeCount;
	
	//private int attachCount;	//첨부파일 갯수
	
}
