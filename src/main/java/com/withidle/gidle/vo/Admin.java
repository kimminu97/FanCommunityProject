package com.withidle.gidle.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Admin {
	private String adm_id;
	private String adm_password;
	private String adm_name;
	private Date adm_date;
	private String adm_email;
	private String adm_grade;
}
