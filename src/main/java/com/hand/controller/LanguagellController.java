package com.hand.controller;

import com.hand.entity.Film;
import com.hand.entity.Languageyy;
import com.hand.entity.Msg;
import com.hand.service.LanguageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public  Msg insert(@Valid Film film , BindingResult result){
        /*如果校验失败则返回错误信息*/
        Map<String,Object> map = new HashMap<String, Object>();
        if(result.hasErrors()){
            List<FieldError> error = result.getFieldErrors();
            for (FieldError fieldError: error) {
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("fieldErrors",map);
        }else {
            languageService.insert(film);
            return Msg.success();
        }

    }

    /*验证title是否存在*/
    @RequestMapping(value = "/checkTitle",method = RequestMethod.GET)
    @ResponseBody
    public Msg titleVarify(@RequestParam String name){
        System.out.println(name);
        /*先判断是否满足要求*/
        String regName = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5}$)";
        if (!name.matches(regName)) {
            return Msg.fail().add("check_msg","2-5为中文和3-16字符!!!");
        }
        int result = languageService.checkTite(name);
        if (result == 1) {
            return  Msg.success();
        }else {
            return Msg.fail().add("check_msg","title不可用");
        }
    }
}
