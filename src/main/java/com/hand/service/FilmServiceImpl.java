package com.hand.service;

import com.hand.dao.FilmMapper;
import com.hand.dao.LanguageyyMapper;
import com.hand.entity.Film;
import com.hand.entity.Languageyy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FilmServiceImpl implements FilmService {
    @Autowired
    private FilmMapper filmMapper;

    @Autowired
    private LanguageyyMapper languageyyMapper;

    /*
    * 查询所有员工
    * */
    @Override
    public List<Film> getFilmAll() {
        return filmMapper.selectAlls("jia");
    }

    @Override
    public List<Film> selectAlls() {
        return filmMapper.selectFilmAlls();
    }

}
