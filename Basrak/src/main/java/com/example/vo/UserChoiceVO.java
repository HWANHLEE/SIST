package com.example.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserChoiceVO {
	
	private int choice_seq;
	private String  s_seq;	// 종목 번호
	private String  d_seq;	// 요일 번호
	private String nickname;
	
}
