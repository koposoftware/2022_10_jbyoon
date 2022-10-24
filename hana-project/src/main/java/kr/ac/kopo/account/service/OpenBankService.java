package kr.ac.kopo.account.service;

import org.springframework.stereotype.Service;

import kr.ac.kopo.account.vo.AccountSearchRequestVO;
import kr.ac.kopo.account.vo.AccountTransferRequestVO;
import kr.ac.kopo.account.vo.AccountTransferResponseVO;
import kr.ac.kopo.account.vo.BankAccountSearchResponseVO;
import kr.ac.kopo.account.vo.BankBalanceRequestVO;
import kr.ac.kopo.account.vo.BankBalanceResponseVO;
import kr.ac.kopo.account.vo.BankRequestToken;
import kr.ac.kopo.account.vo.BankResponseToken;
import kr.ac.kopo.util.OpenBankApiClient;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OpenBankService {

	private final OpenBankApiClient openBankApiClient;
	
    public BankResponseToken requestToken(BankRequestToken bankRequestToken){
        return openBankApiClient.requestToken(bankRequestToken);
    }
    public BankAccountSearchResponseVO findAccount(AccountSearchRequestVO accountSearchRequestVO){
       return openBankApiClient.requestAccountList(accountSearchRequestVO);
    }
    public BankBalanceResponseVO findBalance(String access_token, BankBalanceRequestVO bankBalanceRequestVO){
        return openBankApiClient.requestBalance(bankBalanceRequestVO, access_token);
    }
    public AccountTransferResponseVO accountTransfer(String access_token, AccountTransferRequestVO accountTransferRequestVO){
        return openBankApiClient.requestTransfer(access_token, accountTransferRequestVO);
    }
    
}

