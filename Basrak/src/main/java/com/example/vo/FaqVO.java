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
public class FaqVO {
	private String f_seq;
	private String title;
	private String content;
	private String writedate;
	private int readnum;
}
