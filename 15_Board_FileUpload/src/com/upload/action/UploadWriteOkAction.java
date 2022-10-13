package com.upload.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.upload.model.UploadDAO;
import com.upload.model.UploadDTO;

public class UploadWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 작성된 글 등록		
		UploadDTO dto = new UploadDTO();
		
		// 파일 업로드 시 설정 내용 필요
		// 1. 파일 저장 경로 지정
		String saveFolder = "C:\\NCS\\workspace(jsp)\\15_Board_FileUpload\\WebContent\\upload";
		// 2. 첨부 파일 크기 저장
		int fileSize = 10 * 1024 * 1024; // 10MB // (1024)kb*(1024)kb = mb
		// 3. MultipartRequest 객체 생성
		// 파일 업로드 진행하기 위한 객체 생성
		
		MultipartRequest multi = new MultipartRequest
				(request, 	// 일반적인 request 객체
				saveFolder, // 첨부파일이 저장될 경로
				fileSize, 	// 업로드할 첨부파일의 최대 크기
				"UTF-8",	// 문자 인코딩 방식
				new DefaultFileRenamePolicy()	// 파일 이름이 같은 경우 중복되지 않게 설정하는 policy
				);
		
		// 자료실 폼 페이지에서 넘어온 데이터들을 받아주자
		// enctype을 "multipart/form-data"로 선언하고 submit한 데이터들은 request객체가 아닌 MultipartRequest객체로 불러와야 한다.
		String upload_writer = multi.getParameter("writer").trim();
		String upload_title = multi.getParameter("title").trim();
		String upload_content = multi.getParameter("cont").trim();
		String upload_pwd = multi.getParameter("pwd").trim();
		
		// 자료실 폼 페이지에서 type="file"로 되어 있으면 getFile() 메서드로 받아주어야 함
		File upload_file = multi.getFile("upload_file");
		
		if(upload_file != null) { // 첨부파일이 존재하는 경우
			
			// 우선 첨부파일의 이름을 알아야 함
			// getName()을 이용하면 이름을 알 수 있음			
			String fileName = upload_file.getName();
			
			// 날짜 객체 생성
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			int day = cal.get(Calendar.DAY_OF_MONTH);
			
			// ......../upload/2022-10-11
			String homedir = saveFolder+"/"+year+"-"+month+"-"+day;
			// saveFolder -> 파일 저장 경로 + ~
			
			// 날짜 폴더를 만들어보자
			File path1 = new File(homedir);
			if(!path1.exists()) {	// 폴더가 존재하지 않는 경우
				path1.mkdir(); // 실제 폴더를 만들어주는 메서드(디렉토리를 만들어주세요)								
			}
			
			// 파일을 만들어보자 ==> 예) 홍길동_파일명
			// ......../upload/2022-10-11/홍길동_파일명
			String refileName = upload_writer+"_"+fileName;
			upload_file.renameTo(new File(homedir+"/"+refileName));
			
			// 실제로 DB에 저장되는 파일 이름
			// "/2022-10-11/홍길동_파일명"으로 저장할 예정
			String fileDBName = "/"+year+"-"+month+"-"+day+"/"+refileName;
			dto.setUpload_file(fileDBName);
		}
		
		dto.setUpload_writer(upload_writer);
		dto.setUpload_title(upload_title);
		dto.setUpload_cont(upload_content);
		dto.setUpload_pwd(upload_pwd);
		
		UploadDAO dao = UploadDAO.getInstance();
		int res = dao.insertUpload(dto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(res > 0) {						
			forward.setRedirect(true);
			forward.setPath("upload_list.do");
		}else {
			out.println("<script> alert('업로드 실패'); history.back(); </script>");
		}
		
		return forward;
	}

}
