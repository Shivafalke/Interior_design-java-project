<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
// Establish a connection to the database
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost/interior_design";
String username = "root";
String password = "";
Connection conn = null;
int userCount = 0;

try {
    Class.forName(driver);
    conn = DriverManager.getConnection(url, username, password);

    // Query the database to retrieve the count of users
    String query = "SELECT COUNT(*) FROM cust_login";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);

    if (rs.next()) {
        userCount = rs.getInt(1);
    }
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

%>
<% 

int InquriesCount = 0;

try {
    Class.forName(driver);
    conn = DriverManager.getConnection(url, username, password);

    // Query the database to retrieve the count of users
    String query = "SELECT COUNT(*) FROM vendor_form_submissions";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);

    if (rs.next()) {
    	InquriesCount = rs.getInt(1);
    }
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


%>

<% 

int VendorCount = 0;

try {
    Class.forName(driver);
    conn = DriverManager.getConnection(url, username, password);

    // Query the database to retrieve the count of users
    String query = "SELECT COUNT(*) FROM vendor_login";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);

    if (rs.next()) {
    	VendorCount = rs.getInt(1);
    }
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


%>

<% 

int RatingCount = 0;

try {
    Class.forName(driver);
    conn = DriverManager.getConnection(url, username, password);

    // Query the database to retrieve the count of users
    String query = "SELECT COUNT(*) FROM ratings";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);

    if (rs.next()) {
    	RatingCount = rs.getInt(1);
    }
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>

<script type="text/javascript">
    addEventListener("load", function() {setTimeout(hideURLbar, 0);}, false);function hideURLbar(){
        window.scrollTo(0,1);}
</script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />

<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' /> 
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.4.2/morris.css" rel='stylesheet' type='text/css' />
 -->
 <link rel="stylesheet" href="css/morris.css" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- Graph CSS -->
<link href="css/font-awesome.css" rel="stylesheet"> 

<!-- Lined-icons -->
<link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />

<!-- Fonts -->
<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>



</head>
<body>
<div class="page-container">
   <!--/content-inner-->
    <div class="left-content">
       <div class="mother-grid-inner">
            <jsp:include page="includes/header.html"/>
                <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a> <i class="fa fa-angle-right"></i></li>
                </ol>
                <!--four-grids here-->
                <div class="four-grids">
                    <div class="col-md-3 four-grid">
                        <div class="four-agileits">
                            <div class="icon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></div>
                            <div class="four-text">
                                <h3>User</h3>
                                <h3><%=userCount%></h3>
                                </div>
                            
                        </div>
                    </div>
                    
                    <div class="col-md-3 four-grid">
                        <div class="four-agileinfo">
                            <div class="icon">
                                <i class="glyphicon glyphicon-list-alt" aria-hidden="true"></i>
                            </div>
                            <div class="four-text">
                                <h3>Vendors</h3>
                                <h3><%=VendorCount%></h3>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 four-grid">
                        <div class="four-w3ls">
                            <div class="icon">
                                <i class="glyphicon glyphicon-folder-open" aria-hidden="true"></i>
                            </div>
                            <div class="four-text">
                                <h3>Enquiries</h3>
								<h3><%=InquriesCount%></h3>
							</div>
							
						</div>
					</div>
					
					<div class="four-grids">
					<div class="col-md-3 four-grid">
						<div class="four-wthree">
							<div class="icon">
								<i class="glyphicon glyphicon-briefcase" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>Reviews</h3>	
								<h3><%=RatingCount%></h3>
							</div>
							
						</div>
					</div>
					
</div>
</div>

					<div class="clearfix"></div>
				</div>
				<div class="inner-block">
				<br>
<jsp:include page="includes/footer.html"/>

</div>
</div>
</div>


			<!--/sidebar-menu-->
			<jsp:include page="includes/sidebarmenu.html"/>
				
							  <div class="clearfix"></div>		
							
							<script>
    var toggle = true;
    $(".sidebar-icon").click(function() {                
        if (toggle) {
            $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
            $("#menu span").css({"position":"absolute"});
        } else {
            $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
            setTimeout(function() {
                $("#menu span").css({"position":"relative"});
            }, 400);
        }
        toggle = !toggle;
    });
</script>

	

						

<script>
    $(document).ready(function() {
        //BOX BUTTON SHOW AND CLOSE
        jQuery('.small-graph-box').hover(function() {
            jQuery(this).find('.box-button').fadeIn('fast');
        }, function() {
            jQuery(this).find('.box-button').fadeOut('fast');
        });
        jQuery('.small-graph-box .box-close').click(function() {
            jQuery(this).closest('.small-graph-box').fadeOut(200);
            return false;
        });
        
        //CHARTS
        function gd(year, day, month) {
            return new Date(year, month - 1, day).getTime();
        }
        
        graphArea2 = Morris.Area({
            element: 'hero-area',
            padding: 10,
            behaveLikeLine: true,
            gridEnabled: false,
            gridLineColor: '#dddddd',
            axes: true,
            resize: true,
            smooth: true,
            pointSize: 0,
            lineWidth: 0,
            fillOpacity: 0.85,
            data: [
                {period: '2014 Q1', iphone: 2668, ipad: null, itouch: 2649},
                {period: '2014 Q2', iphone: 15780, ipad: 13799, itouch: 12051},
                {period: '2014 Q3', iphone: 12920, ipad: 10975, itouch: 9910},
                {period: '2014 Q4', iphone: 8770, ipad: 6600, itouch: 6695},
                {period: '2015 Q1', iphone: 10820, ipad: 10924, itouch: 12300},
                {period: '2015 Q2', iphone: 9680, ipad: 9010, itouch: 7891},
                {period: '2015 Q3', iphone: 4830, ipad: 3805, itouch: 1598},
                {period: '2015 Q4', iphone: 15083, ipad: 8977, itouch: 5185},
                {period: '2016 Q1', iphone: 10697, ipad: 4470, itouch: 2038},
                {period: '2016 Q2', iphone: 8442, ipad: 5723, itouch: 1801}
            ],
            lineColors: ['#ff4a43', '#a2d200', '#22beef'],
            xkey: 'period',
            redraw: true,
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
            pointSize: 2,
            hideHover: 'auto',
            resize: true
        });
    });
</script>


<!--js -->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.min.js"></script>
   <!-- /Bootstrap Core JavaScript -->	   
<!-- morris JavaScript -->	
<script src="js/raphael-min.js"></script>
 <script src="js/morris.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.4.2/morris.js"></script>	
	</body>
</html>