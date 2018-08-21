package com.hand.service;

import com.hand.dao.LanguageyyMapper;
import com.hand.entity.Film;
import com.hand.entity.Languageyy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LanguageServiceImpl implements LanguageService {

    @Autowired
    private LanguageyyMapper languageyyMapper;
    @Override
    public List<Languageyy> selectLgAll() {
        return languageyyMapper.selectLgAlls();
    }

    @Override
    public void insert(Film film) {
        languageyyMapper.insertData(film);
    }
}
