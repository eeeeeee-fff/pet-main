package com.ee.pet.service;

import com.ee.pet.common.R;
import com.ee.pet.entity.Dto.Questionsdto;

public interface QuestionsService {
    R<Questionsdto> selectquestion(int id);
}
