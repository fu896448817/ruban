package com.ruban.rbac.service;

import java.util.List;

import com.ruban.framework.dao.helper.Condition;
import com.ruban.framework.dao.helper.QueryPage;
import com.ruban.framework.dao.helper.ResultInfo;
import com.ruban.rbac.domain.organization.Company;

/**
 * 组织结构：公司
 * 
 * @author ruban
 *
 */
public interface ICompanyService {

    /**
     * 查询所有的公司列表
     * 
     * @return
     */
    public List<Company> selectAll();

    /**
     * 分页查询
     * 
     * @param dto
     * @return
     */
    public ResultInfo<Company> selectByPage(Condition<Company> condition);

    /**
     * 新建公司
     * 
     * @param company
     */
    public void insert(Company company);
}
