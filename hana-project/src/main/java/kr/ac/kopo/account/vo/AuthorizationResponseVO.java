package kr.ac.kopo.account.vo;

import lombok.Data;

@Data
public class AuthorizationResponseVO {
    private String code;
    private String scope;
    private String client_info;
    private String state;
}
