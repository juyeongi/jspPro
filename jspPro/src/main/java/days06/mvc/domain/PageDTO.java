package days06.mvc.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PageDTO {
	private int currentPage;
	private int numberPerPage;
	private int numberOfPageBlock;
	private int totalPages;
	
	private int start;
	private int end;
	private boolean prev ;
	private boolean next ;
	
	//생성자
	public PageDTO(int currentPage, int numberPerPage
							, int numberOfPageBlock, int totalPages) {
		super();
		this.currentPage = currentPage;
		this.numberPerPage = numberPerPage;
		this.numberOfPageBlock = numberOfPageBlock;
		this.totalPages = totalPages;
		
		//페이지 시작, 끝번호
		 start = (currentPage -1) /numberOfPageBlock * numberOfPageBlock +1 ;
         end= start + numberOfPageBlock -1;  
         end =   end > totalPages ? totalPages : end;
         // <(이전)   >(다음) 버튼
         if( start != 1 )  prev =true ;                   
         if( end != totalPages )  next = true;
	}

}
