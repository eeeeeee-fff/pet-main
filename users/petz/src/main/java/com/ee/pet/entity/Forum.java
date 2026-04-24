package com.ee.pet.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

@Data
@TableName("forum")
public class Forum implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;

    private int userId;
    private String title;

    private String content;

   private String imageUrl;
   //置顶 1置顶，2不置顶
   private int top;
   //评论总数
   private int commentCount;
   //浏览量
   private int pageview;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    /**
     * 用户姓名
     */
    @TableField(exist = false)
    private String name;
    /**
     * 用户图标
     */
    @TableField(exist = false)
    private String icon;
}
