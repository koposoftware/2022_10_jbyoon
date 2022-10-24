package kr.ac.kopo.account.vo;

import lombok.Data;

@Data
public class AuthorizationRequestVO {
	private String client_id;
    private String scope;
    private String redirect_uri;
    private String auth_type;
    private String response_type;
    private String state;
}
