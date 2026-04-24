package com.ee.users.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ee.common.annotation.Excel;
import com.ee.common.core.domain.BaseEntity;

/**
 * 用户管理对象 users
 * 
 * @author ee
 * @date 2025-03-12
 */
public class Users extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long userId;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    /** 密码 */
    private String password;

    /** 头像地址 */
    private String icon;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 手机号 */
    @Excel(name = "手机号")
    private String phone;

    /** 性别 */
    @Excel(name = "性别")
    private Long gender;

    /** 性格 */
    @Excel(name = "性格")
    private String personality;

    /** 家里有无老人小孩 */
    @Excel(name = "家里有无老人小孩")
    private Long children;

    /** 年龄 */
    @Excel(name = "年龄")
    private Long age;

    /** 薪资范围 */
    @Excel(name = "薪资范围")
    private Long wage;

    /** 养宠经验 1有 2无 */
    @Excel(name = "养宠经验 1有 2无")
    private Integer experience;

    /** 偏爱猫还是狗 */
    @Excel(name = "偏爱猫还是狗")
    private String catOrDog;

    /** 一周能陪伴的时间 */
    @Excel(name = "一周能陪伴的时间")
    private Long timewithpet;

    /** 多长时间清洁一次 */
    @Excel(name = "多长时间清洁一次")
    private String cleanwithpet;

    /** 钟爱体型 */
    @Excel(name = "钟爱体型")
    private String bodytypewithpet;

    /** 有无后院 */
    @Excel(name = "有无后院")
    private String environment;

    /** 偏爱公母 */
    @Excel(name = "偏爱公母")
    private Long petgender;

    /** 反馈表的内容 */
    @Excel(name = "反馈表的内容")
    private String questionFk;

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setIcon(String icon) 
    {
        this.icon = icon;
    }

    public String getIcon() 
    {
        return icon;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setGender(Long gender) 
    {
        this.gender = gender;
    }

    public Long getGender() 
    {
        return gender;
    }
    public void setPersonality(String personality) 
    {
        this.personality = personality;
    }

    public String getPersonality() 
    {
        return personality;
    }
    public void setChildren(Long children) 
    {
        this.children = children;
    }

    public Long getChildren() 
    {
        return children;
    }
    public void setAge(Long age) 
    {
        this.age = age;
    }

    public Long getAge() 
    {
        return age;
    }
    public void setWage(Long wage) 
    {
        this.wage = wage;
    }

    public Long getWage() 
    {
        return wage;
    }
    public void setExperience(Integer experience) 
    {
        this.experience = experience;
    }

    public Integer getExperience() 
    {
        return experience;
    }
    public void setCatOrDog(String catOrDog) 
    {
        this.catOrDog = catOrDog;
    }

    public String getCatOrDog() 
    {
        return catOrDog;
    }
    public void setTimewithpet(Long timewithpet) 
    {
        this.timewithpet = timewithpet;
    }

    public Long getTimewithpet() 
    {
        return timewithpet;
    }
    public void setCleanwithpet(String cleanwithpet) 
    {
        this.cleanwithpet = cleanwithpet;
    }

    public String getCleanwithpet() 
    {
        return cleanwithpet;
    }
    public void setBodytypewithpet(String bodytypewithpet) 
    {
        this.bodytypewithpet = bodytypewithpet;
    }

    public String getBodytypewithpet() 
    {
        return bodytypewithpet;
    }
    public void setEnvironment(String environment) 
    {
        this.environment = environment;
    }

    public String getEnvironment() 
    {
        return environment;
    }
    public void setPetgender(Long petgender) 
    {
        this.petgender = petgender;
    }

    public Long getPetgender() 
    {
        return petgender;
    }
    public void setQuestionFk(String questionFk) 
    {
        this.questionFk = questionFk;
    }

    public String getQuestionFk() 
    {
        return questionFk;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("username", getUsername())
            .append("password", getPassword())
            .append("icon", getIcon())
            .append("email", getEmail())
            .append("phone", getPhone())
            .append("gender", getGender())
            .append("personality", getPersonality())
            .append("children", getChildren())
            .append("age", getAge())
            .append("wage", getWage())
            .append("experience", getExperience())
            .append("catOrDog", getCatOrDog())
            .append("timewithpet", getTimewithpet())
            .append("cleanwithpet", getCleanwithpet())
            .append("bodytypewithpet", getBodytypewithpet())
            .append("environment", getEnvironment())
            .append("petgender", getPetgender())
            .append("questionFk", getQuestionFk())
            .toString();
    }
}
