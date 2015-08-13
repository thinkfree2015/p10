package com.efeiyi;

import java.security.MessageDigest;
import java.util.Arrays;

/**
 * Created by Administrator on 2015/8/12.
 */
public final class WeiXinMessageDigest {

    /**
     * ����������
     *
     * @author liguocai
     */
    private static class SingletonHolder {
        static final WeiXinMessageDigest INSTANCE = new WeiXinMessageDigest();
    }

    /**
     * ��ȡ����
     *
     * @return
     */
    public static WeiXinMessageDigest getInstance() {
        return WeiXinMessageDigest.SingletonHolder.INSTANCE;
    }

    private MessageDigest digest;

    private WeiXinMessageDigest() {
        try {
            digest = MessageDigest.getInstance("SHA-1");
        } catch (Exception e) {
            throw new InternalError("init MessageDigest error:" + e.getMessage());
        }
    }


    /**
     * ���ֽ�����ת����16�����ַ���
     *
     * @param b
     * @return
     */
    private static String byte2hex(byte[] b) {
        StringBuilder sbDes = new StringBuilder();
        String tmp = null;
        for (int i = 0; i < b.length; i++) {
            tmp = (Integer.toHexString(b[i] & 0xFF));
            if (tmp.length() == 1) {
                sbDes.append("0");
            }
            sbDes.append(tmp);
        }
        return sbDes.toString();
    }

    private String encrypt(String strSrc) {
        String strDes = null;
        byte[] bt = strSrc.getBytes();
        digest.update(bt);
        strDes = byte2hex(digest.digest());
        return strDes;
    }

    /**
     * У�������ǩ���Ƿ�Ϸ�
     * <p/>
     * ����/У�����̣�
     * 1. ��token��timestamp��nonce�������������ֵ�������
     * 2. �����������ַ���ƴ�ӳ�һ���ַ�������sha1����
     * 3. �����߻�ü��ܺ���ַ�������signature�Աȣ���ʶ��������Դ��΢��
     *
     * @param signature
     * @param timestamp
     * @param nonce
     * @return
     */
    public boolean validate(String signature, String timestamp, String nonce) {
        //1. ��token��timestamp��nonce�������������ֵ�������
        String token = getToken();
        String[] arrTmp = {token, timestamp, nonce};
        Arrays.sort(arrTmp);
        StringBuffer sb = new StringBuffer();
        //2.�����������ַ���ƴ�ӳ�һ���ַ�������sha1����
        for (int i = 0; i < arrTmp.length; i++) {
            sb.append(arrTmp[i]);
        }
        String expectedSignature = encrypt(sb.toString());
        //3. �����߻�ü��ܺ���ַ�������signature�Աȣ���ʶ��������Դ��΢��
        if (expectedSignature.equals(signature)) {
            return true;
        }
        return false;
    }

    private String getToken() {
        return PalConst.getInstance().weiXinToken;
    }
}