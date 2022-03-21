package com.project.emosic.member.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Component
public class User {
	
	private String id;
	private String password;
	private String nickName;
	private String regiDate;
	private boolean enabled;
	private String role;

	
}
