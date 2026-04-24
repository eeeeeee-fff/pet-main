package com.ee.donations.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ee.common.annotation.Excel;
import com.ee.common.core.domain.BaseEntity;

/**
 * 宠物捐赠对象 donations
 * 
 * @author ee
 * @date 2025-03-26
 */
public class Donations extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long donationId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 宠物名称 */
    @Excel(name = "宠物名称")
    private String name;

    /** 性别 */
    @Excel(name = "性别")
    private Long gender;

    /** 年纪 */
    @Excel(name = "年纪")
    private Long age;

    /** 性格 */
    @Excel(name = "性格")
    private String personality;

    /** 品种 */
    @Excel(name = "品种")
    private String breed;

    /** 猫还是狗 */
    @Excel(name = "猫还是狗")
    private String catOrDog;

    /** 图片链接 */
    @Excel(name = "图片链接")
    private String imageUrl;

    /** 接种疫苗 */
    @Excel(name = "接种疫苗")
    private Integer vaccination;

    /** 领养备注 */
    @Excel(name = "领养备注")
    private String adoptionInfo;

    /** 捐赠人真实姓名 */
    @Excel(name = "捐赠人真实姓名")
    private String donorName;

    /** 捐赠人手机号 */
    @Excel(name = "捐赠人手机号")
    private String donorContact;

    /** 捐赠日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "捐赠日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date donationDate;

    /** 审核通过时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "审核通过时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date passDate;

    /** 审核状态 */
    @Excel(name = "审核状态")
    private Long status;

    public void setDonationId(Long donationId) 
    {
        this.donationId = donationId;
    }

    public Long getDonationId() 
    {
        return donationId;
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
    public void setImageUrl(String imageUrl) 
    {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() 
    {
        return imageUrl;
    }
    public void setVaccination(Integer vaccination) 
    {
        this.vaccination = vaccination;
    }

    public Integer getVaccination() 
    {
        return vaccination;
    }
    public void setAdoptionInfo(String adoptionInfo) 
    {
        this.adoptionInfo = adoptionInfo;
    }

    public String getAdoptionInfo() 
    {
        return adoptionInfo;
    }
    public void setDonorName(String donorName) 
    {
        this.donorName = donorName;
    }

    public String getDonorName() 
    {
        return donorName;
    }
    public void setDonorContact(String donorContact) 
    {
        this.donorContact = donorContact;
    }

    public String getDonorContact() 
    {
        return donorContact;
    }
    public void setDonationDate(Date donationDate) 
    {
        this.donationDate = donationDate;
    }

    public Date getDonationDate() 
    {
        return donationDate;
    }
    public void setPassDate(Date passDate) 
    {
        this.passDate = passDate;
    }

    public Date getPassDate() 
    {
        return passDate;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("donationId", getDonationId())
            .append("userId", getUserId())
            .append("name", getName())
            .append("gender", getGender())
            .append("age", getAge())
            .append("personality", getPersonality())
            .append("breed", getBreed())
            .append("catOrDog", getCatOrDog())
            .append("imageUrl", getImageUrl())
            .append("vaccination", getVaccination())
            .append("adoptionInfo", getAdoptionInfo())
            .append("donorName", getDonorName())
            .append("donorContact", getDonorContact())
            .append("donationDate", getDonationDate())
            .append("passDate", getPassDate())
            .append("status", getStatus())
            .toString();
    }
}
