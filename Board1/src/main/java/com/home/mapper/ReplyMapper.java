package com.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.home.domain.Criteria;
import com.home.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ReplyVO reply);
	
	//두개 이상의 데이터를 파라미터로 전달하기 위해 @Param을 사용 XML에서 사용함.
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
	public int getCountByBno(Long bno);
}
