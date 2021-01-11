package com.example.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class UserVO {
	private String nickname;
	private String email;
	private String passwd;
	
	private UserChoiceVO userChoiceVO; 
	 //한 유저는 여러개의 userChoice를 가질 수 있음
}
