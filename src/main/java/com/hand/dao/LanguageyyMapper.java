package com.hand.dao;

import com.hand.entity.Film;
import com.hand.entity.Languageyy;

import java.util.List;

public interface LanguageyyMapper {
    /*查询language*/
    List<Languageyy> selectLgAlls();

    /*添加*/
    Film insertData(Film film);

    /*检查是否存在title*/
    Film selectTitle(String name);

    /*根据Id查询film数据*/
    Film selectFilm(Integer id);

    /*编辑*/
    void updateData(Film film);

    /*删除*/
    void deleteData(Integer id);

    /*批量删除*/
    void deleteListData(List<Integer> list);
}