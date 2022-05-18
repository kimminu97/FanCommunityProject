package com.withidle.gidle.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
	private int comment_idx;
	private int comment_board;
	private int comment_boardcat;
	private String comment_content;
	private int comment_like;
	private Timestamp comment_wdate;
	private String comment_mname;
	private int comment_parent;
	private String user_id;
	private int comment_depth;
	private int comment_order;
}
