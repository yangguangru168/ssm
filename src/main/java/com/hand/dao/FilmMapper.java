package com.hand.dao;

import com.hand.entity.Film;

import java.util.List;

public interface FilmMapper {

    Film selectAll(int id);

    List<Film> selectAlls(String name);

    void delete(int id);

    /*联表查询*/
    List<Film> selectFilmAlls();
}