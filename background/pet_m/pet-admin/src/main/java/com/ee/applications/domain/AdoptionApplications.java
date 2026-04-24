package com.ee.applications.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ee.common.annotation.Excel;
import com.ee.common.core.domain.BaseEntity;

/**
 * 宠物领养对象 adoption_applications
 * 
 * @author ee
 * @date 2025-03-25
 */
public class AdoptionApplications extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long applicationId;

    /** 宠物id */
    @Excel(name = "宠物id")
    private Long petId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 申请人姓名 */
    @Excel(name = "申请人姓名")
    private String applicantName;

    /** 申请人联系方式 */
    @Excel(name = "申请人联系方式")
    private String applicantContact;

    /** 申请人居住地址 */
    @Excel(name = "申请人居住地址")
    private String applicantAddress;

    /** 申请人年纪 */
    @Excel(name = "申请人年纪")
    private Long applicantAge;

    /** 申请日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "申请日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date applicationDate;

    /** 通过日期 */

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "通过日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date passDate;

    /** 状态 */
    @Excel(name = "状态")
    private Long status;

    public void setApplicationId(Long applicationId) 
    {
        this.applicationId = applicationId;
    }

    public Long getApplicationId() 
    {
        return applicationId;
    }
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
    public void setApplicantName(String applicantName) 
    {
        this.applicantName = applicantName;
    }

    public String getApplicantName() 
    {
        return applicantName;
    }
    public void setApplicantContact(String applicantContact) 
    {
        this.applicantContact = applicantContact;
    }

    public String getApplicantContact() 
    {
        return applicantContact;
    }
    public void setApplicantAddress(String applicantAddress) 
    {
        this.applicantAddress = applicantAddress;
    }

    public String getApplicantAddress() 
    {
        return applicantAddress;
    }
    public void setApplicantAge(Long applicantAge) 
    {
        this.applicantAge = applicantAge;
    }

    public Long getApplicantAge() 
    {
        return applicantAge;
    }
    public void setApplicationDate(Date applicationDate) 
    {
        this.applicationDate = applicationDate;
    }

    public Date getApplicationDate() 
    {
        return applicationDate;
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
            .append("applicationId", getApplicationId())
            .append("petId", getPetId())
            .append("userId", getUserId())
            .append("applicantName", getApplicantName())
            .append("applicantContact", getApplicantContact())
            .append("applicantAddress", getApplicantAddress())
            .append("applicantAge", getApplicantAge())
            .append("applicationDate", getApplicationDate())
            .append("passDate", getPassDate())
            .append("status", getStatus())
            .toString();
    }
}
