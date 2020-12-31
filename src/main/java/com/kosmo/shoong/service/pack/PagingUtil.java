package com.kosmo.shoong.service.pack;

public class PagingUtil {

	public static String pagingText(int totalRecordCount,int pageSize,int blockPage,int nowPage,String page){
		String pagingStr="";
		
		//1.전체 페이지 구하기
		int totalPage= (int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;

		//처음 및 이전을 위한 로직
		if(intTemp != 1){
                
			pagingStr+="<a href='"+page+"nowPage=1'>◀◀</a>&nbsp;<a href='"+page+"nowPage="+(intTemp -blockPage)+"'>◀</a>";
		}
		
		//페이지 표시 제어를 위한 변수
		int blockCount = 1;
		
		//페이지를 뿌려주는 로직
		//블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다1 
		while(blockCount <= blockPage && intTemp <= totalPage){  // 페이지 오버 를 체크
				//현재 페이지를 의미함
			if(intTemp == nowPage){  
				pagingStr+="<span style='Color:red'>"+intTemp+"</span>&nbsp;";
			}
		     else
		    	 pagingStr+="<a href='"+page+"nowPage="+intTemp+"'>"+intTemp+"</a>&nbsp;";
		       
			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		
		}

		//다음 및 마지막을 위한 로직
			
		if(intTemp <= totalPage){

			pagingStr+="<a href='"+page+"nowPage="+intTemp+"'>▶</a>&nbsp;<a href='"+page+"nowPage="+totalPage+"'>▶▶</a>"; 

				   
		}
		
		return pagingStr;
	}
	public static String pagingBootStrapStyle(int totalRecordCount,int pageSize,int blockPage,int nowPage,String page){
		
		String pagingStr="<nav><ul class=\"pagination\" >";
		
		//1.전체 페이지 구하기
		int totalPage= (int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;

		//처음 및 이전을 위한 로직
		if(intTemp != 1){
			pagingStr+="<li>\r\n" + 
					"<a href='"+page+"nowPage=1'>\r\n" + 
					"<span aria-hidden=\"true\">&laquo;</span>\r\n" + 
					"</a>\r\n" + 
					"</li>\r\n" + 
					"<li >\r\n" + 
					"<a href='"+page+"nowPage="+(intTemp -blockPage)+"' >\r\n" + 
					"<span aria-hidden=\"true\">&lsaquo;</span>\r\n" + 
					"</a>\r\n" + 
					"</li>";   
			
		}
		
		//페이지 표시 제어를 위한 변수
		int blockCount = 1;
		
		//페이지를 뿌려주는 로직
		//블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다1 
		while(blockCount <= blockPage && intTemp <= totalPage){  // 페이지 오버 를 체크
				//현재 페이지를 의미함
			if(intTemp == nowPage){  
				pagingStr+="<li><a href='#'><span style='Color:red'>"+intTemp+"</span></a></li>";
			}
		     else
		    	 pagingStr+="<li><a href='"+page+"nowPage="+intTemp+"'>"+intTemp+"</a></li>";
		       
			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		
		}

		//다음 및 마지막을 위한 로직
			
		if(intTemp <= totalPage){
			pagingStr+="<li>\r\n" + 
					"<a href='"+page+"nowPage="+intTemp+"'>\r\n" + 
					"<span aria-hidden=\"true\">&rsaquo;</span>\r\n" + 
					"</a>\r\n" + 
					"</li>\r\n" + 
					"<li>\r\n" + 
					"<a href='"+page+"nowPage="+totalPage+"' >\r\n" + 
					"<span aria-hidden=\"true\">&raquo;</span>\r\n" + 
					"</a>\r\n" + 
					"</li>";
							   
		}
		pagingStr+="</ul></nav>";
		return pagingStr;
	}
	
}
