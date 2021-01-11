package com.example.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class VvsVO {
	private String u_seq;					// 글 번호
	private String title;					// 글 제목
	private String content;			// 글 본문
	private String writedate;				// 글 작성일
	private int readnum;			// 글 조회수
	private String nickname;		// 닉네임
}
