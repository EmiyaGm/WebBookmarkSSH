package com.bookmark.utils;

import java.util.UUID;

/*
 * ��������ַ����Ĺ�����
 */

public class UUIDUtils {
	
	/*
	 * �������ַ���
	 */
	
	public static String getUUID(){
		
		return UUID.randomUUID().toString().replace("-", "");
	}

}
