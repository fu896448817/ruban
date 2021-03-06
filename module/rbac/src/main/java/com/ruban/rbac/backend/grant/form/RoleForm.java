package com.ruban.rbac.backend.grant.form;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import org.springframework.validation.annotation.Validated;

import com.ruban.rbac.backend.BackendForm;

@Validated
public class RoleForm extends BackendForm implements Serializable {

    private static final long serialVersionUID = -8068180251093563415L;

    /** 实体ID **/
    private Long id;

    /** 姓名 **/
    @NotNull(message = "{person.name.notnull}")
    private String name;

    /** 角色类型 **/
    private String type;

    /** 备注说明 **/
    private String memo;

    /** 所属公司 **/
    @NotNull(message = "{person.company.notnull}")
    private Long companyId;

    /** 持有的锁 **/
    private String holdLock;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public String getHoldLock() {
        return holdLock;
    }

    public void setHoldLock(String holdLock) {
        this.holdLock = holdLock;
    }

}
