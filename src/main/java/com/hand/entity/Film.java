package com.hand.entity;

import java.util.List;

public class Film {
    private Integer filmId;

    private String title;

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