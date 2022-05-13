package com.withidle.gidle.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Board {
	private int board_idx;
	private int board_cat;
	private String board_sub;
	private String board_con;
	private Date wdate;
	private int com_cnt;
	private int like_cnt;
	private int view_cnt;
	private String board_name;
	private String user_id;
}
