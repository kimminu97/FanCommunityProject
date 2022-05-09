package com.withidle.gidle.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PageDto { //페이징을 위한 값들을 저장합니다.
	private int pageNo;		//현재페이지
	private int pageSize;	//보통 10 : 한 화면에 보이는 글목록의 글개수
	private int totalCount;	//전체 글의 개수
	
	private int startNo;	//현재페이지 글목록의 시작번호
	private int endNo;		//현재페이지 글목록의 마지막번호:startNo +pageSize-1
	private int startPage;	//페이지 이동버튼의 시작번호
	private int endPage;	//페이지 이동버튼의 마지막번호 : startPage + 9
	private int totalPage;
	
	public PageDto(int pageNo, int pageSize, int totalCount) {
//		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalCount=totalCount;
		
		//계산 시작 : 페이지 개수
		totalPage = (totalCount-1)/pageSize +1;	//글개수가 9일때 페이지 개수 1
					//글개수가 98일때 페이지 개수 10
		
		//*pageNo는 현재페이지가 잘못된 값이 전달되었을 때 : 1보다 작은 값 또는 totalpage보다 큰값
		this.pageNo = (pageNo<1)? 1:pageNo;
		this.pageNo=(pageNo>totalPage)? totalPage:pageNo;
		
		startNo = (this.pageNo-1)*pageSize+1;
		endNo = startNo + (pageSize-1);
		this.endNo = this.endNo>totalCount? totalCount:this.endNo;
		
		startPage =(this.pageNo-1)/10*10+1;	//pageNo가 11~20 일때 startPage는 모두 11
		endPage = startPage+9;	//totalPage 이하의 값이어야 합니다.
		this.endPage = this.endPage>totalPage?	totalPage:this.endPage;
	}
}
