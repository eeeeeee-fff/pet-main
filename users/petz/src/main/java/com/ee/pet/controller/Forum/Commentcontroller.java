package com.ee.pet.controller.Forum;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.ee.pet.common.BaseContext;
import com.ee.pet.common.R;
import com.ee.pet.entity.Comment;
import com.ee.pet.entity.Forum;
import com.ee.pet.service.CommentService;
import com.ee.pet.service.ForumService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/comment")
public class Commentcontroller {
    @Autowired
    private CommentService commentService;
    @Autowired
    private ForumService forumService;
    @PostMapping("/sendcomment")
    public R<String> sendcomment(@RequestBody Comment comment){
        log.info("{}",comment);
        int currentId = BaseContext.getCurrentId();
        comment.setUserId(currentId);
        //评论的帖子的count要加一
        int forumId = comment.getForumId();
        forumService.update(new UpdateWrapper<Forum>().eq("id",forumId).setSql("comment_count=comment_count+1"));
        commentService.save(comment);
        return R.success("评论成功");
    }
}
