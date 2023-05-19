package com.icia.ShoppingMall.Page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Page {
    private PageDTO pageDTO;
    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int displayPageNum = 10;

    public PageDTO getPageDTO() {
        return pageDTO;
    }

    public void setPageDTO(PageDTO pageDTO) {
        this.pageDTO = pageDTO;
    }

    public int getTotalCount() {
        return totalCount;
    }

    // 총 게시글 수를 세팅할때 calcData() 메소드로 페이징 관련 버튼 계산
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();
    }

    // 페이징 버튼들을 생성하는 계산식 , 끝 페이지 번호 , 시작 페이지 번호 , 이전 ,다음 버튼
    private void calcData() {
        // Math.ceil = 소수점 올림처리
        endPage = (int) (Math.ceil(pageDTO.getPage() / (double) displayPageNum) * displayPageNum);

        startPage = (endPage - displayPageNum + 1);

        if (startPage <= 0) startPage = 1;

        int tempEndPage = (int) (Math.ceil(totalCount / (double) pageDTO.getPerPageNum()));

        //전체 페이지 갯수가 계산한 endPage보다 작을 때는 endPage 값을 tempEndPage 값과 같게 세팅
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        prev = startPage == 1 ? false : true;
        next = endPage * pageDTO.getPerPageNum() < totalCount ? true : false;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean isNext() {
        return next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }

    public int getDisplayPageNum() {
        return displayPageNum;
    }

    public void setDisplayPageNum(int displayPageNum) {
        this.displayPageNum = displayPageNum;
    }
}


