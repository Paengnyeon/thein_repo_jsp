<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>

<%
    // 파일 저장 경로
    String fileUploadPath = "C:/upload";

    // 업로드 폴더가 없으면 자동 생성
    File uploadDir = new File(fileUploadPath);
    if (!uploadDir.exists()) {
        uploadDir.mkdirs();
    }

    // MultipartRequest 객체 생성
    // request : 사용자가 보낸 요청
    // fileUploadPath : 파일 저장 위치
    // 5 * 1024 * 1024 : 최대 업로드 크기 5MB
    // UTF-8 : 한글 인코딩
    // DefaultFileRenamePolicy : 같은 이름 파일이 있으면 자동 이름 변경
    MultipartRequest multi = new MultipartRequest(
        request,
        fileUploadPath,
        5 * 1024 * 1024,
        "UTF-8",
        new DefaultFileRenamePolicy()
    );

    // 업로드된 파일들의 input name 가져오기
    Enumeration files = multi.getFileNames();

    while (files.hasMoreElements()) {
        // input type="file"의 name 값
        String name = (String) files.nextElement();

        // 실제 서버에 저장된 파일 이름
        String fileName = multi.getFilesystemName(name);

        // 사용자가 업로드한 원래 파일 이름
        String originalFileName = multi.getOriginalFileName(name);

        // 파일 콘텐츠 타입
        String contentType = multi.getContentType(name);

        // 저장된 파일 객체
        File file = multi.getFile(name);

        if (file != null) {
            out.println("요청 파라미터 이름 : " + name + "<br>");
            out.println("실제 파일 이름 : " + originalFileName + "<br>");
            out.println("저장 파일 이름 : " + fileName + "<br>");
            out.println("파일 콘텐츠 유형 : " + contentType + "<br>");
            out.println("파일 크기 : " + file.length() + " byte<br>");
            out.println("-----------------------------------<br>");
        }
    }
%>

</body>
</html>