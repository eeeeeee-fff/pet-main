package com.ee.pets.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ee.common.annotation.Excel;
import com.ee.common.core.domain.BaseEntity;

/**
 * 宠物管理对象 pets
 * 
 * @author ee
 * @date 2025-03-12
 */
public class Pets extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long petId;

    /** 所属用户 */
    @Excel(name = "所属用户")
    private Long userId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 公母 */
    @Excel(name = "公母")
    private Long gender;

    /** 岁数（单位月份） */
    @Excel(name = "岁数", readConverterExp = "单=位月份")
    private Long age;

    /** 体型 */
    @Excel(name = "体型")
    private String bodytype;

    /** 性格 */
    @Excel(name = "性格")
    private String personality;

    /** 品种 */
    @Excel(name = "品种")
    private String breed;

    /** 分类 */
    @Excel(name = "分类")
    private String catOrDog;

    /** 是否接种疫苗 */
    @Excel(name = "是否接种疫苗")
    private Integer vaccination;

    /** 图片地址 */
    @Excel(name = "图片地址")
    private String imageUrl;

    /** 领养注释 */
    @Excel(name = "领养注释")
    private String adoptionInfo;

    /** 状态 */
    @Excel(name = "状态")
    private Long status;

    /** 月花销 */
    @Excel(name = "月花销")
    private Long monthMoney;

    /** 容易脏程度 */
    @Excel(name = "容易脏程度")
    private String cleanwithpet;

    /** 是否需要后院 */
    @Excel(name = "是否需要后院")
    private String environment;

    /** 宠物精力 */
    @Excel(name = "宠物精力")
    private Long energy;

    /** 脱毛 1 不易 2 易 */
    @Excel(name = "脱毛 1 不易 2 易")
    private Long hair;

    /** 匹配分数 */
    private Long score;

    public void setPetId(Long petId) 
    {
        this.petId = petId;
    }

    public Long getPetId() 
    {
        return petId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setGender(Long gender) 
    {
        this.gender = gender;
    }

    public Long getGender() 
    {
        return gender;
    }
    public void setAge(Long age) 
    {
        this.age = age;
    }

    public Long getAge() 
    {
        return age;
    }
    public void setBodytype(String bodytype) 
    {
        this.bodytype = bodytype;
    }

    public String getBodytype() 
    {
        return bodytype;
    }
    public void setPersonality(String personality) 
    {
        this.personality = personality;
    }

    public String getPersonality() 
    {
        return personality;
    }
    public void setBreed(String breed) 
    {
        this.breed = breed;
    }

    public String getBreed() 
    {
        return breed;
    }
    public void setCatOrDog(String catOrDog) 
    {
        this.catOrDog = catOrDog;
    }

    public String getCatOrDog() 
    {
        return catOrDog;
    }
    public void setVaccination(Integer vaccination) 
    {
        this.vaccination = vaccination;
    }

    public Integer getVaccination() 
    {
        return vaccination;
    }
    public void setImageUrl(String imageUrl) 
    {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() 
    {
        return imageUrl;
    }
    public void setAdoptionInfo(String adoptionInfo) 
    {
        this.adoptionInfo = adoptionInfo;
    }

    public String getAdoptionInfo() 
    {
        return adoptionInfo;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setMonthMoney(Long monthMoney) 
    {
        this.monthMoney = monthMoney;
    }

    public Long getMonthMoney() 
    {
        return monthMoney;
    }
    public void setCleanwithpet(String cleanwithpet) 
    {
        this.cleanwithpet = cleanwithpet;
    }

    public String getCleanwithpet() 
    {
        return cleanwithpet;
    }
    public void setEnvironment(String environment) 
    {
        this.environment = environment;
    }

    public String getEnvironment() 
    {
        return environment;
    }
    public void setEnergy(Long energy) 
    {
        this.energy = energy;
    }

    public Long getEnergy() 
    {
        return energy;
    }
    public void setHair(Long hair) 
    {
        this.hair = hair;
    }

    public Long getHair() 
    {
        return hair;
    }
    public void setScore(Long score) 
    {
        this.score = score;
    }

    public Long getScore() 
    {
        return score;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("petId", getPetId())
            .append("userId", getUserId())
            .append("name", getName())
            .append("gender", getGender())
            .append("age", getAge())
            .append("bodytype", getBodytype())
            .append("personality", getPersonality())
            .append("breed", getBreed())
            .append("catOrDog", getCatOrDog())
            .append("vaccination", getVaccination())
            .append("imageUrl", getImageUrl())
            .append("adoptionInfo", getAdoptionInfo())
            .append("status", getStatus())
            .append("monthMoney", getMonthMoney())
            .append("cleanwithpet", getCleanwithpet())
            .append("environment", getEnvironment())
            .append("energy", getEnergy())
            .append("hair", getHair())
            .append("score", getScore())
            .toString();
    }
}
