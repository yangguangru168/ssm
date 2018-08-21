package com.hand.entity;

import javax.validation.constraints.Pattern;
import java.util.List;

public class Film {
    private Integer filmId;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)",message = "中文2-5，字符3-6")
    private String title;

    @Pattern(regexp = "(^[\\u2E80-\\u9FFF]{6,100}$)",message = "110《中文》6")
    private String description;

    private Integer languageId;

    private Languageyy languageyy;

    public Languageyy getLanguageyy() {
        return languageyy;
    }

    public void setLanguageyy(Languageyy languageyy) {
        this.languageyy = languageyy;
    }

    public Integer getFilmId() {
        return filmId;
    }

    public void setFilmId(Integer filmId) {
        this.filmId = filmId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getLanguageId() {
        return languageId;
    }

    public void setLanguageId(Integer languageId) {
        this.languageId = languageId;
    }


    @Override
    public String toString() {
        return "Film{" +
                "filmId=" + filmId +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", languageId=" + languageId +
                ", languageyy=" + languageyy +
                '}';
    }
}