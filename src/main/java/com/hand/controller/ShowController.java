package com.hand.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hand.entity.Film;
import com.hand.entity.Msg;
import com.hand.service.FilmService;
import com.hand.service.FilmServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Hashtable;
import java.util.List;

@Controller
public class ShowController {

    @Resource
    private FilmService filmService;

    @RequestMapping("/film")
    @ResponseBody
    public Msg getFilmPage(@RequestParam Integer pn, Model model){
        PageHelper.startPage(pn,5);
        List<Film> films = filmService.selectAlls();
        for (Film list:
             films) {
            System.out.println("数据"+list);
        }
        PageInfo page = new PageInfo(films,5);
        System.out.println(page);
        return Msg.success().add("pageInfo",page);
    }




    /*
    * 查询
    * */
    //@RequestMapping("/film")
    public String getFil(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){

        PageHelper.startPage(pn,2);
        List<Film> films = filmService.getFilmAll();
        /*连续几页*/
        PageInfo page = new PageInfo(films,4);
        model.addAttribute("pageInfo",page);
        System.out.println(page.getNavigatepageNums());
        return "success";
    }

}
