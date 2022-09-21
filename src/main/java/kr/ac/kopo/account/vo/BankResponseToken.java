package kr.ac.kopo.account.vo;

import lombok.Data;

@Data
public class BankResponseToken {
    private String access_token;
    private String token_type;
    private int expires_in;
    private String refresh_token;
    private String scope;
    private String user_seq_no;
}