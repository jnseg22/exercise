package com.home.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	//limit #{pageStart}, #{amount}
	private int pageNum;
	private int amount;
	private int pageStart;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this.pageNum = 1;
		this.amount = 10;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getPageNum() {
		return pageNum;
	}	
	public void setPageNum(int pageNum) {

		if (pageNum <= 0) {
			this.pageNum = 1;
			return;
		}

		this.pageNum = pageNum;
	}
	
	
	public int getPageStart() {
		//시작데이터 번호 = (페이지번호  - 1) * 페이지당 보여지는 개수 
		
		this.pageStart = (this.pageNum - 1) * amount;
		
		return this.pageStart;
	}
	
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}
	
	public int getAmount() {
		return this.amount;
	}
	
    // MyBatis SQL 의 Mapper 에서 인식해서 가져가는 파라미터 값 메소드 #{perPageNum}
    public void setAmount(int amount) {
        //몇개 씩 보여줄것인가 이다. 최대 100개씩 보여 줄것으로 설정한다.
        //만약 0보다 작거나 100 보다 크면 10으로 초기화 시킨다.
        if(amount <=0 || amount >100){
            this.amount=10;
            return;
        }
        this.amount = amount;
    }
    
    public String[] getTypeArr() {
    	
    	return type == null? new String[] {}: type.split("");
    }
    
    public String getListLink() {
    	
    	UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
    			.queryParam("type", this.getType())
    			.queryParam("keyword", this.getKeyword())
    			.queryParam("pageNum", this.pageNum)
    			.queryParam("amount", this.getAmount());
    	
    	return builder.toUriString();
    }
}
