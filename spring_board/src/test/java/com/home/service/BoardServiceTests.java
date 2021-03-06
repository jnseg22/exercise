package com.home.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.home.domain.BoardVO;
import com.home.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	/*@Test
	public void testRegister() {
		
		BoardVO board = new BoardVO();
		board.setTitle("ttwq");
		board.setContent("tttww");
		board.setWriter("qqww");
		
		service.register(board);
		
		log.info("생성된개시물번호 : " + board.getBno());
	}
	
	@Test
	public void testGetList(Criteria cri) {
		
		service.getList(cri).forEach(board -> log.info(board));
	}*/
	
	@Test
	public void testGet() {
		
		log.info(service.get(5L));
	}
}
