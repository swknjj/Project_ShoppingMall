package com.icia.ShoppingMall.Page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PageDTO {
    private int page;
    private int perPageNum;

    public int getPageStart() {
        return (this.page-1) * perPageNum;
    }
    public PageDTO() {
        this.page = 1;
        this.perPageNum = 10;
    }
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        if(page <= 0 ) {
            this.page = 1;
        }else {
            this.page = page;
        }
    }
    public int getPerPageNum() {

        return perPageNum;
    }
    public void setPerPageNum(int pageCount) {
        int cnt = this.perPageNum;
        if(pageCount != cnt) {
            this.perPageNum = cnt;
        }else {
            this.perPageNum = pageCount;
        }
    }
}