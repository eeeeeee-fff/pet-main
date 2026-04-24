package com.ee.pet.service;

import com.ee.pet.common.R;
import com.ee.pet.entity.Questions;

public interface QuestionsService {
    R<Questions> selectquestion(int id);
}
