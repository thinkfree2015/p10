package com.efeiyi.ec.consumer.organization.service;

import java.util.Map;


/**
 * Created with IntelliJ IDEA.
 * User: ming
 * Date: 12-12-11
 * Time: 下午12:19
 * To change this template use File | Settings | File Templates.
     */
public interface SmsCheckManager {

    public String send(String phone, Map<String,String> param, String tpl_id, String template);
    public String send(String phone, Map<String,String> param, Map<String,String> temlateMap);

}
