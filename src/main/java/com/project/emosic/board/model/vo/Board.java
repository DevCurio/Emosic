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
	private String id;
	private String nickName;
	private String contents;
	private Date writeDate;
	private int viewCnt;
	private int likeCnt;
	
}
