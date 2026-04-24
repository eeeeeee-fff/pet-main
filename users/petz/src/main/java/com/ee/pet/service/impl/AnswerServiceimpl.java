package com.ee.pet.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ee.pet.entity.Answers;
import com.ee.pet.mapper.AnswersMapper;
import com.ee.pet.service.AnswerService;
import org.springframework.stereotype.Service;

@Service
public class AnswerServiceimpl extends ServiceImpl<AnswersMapper, Answers> implements AnswerService {
}
