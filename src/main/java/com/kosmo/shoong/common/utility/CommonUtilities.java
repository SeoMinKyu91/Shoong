package com.kosmo.shoong.common.utility;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtilities {
	public static boolean isCorrectNaming(String value) {			
		for(int i=0;i < value.length();i++) {
			//Character클래스의 메소드 사용
			if(!(value.codePointAt(i)>='0' && value.codePointAt(i)<='9'))
				return false;
			else if(!(value.codePointAt(i)>='a' && value.codePointAt(i)<='z'))
				return false;
			else if(!(value.codePointAt(i)>='A' && value.codePointAt(i)<='Z'))
				return false;
		}
		return true;
	}/////////
	
	//두 날짜 차이를 반환하는 메소드]
	//반환타입:long
	//매개변수:String타입의 두 날짜,날짜패턴,구분자(단위)
	public static long getDifferenceDates(
			String stFDate,
			String stSDate,
			String pattern,
			char delim
			) throws ParseException {
		//1]매개변수에 전달된 pattern으로 SimpleDateFormat객체생성
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
		//2]String -> Date:parse()
		Date fDate = dateFormat.parse(stFDate);
		Date sDate = dateFormat.parse(stSDate);
		//3]시간차 구하기:getTime()
		long fTime=fDate.getTime();
		long sTime=sDate.getTime();
		long diff = sTime-fTime;
		//4]매개변수 delim에 따른 날짜 차이 반환
		switch(Character.toUpperCase(delim)) {
			case 'D':return diff/(24*60*60*1000);
			case 'H':return diff/(60*60*1000);
			case 'M':return diff/(60*1000);
			default:return diff/(1000);
		}
		
	}/////////////
	//이름에서 초성을 구해 초성을 반환하는 메소드]
	public static char getFirstCharacter(String name) {
		//김길동->ㄱ,박길동->ㅂ,홍길동->ㅎ
		char initial=name.trim().toCharArray()[0];
		/*
		//방법1]
		char[] startChar = {'가','나','다','라','마','바','사','아','자','차','카','타','파','하'};
		char[] endChar = {'낗','닣','띻','맇','밓','삫','앃','잏','찧','칳','킿','팋','핗','힣'};
		char[] returnChar = {'ㄱ','ㄴ','ㄷ','ㄹ','ㅁ','ㅂ','ㅅ','ㅇ','ㅈ','ㅊ','ㅋ','ㅌ','ㅍ','ㅎ'};
		
		for(int i=0;i < startChar.length;i++) {
			if(initial >=startChar[i] && initial <=endChar[i])
				return returnChar[i];
		}*/
		//방법2]
		if(initial >='가' && initial < '나') return 'ㄱ';
		else if(initial >='나' && initial < '다') return 'ㄴ';
		else if(initial >='다' && initial < '라') return 'ㄷ';
		else if(initial >='라' && initial < '마') return 'ㄹ';
		else if(initial >='마' && initial < '바') return 'ㅁ';
		else if(initial >='바' && initial < '사') return 'ㅂ';
		else if(initial >='사' && initial < '아') return 'ㅅ';
		else if(initial >='아' && initial < '자') return 'ㅇ';
		else if(initial >='자' && initial < '차') return 'ㅈ';
		else if(initial >='차' && initial < '카') return 'ㅊ';
		else if(initial >='카' && initial < '타') return 'ㅋ';
		else if(initial >='타' && initial < '파') return 'ㅌ';
		else if(initial >='파' && initial < '하') return 'ㅍ';
		else if(initial >='하' && initial <= '힣') return 'ㅎ';
		
		
		//초성이 한글이 아닌 경우
		return '0';
	}////////////
	
}/////////////CommonUtilities
