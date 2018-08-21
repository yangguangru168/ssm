package com.hand.service;

import com.hand.entity.Film;
import com.hand.entity.Languageyy;

import java.util.List;

public interface LanguageService {
    /*查询表Language*/
    List<Languageyy> selectLgAll();
    /*保存数据*/
    void insert(Film film);

    int checkTite(String name);
}
