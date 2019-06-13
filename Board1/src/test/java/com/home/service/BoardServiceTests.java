package com.home.service;

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
public class BoardServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;

	@Test
	public void testRegister() {
		
		BoardVO board = new BoardVO();
		board.setTitle("tt");
		board.setContent("tt");
		board.setWriter("ddd");
		
		service.register(board);
		
		log.info("생성된 게시물의 번호: " + board.getBno());
	}
}
