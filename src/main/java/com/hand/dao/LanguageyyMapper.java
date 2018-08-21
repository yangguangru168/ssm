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
}