<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String path = "C:/upload";

File uploadDir = new File(path);
if (!uploadDir.exists()) {
    uploadDir.mkdirs();
}

DiskFileUpload upload = new DiskFileUpload();

upload.setSizeMax(1000000);
upload.setSizeThreshold(4096);
upload.setRepositoryPath(path);

List items = upload.parseRequest(request);
Iterator params = items.iterator();

while (params.hasNext()) {
    FileItem item = (FileItem) params.next();

    if (item.isFormField()) {
        String name = item.getFieldName();
        String value = item.getString("utf-8");

        out.println(name + "=" + value + "<br>");
    } else {
        String fileFieldName = item.getFieldName();
        String fileName = item.getName();
        String contentType = item.getContentType();

        if (fileName != null && !fileName.equals("")) {
            fileName = new File(fileName).getName();

            long fileSize = item.getSize();

            File file = new File(path + "/" + fileName);
            item.write(file);

            out.println("-----------------------------------<br>");
            out.println("요청 파라미터 이름 : " + fileFieldName + "<br>");
            out.println("저장 파일 이름 : " + fileName + "<br>");
            out.println("파일 콘텐츠 유형 : " + contentType + "<br>");
            out.println("파일 크기 : " + fileSize);
        }
    }
}


%>

</body>
</html>
