package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.SubBook;

public interface BookService {

	int addBooks(Book book);

	void delete(String[] arr);

	Book queryoneBook(Integer id);

	void update(Book book);

	PageBean<SubBook> selectAllByPageHelper(int pageNow);

	List<SubBook> list();
	
	List<SubBook> list2();

	PageBean<SubBook> selectAllByPageHelperAndWhere(Book where, int pageNow);

	List<SubBook> queryBooks(String[] arr);

	Book validateBName(String bname);
	
}
