package com.hand.controller;

import com.hand.entity.Film;
import com.hand.entity.Languageyy;
import com.hand.entity.Msg;
import com.hand.service.LanguageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class LanguagellController {

    @Autowired
    private LanguageService languageService;
    @RequestMapping("/language")
    @ResponseBody
    public Msg getLangguage(){
        List<Languageyy> list = languageService.selectLgAll();
        return Msg.success().add("lge",list);
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public  Msg insert(Film film){
        System.out.println(film);
        languageService.insert(film);
        return Msg.success();
    }
}
