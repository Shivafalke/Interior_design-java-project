<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.File" %> 
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="sample.FileInfo" %>
<%@ page import="sample.FileDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Designs</title>

<!-- Add Bootstrap CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/css/bootstrap.min.css">

<style>
 body {
    background-color: #f0f8ff;
  	}
  /* Custom styles for the page */
  .file-container {
  	max-width: 300px; /* Adjust the value as per your preference */
  	max-height: 200px;
    margin-bottom: 20px;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  .file-container h3 {
    margin-top: 0;
    margin-bottom: 10px;
  }

  .file-container p {
    margin-bottom: 10px;
  }

  .file-container img,
  .file-container video {
    max-width: 100%;
    /* height: auto; */
    max-height: 100px; /* Set a maximum height for the media elements */
  }
</style>

</head>
<body>

<center><h1 class="display-5">Designs by Vendors</h1></center>
<br>
  <c:set var="uploadDirectory" value="C:/Users/Samadhan/eclipse-workspace-EE-GTLproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/interior-design/uploads" />

  <%-- Retrieve file information from the database --%>
  <%
      FileDAO fileDAO = new FileDAO();
      List<FileInfo> files = fileDAO.getAllFiles();
      request.setAttribute("files", files);
  %>

  <div class="container">
  <c:choose>
    <c:when test="${empty files}">
      <h1>No designs available</h1>
    </c:when>
    <c:otherwise>
      <c:forEach items="${files}" var="file">
        <div class="card mb-3">
          <div class="row g-0">
            <div class="col-md-4">
              <c:choose>
                <c:when test="${file.fileName.endsWith('.jpg') || file.fileName.endsWith('.jpeg') || file.fileName.endsWith('.png') || file.fileName.endsWith('.gif')}">
                  <img src="${pageContext.request.contextPath}/uploads/${file.fileName}" alt="Image" class="img-fluid">
                </c:when>
                <c:when test="${file.fileName.endsWith('.mp4') || file.fileName.endsWith('.avi') || file.fileName.endsWith('.mkv') || file.fileName.endsWith('.mov') || file.fileName.endsWith('.webm')}">
                  <video src="${pageContext.request.contextPath}/uploads/${file.fileName}" controls class="w-100"></video>
                </c:when>
                <c:otherwise>
                  <p>Unsupported file type</p>
                </c:otherwise>
              </c:choose>
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title">${file.vendorName} Designs</h5>
                <p class="card-text">${file.description}</p>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </c:otherwise>
  </c:choose>
</div>


  <!-- Add Bootstrap JS and jQuery -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</body>
</html>
