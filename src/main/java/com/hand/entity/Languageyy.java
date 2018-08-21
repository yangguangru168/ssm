package com.hand.entity;

public class Languageyy {
    private Integer languageId;

    private String languagel;

    public Integer getLanguageId() {
        return languageId;
    }

    public void setLanguageId(Integer languageId) {
        this.languageId = languageId;
    }

    public String getLanguagel() {
        return languagel;
    }

    public void setLanguagel(String languagel) {
        this.languagel = languagel == null ? null : languagel.trim();
    }

    @Override
    public String toString() {
        return "Languageyy{" +
                "languageId=" + languageId +
                ", languagel='" + languagel + '\'' +
                '}';
    }
}