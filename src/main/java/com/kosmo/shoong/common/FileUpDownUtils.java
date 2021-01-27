package com.kosmo.shoong.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileUpDownUtils {

	// [파일 이름 중복 체크용 메소드]
	public static String getNewFileName(String path, String fileName) {

		// fileName=원격.txt
		File file = new File(path + File.separator + fileName);

		if (!file.exists()) {

			return fileName;
		} else {
			String ext = fileName.substring(fileName.lastIndexOf(".") + 1).trim();
			String fileNameExcludeExt = fileName.substring(0, fileName.lastIndexOf("."));
			
			String newFileName;
			while (true) {

				newFileName = "";

				if (fileNameExcludeExt.indexOf("_") != -1) {// 파일명에 _가 포함됨

					String[] arrFiles = fileNameExcludeExt.split("_");
					String lastName = arrFiles[arrFiles.length - 1];

					try {

						int index = Integer.parseInt(lastName);
						for (int i = 0; i < arrFiles.length; i++) {
							if (i != arrFiles.length - 1)
								newFileName += arrFiles[i] + "_";
							else
								//newFileName += String.valueOf(index + 1);
								newFileName += String.valueOf(index + 1);
						}

						newFileName += "." + ext;

					} catch (Exception e) {

						newFileName += fileNameExcludeExt + "_1." + ext;
					}

				} else {// _가 없음

					newFileName += fileNameExcludeExt + "_1." + ext;
				}
				File f = new File(path + File.separator + newFileName);

				if (f.exists()) {
					fileNameExcludeExt = newFileName.substring(0, newFileName.lastIndexOf("."));
					continue;
				} else
					break;
			} //////////// while

			return newFileName;
		}
	}

	// 다운로드 관련 로직]
	public static void download(HttpServletRequest request, HttpServletResponse response, String filename,
			String directory) {
		try {
			/*
			 * 다운로드 원리] 
			 * 1]웹브라우저가 인식하지 못하는 컨텐트타입을 응답헤더에
			 *  설정해주면 웹브라우저는 자체 다운로드 창을 띄운다. 
			 * 2]서버에
			 * 저장된 파일을 출력스트림을 통해 웹브라우저에 출력한다.
			 */
		
			// 2]파일이 저장된 서버의 물리적 경로 얻기]
			
			String saveDirectory = request.getSession().getServletContext().getRealPath(directory);
			// 3]파일 크기를 얻기 위한 파일 객체 생성
			// -다운로드시 프로그래스바를 표시하기 위함.
			// System.out.println(saveDirectory+File.separator+filename);
			File file = new File(saveDirectory + File.separator + filename);
			long length = file.length();
			/* 다운로드를 위한 응답 헤더 설정 */
			// 4]다운로드창을 보여주기 위한 응답헤더 설정
			// 4-1]웹브라우저가 인식하지 못하는 컨텐츠타입(MIME)타입 설정.
			response.setContentType("application/octet-stream");
			// 4-2]다운로드시 프로그래스바를 표시하기 위한
			// 컨텐츠 길이 설정
			
			response.setContentLength((int)length);
			// 4-3] 응답헤더명: Content-Disposition
			// 응답헤더명에 따른 값:attachment;filename=파일명
			// setHeader(응답헤더명,헤더값)으로 추가
			// 브라우저 종류에 따라 한글 파일명이 깨지는 경우가 있음으로
			// 브라우저별 인코딩 방식을 달리 하자(파일명을 인코딩)
			boolean isIe = request.getHeader("user-agent").toUpperCase().indexOf("MSIE") != -1
					|| request.getHeader("user-agent").indexOf("11.0") != -1;
			if (isIe) // 인터넷 익스플로러
				filename = URLEncoder.encode(filename, "UTF-8");
			else {// 기타 웹브라우저
					// new String(byte[] bytes, String charset)사용
					// 1]파일명을 byte형 배열로 변환
					// 2]String클래스의 생성자에 변환한 배열과
					// charset는 8859_1을 지정
				filename = new String(filename.getBytes("UTF-8"), "8859_1");
			}
			response.setHeader("Content-Disposition", "attachment;filename=" + filename);
			/* IO작업을 통해서 서버에 있는 파일을 웹브라우저에 바로 출력 */
			/*
			 * 데이타 소스:파일 -노드 스트림:FileInputStream 필터 스트림:BufferedInputStream
			 * 
			 * 데이타 목적지:웹브라우저-노드 스트림:response.getOutputStream() 필터 스트림:BufferedOutputStream
			 */
			// 5]서버에 있는 파일에 연결할 입력 스트림 생성
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			
			// 6]웹브라우저에 연결할 출력 스트림 생성
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			// 7]bis로 읽고 bos로 웹브라우저에 출력
			int data;
			while ((data = bis.read()) != -1) {
				bos.write(data);
				bos.flush();
			}
			// 8]스트림 닫기
			bis.close();
			bos.close();
		}
		catch(Exception e) {e.printStackTrace();}
	}////////////////////////////////////////////////////////
}
