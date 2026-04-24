package com.ee.pet.controller.Forum;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.ee.pet.common.BaseContext;
import com.ee.pet.common.R;
import com.ee.pet.entity.Comment;
import com.ee.pet.entity.Dto.UsersDto;
import com.ee.pet.entity.Forum;
import com.ee.pet.entity.Users;
import com.ee.pet.mapper.CommentMapper;
import com.ee.pet.mapper.ForumMapper;
import com.ee.pet.mapper.UsersMapper;
import com.ee.pet.service.CommentService;
import com.ee.pet.service.ForumService;
import com.ee.pet.service.UsersService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/forum")
public class Forumcontroller {
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private ForumMapper forumMapper;
    @Autowired
    private UsersService usersService;
    @Autowired
    private ForumService forumService;
    @Autowired
    UsersMapper usersMapper;
    @Autowired
    CommentService commentService;
    //发帖子
    @PostMapping("/sendforum")
    public R<String> sendforum(@RequestBody Forum forum){
        int currentId = BaseContext.getCurrentId();
        forum.setUserId(currentId);
        forumService.save(forum);
        return R.success("发表成功");
    }
    //获取论坛列表基本信息
    @GetMapping("/getforumlist")
    public R<List<Forum>> getforum(){
        List<Forum> list = forumService.list();
        for (Forum forum : list) {
            extracted(forum);
        }
        return R.success(list);
    }
    //根据标题搜索说说
    @GetMapping("/selectforum")
public R<List<Forum>> selectforum(@RequestParam(required = false) String title){
        if (title == null) {
          return getforum();
        }
        List<Forum> selectforum = forumService.selectforum(title);
        for (Forum forum : selectforum) {
            extracted(forum);
        }
        return R.success(selectforum);
    }
    //获取一条论坛具体信息
    @GetMapping("getforumt/{forumid}")
    public R<Forum> getforumt(@PathVariable int forumid){
        //每执行一次这个方法，对应帖子的浏览量就多一
//        log.info("id:{}",id);
        Forum forum = forumService.getById(forumid);
        if (forum == null) {
            return R.error("帖子不存在");
        }
        forumService.update(new UpdateWrapper<Forum>().eq("id",forumid).set("pageview",forum.getPageview()+1));
        extracted(forum);
        return R.success(forum);
    }
    //提取头像和名称方法
    private void extracted(Forum forum) {
        int userId = forum.getUserId();
        Users user = usersMapper.selectuserbyid(userId);
        forum.setIcon(user.getIcon());
        forum.setName(user.getUsername());
    }

    //获取论坛的评论
    @GetMapping("/getcomment/{forumid}")
    public R<List<Comment>> getcomment(@PathVariable int forumid){
        return commentService.getcomment(forumid);
    }
    //放到每日执行里面了
//    @GetMapping("/gettop")
//    public R<Forum> gettop(){
//        return forumService.gettop();
//    }

//    在论坛页面获取个人信息
    @GetMapping("/getuserinfo")
    public R<UsersDto> getuserinfo(){
        return R.success(usersService.getUserinfo());
    }
}
