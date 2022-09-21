package kr.ac.kopo.account.vo;

import java.util.List;

import lombok.Data;

@Data
public class BankAccountSearchResponseVO {
    private String api_tran_id;
    private String rsp_code;
    private String rsp_message;
    private String api_tran_dtm;
    private String user_name;
    private String res_cnt;
    private List<AccountVO> res_list;
}
