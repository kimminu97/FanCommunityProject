package com.withidle.gidle.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Heart {
	private int heart_id;
	private String mem_id;
	private int heart_num;
	private int board_id;
	private int board_cat;
}