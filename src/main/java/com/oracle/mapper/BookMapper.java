package com.oracle.mapper;

import com.oracle.web.bean.Book;

import com.oracle.web.bean.SubBook;

import java.util.List;

public interface BookMapper {

    int deleteByPrimaryKey(String[] arr);

    int insert(Book record);

    Book selectByPrimaryKey(Integer bid);

    List<SubBook> selectAll();
    
    List<Book> selectAll2();

    int updateByPrimaryKey(Book record);

	List<SubBook> selectAllByPageHelper();

	List<SubBook> selectAllByPageHelperAndWhere(Book where);

	List<Book> queryBooks(String[] arr);
    
}