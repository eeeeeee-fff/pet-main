package com.ee.pet.controller.Forum;

import com.ee.pet.common.R;
import com.ee.pet.entity.Questions;
import com.ee.pet.service.QuestionsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/question")
public class Questioncontroller {
    @Autowired
    private QuestionsService questionsService;
    @GetMapping("/{id}")
    public R<Questions> getquestion(@PathVariable int id){
        return questionsService.selectquestion(id);
    }
}
