package com.ee.pet.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ee.pet.common.R;
import com.ee.pet.entity.Answers;
import com.ee.pet.entity.Dto.Questionsdto;
import com.ee.pet.entity.Questions;
import com.ee.pet.mapper.AnswersMapper;
import com.ee.pet.mapper.QuestionsMapper;
import com.ee.pet.service.QuestionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

@Service
public class QuestionsServiceimpl extends ServiceImpl<QuestionsMapper, Questions> implements QuestionsService {
    @Autowired
    private AnswersMapper answersMapper;

    @Override
    public R<Questionsdto> selectquestion(int id) {
        Questions question;
        try {
            question = getOne(new QueryWrapper<Questions>().eq("id", id));
        } catch (DataAccessException ex) {
            return R.error("题库未初始化");
        }

        if (question == null) {
            return R.error("问题不存在");
        }

        Answers answers;
        try {
            answers = answersMapper.selectById(question.getAnswerId());
        } catch (DataAccessException ex) {
            return R.error("题库未初始化");
        }

        if (answers == null) {
            return R.error("答案不存在");
        }

        Questionsdto questionsdto = new Questionsdto();
        questionsdto.setQuestionId(question.getId());
        questionsdto.setQuestionTitle(question.getQuestionTitle());
        questionsdto.setAnswer1(answers.getAnswer1());
        questionsdto.setAnswer2(answers.getAnswer2());
        questionsdto.setAnswer3(answers.getAnswer3());
        questionsdto.setAnswer4(answers.getAnswer4());
        return R.success(questionsdto);
    }
}
