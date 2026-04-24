package com.ee.pet.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ee.pet.common.R;
import com.ee.pet.entity.Answers;
import com.ee.pet.entity.Questions;
import com.ee.pet.mapper.AnswersMapper;
import com.ee.pet.mapper.QuestionsMapper;
import com.ee.pet.service.QuestionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionsServiceimpl extends ServiceImpl<QuestionsMapper, Questions> implements QuestionsService {
    @Autowired
    private AnswersMapper answersMapper;
    @Override
    public R<Questions> selectquestion(int id) {
        Questions question = getOne(new QueryWrapper<Questions>().eq("id", id));
       if (question==null){
           return R.error("问题不存在");
       }
        int answerId = question.getAnswerId();
        //回答都有
        Answers answers = answersMapper.selectById(answerId);
        return null;
    }
}
