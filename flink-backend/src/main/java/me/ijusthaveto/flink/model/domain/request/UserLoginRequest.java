package me.ijusthaveto.flink.model.domain.request;


import lombok.Data;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * @author: ijusthaveto
 * @create: 2023-11-01
 */
@Data
public class UserLoginRequest implements Serializable {

    private static final long serialVersionUID = 3191241716373120793L;

    /**
     * 用户账号
     */
    private String userAccount;

    /**
     * 用户密码
     */
    private String userPassword;


}
