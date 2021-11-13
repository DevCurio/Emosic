package com.project.emosic.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private String id;
	private String password;
	private String nickName;
	private char authority;
	private String loginType;
	private Date enrollDate;
	private char enabled;
	
}
