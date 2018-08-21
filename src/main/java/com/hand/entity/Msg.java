package com.hand.entity;

import java.util.HashMap;
import java.util.Map;

/*
* 通用的返回json数据的类
* */
public class Msg {
    /*状态码,100成功，200失败*/
    private int code;
    /*提示信息*/
    private  String msg;
    /*用户返回个浏览器的数据*/

    private Map<String,Object> map = new HashMap<String, Object>();

    public static Msg success(){
        Msg msg = new Msg();
        msg.setCode(100);
        msg.setMsg("处理成功");
        return  msg;
    }
    public static Msg fail(){
        Msg msg = new Msg();
        msg.setCode(200);
        msg.setMsg("处理失败");
        return  msg;
    }

    public Msg add(String key,Object values){
        this.getMap().put(key,values);
        return this;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
