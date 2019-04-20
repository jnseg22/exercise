package com.home.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	@Select("SELECT bno FROM tbl_board")
	public String getTime();
	
	public String getTime2();
}
