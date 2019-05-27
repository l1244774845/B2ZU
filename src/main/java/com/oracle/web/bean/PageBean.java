package com.oracle.web.bean;

import java.io.Serializable;
import java.util.List;

public class PageBean<SubMonster> implements Serializable{

	private static final long serialVersionUID = 1L;

	private int pageNow;//��ǰҳ
	
	private int counts;//��¼����
	
	//private int pages;//�ܹ��ж���ҳ
	
	private int pageSize;//һҳ��ʽ������
	
	private List<SubMonster>  beanList;//��ҳ������

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getCounts() {
		return counts;
	}

	public void setCounts(int counts) {
		this.counts = counts;
	}

	public int getPages() {
		
		int pages=this.counts/this.pageSize;
		
		return (this.counts%this.pageSize==0)?pages:pages+1;
	}

//	public void setPages(int pages) {
//		this.pages = pages;
//	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public List<SubMonster> getBeanList() {
		return beanList;
	}

	public void setBeanList(List<SubMonster> beanList) {
		this.beanList = beanList;
	}

	@Override
	public String toString() {
		return "PageBean [pageNow=" + pageNow + ", counts=" + counts + ", pageSize=" + pageSize
				+ ", beanList=" + beanList + "]";
	}

	
	

}
