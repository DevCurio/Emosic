package com.project.emosic.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class User {
	
	private String id;
	private String password;
	private String nickName;
	private String authority;
	private String loginType;
	private String regiDate;
	private String enabled;
	
}
