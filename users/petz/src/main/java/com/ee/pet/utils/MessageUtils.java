package com.ee.pet.utils;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ee.pet.entity.Dto.Mresult;
import com.ee.pet.entity.Dto.MresultMessage;

public class MessageUtils {
    public static String getMessage(boolean isSystemMessage,String fromName,Object message){
        try {
            MresultMessage result = new MresultMessage();
            result.setSystem(isSystemMessage);
            result.setMessage(message);
            if (fromName!=null){
                result.setFromName(fromName);
            }
            //把字符串转成json格式的字符串
            ObjectMapper mapper = new ObjectMapper();
            return mapper.writeValueAsString(result);
        }catch (JsonProcessingException e){
            e.printStackTrace();
        }
        return null;
    }
}