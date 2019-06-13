package com.home.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.home.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	/*@Test
	public void testGetList() {
		
		mapper.getList().forEach(board -> log.info(board));
	}
	
	/*@Test
	public void testInsert() {
		
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("park");
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	@Test
	public void testInsertSelectKey() {
		
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글sk");
		board.setContent("새로 작성하는 내용sk");
		board.setWriter("park");
		
		mapper.insertSelectKey(board);
		
		log.info(board);
	}*/
	
	@Test
	public void testRead() {
		
		BoardVO board = mapper.read(10L);
		
		log.info(board);
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO board = new BoardVO();
		board.setBno(10L);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("pp");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT: " + count);
	}
}
