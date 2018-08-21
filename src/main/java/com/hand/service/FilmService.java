package com.hand.service;


import com.hand.entity.Film;
import com.hand.entity.Languageyy;

import java.util.List;

public interface FilmService {
     List<Film> getFilmAll();

     /*关联查询*/
     List<Film> selectAlls();

}
