package kr.ac.kopo.pay.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import kr.ac.kopo.acctbook.controller.AcctBookController;
import kr.ac.kopo.pay.dao.OneqPayDAO;
import kr.ac.kopo.pay.vo.OneqPayVO;

@Service
public class OneqPayService {

	@Autowired
	private OneqPayDAO dao;
	@Autowired
	private AcctBookController abController;
	
	private Logger logger = LoggerFactory.getLogger(OneqPayService.class);

    public byte[] generateQRCode(String qrContent, int width, int height) {
        try {
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix bitMatrix = qrCodeWriter.encode(qrContent, BarcodeFormat.QR_CODE, width, height);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", byteArrayOutputStream);
            return byteArrayOutputStream.toByteArray();
        } catch (WriterException e) {
            logger.error(e.getMessage(), e);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return null;
    }
    
    // DB 저장
    public OneqPayVO insertTranLog(OneqPayVO vo) {    	
    	vo = dao.insertTranLog(vo);
    	return vo;
//		abController.addCashTran(map.get("tranType"), map.get("amount"), map.get("categoryCode"), map.get("opponentName")
//								, 2, map.get("tranDt"), map.get("itemName"));
    }

    public OneqPayVO selectPayAcctInfo(String id) {
    	OneqPayVO vo = dao.selectPayAcctInfo(id);
		return vo;
	}
}
