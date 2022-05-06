package com.withidle.gidle.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
	private String user_id;
	private String user_password;
	private String user_name;
	private Date joinDate;
	private String user_email;
	private String user_grade;
}
