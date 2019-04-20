package com.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.home.domain.BoardVO;
import com.home.domain.Criteria;

public interface BoardMapper {

	//@Select("select *  from tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amout);
	
}
