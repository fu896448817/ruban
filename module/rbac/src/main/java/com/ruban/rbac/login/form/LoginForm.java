package com.ruban.rbac.login.form;

public class LoginForm {

    /**
     * 用户名
     * 
     */
    private String userno;

    /**
     * 密码
     * 
     */
    private String password;

    /**
     * 验证码
     * 
     */
    private String validation;

    public String getUserno() {
        return userno;
    }

    public void setUserno(String userno) {
        this.userno = userno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getValidation() {
        return validation;
    }

    public void setValidation(String validation) {
        this.validation = validation;
    }

}