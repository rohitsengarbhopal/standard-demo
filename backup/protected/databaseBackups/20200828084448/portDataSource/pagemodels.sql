INSERT INTO pagemodels (code,descr,frames,plugincode,templategui) VALUES ('service','Service Page','<?xml version="1.0" encoding="UTF-8"?>
<frames>
	<frame pos="0">
		<descr>Sample Frame</descr>
		<sketch x1="0" y1="0" x2="11" y2="0" />
	</frame>
	<frame pos="1">
		<descr>Sample Frame</descr>
		<sketch x1="0" y1="1" x2="11" y2="1" />
	</frame>
</frames>

',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title><@wp.currentPage param="title" /></title>
</head>
<body>
<h1><@wp.currentPage param="title" /></h1>
<a href="<@wp.url page="homepage" />" >Home</a><br>
<div><@wp.show frame=0 /></div>
<div><@wp.show frame=1 /></div>
  <@wp.fragment code="keycloak" escapeXml=false/>
</body>
</html>');
INSERT INTO pagemodels (code,descr,frames,plugincode,templategui) VALUES ('loginpagemodel','Login page model','<?xml version="1.0" encoding="UTF-8"?>
<frames>
	<frame pos="0">
		<descr>Form frame</descr>
		<sketch x1="0" y1="0" x2="11" y2="0" />
	</frame>
</frames>

',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title><@wp.currentPage param="title" /></title>
  <link rel="icon" href="<@wp.info key="systemParam" paramName="applicationBaseURL" />favicon.png" type="image/png" />

  <script src="http://quickshift-kc-sales-demo.lab.entando.org/auth/js/keycloak.js"></script>
  <script>
    const keycloak = Keycloak(''/entando-de-app/keycloak.json'');
    function createKcDispatcher(payload) {
      return () =>
        window.dispatchEvent(
          new CustomEvent("keycloak", { detail: payload })
        );
    }
    keycloak.onReady = createKcDispatcher({ eventType: "onReady" });
    keycloak.onAuthSuccess = createKcDispatcher({
      eventType: "onAuthSuccess"
    });
    keycloak.onAuthError = createKcDispatcher({
      eventType: "onAuthError"
    });
    keycloak.onAuthRefreshSuccess = createKcDispatcher({
      eventType: "onAuthRefreshSuccess"
    });
    keycloak.onAuthRefreshError = createKcDispatcher({
      eventType: "onAuthRefreshError"
    });
    keycloak.onAuthLogout = createKcDispatcher({
      eventType: "onAuthLogout"
    });
    keycloak.onTokenExpired = createKcDispatcher({
      eventType: "onTokenExpired"
    });
    const onInit = createKcDispatcher({ eventType: "onInit" });
    window.entando = {
      ...(window.entando || {}),
      keycloak
    };
    window.entando.keycloak.init({ onLoad: "check-sso" }).success(onInit);
  </script>
</head>
<body>
<div><@wp.show frame=0 /></div>
</body>
</html>');
INSERT INTO pagemodels (code,descr,frames,plugincode,templategui) VALUES ('dashboard','Seed Dashboard','<?xml version="1.0" encoding="UTF-8"?>
<frames>
	<frame pos="0">
		<descr>brand</descr>
		<sketch x1="0" y1="0" x2="1" y2="0" />
	</frame>
	<frame pos="1">
		<descr>navbar</descr>
		<sketch x1="2" y1="0" x2="7" y2="0" />
	</frame>
	<frame pos="2">
		<descr>login widget</descr>
		<sketch x1="8" y1="0" x2="9" y2="0" />
	</frame>
	<frame pos="3">
		<descr>Search</descr>
		<sketch x1="10" y1="0" x2="11" y2="0" />
	</frame>
	<frame pos="4">
		<descr>colonna 4</descr>
		<sketch x1="0" y1="1" x2="3" y2="2" />
	</frame>
	<frame pos="5">
		<descr>colonna 4</descr>
		<sketch x1="4" y1="1" x2="7" y2="2" />
	</frame>
	<frame pos="6">
		<descr>colonna 4</descr>
		<sketch x1="8" y1="1" x2="11" y2="2" />
	</frame>
	<frame pos="7">
		<descr>Notification bar widget</descr>
		<sketch x1="0" y1="3" x2="1" y2="4" />
	</frame>
	<frame pos="8">
		<descr>Notification bar widget</descr>
		<sketch x1="2" y1="3" x2="3" y2="4" />
	</frame>
	<frame pos="9">
		<descr>Notification bar widget</descr>
		<sketch x1="4" y1="3" x2="5" y2="4" />
	</frame>
	<frame pos="10">
		<descr>Notification bar widget</descr>
		<sketch x1="6" y1="3" x2="7" y2="4" />
	</frame>
	<frame pos="11">
		<descr>Notification bar widget</descr>
		<sketch x1="8" y1="3" x2="9" y2="4" />
	</frame>
	<frame pos="12">
		<descr>Notification bar widget</descr>
		<sketch x1="10" y1="3" x2="11" y2="4" />
	</frame>
	<frame pos="13">
		<descr>colonna 12</descr>
		<sketch x1="0" y1="5" x2="11" y2="6" />
	</frame>
	<frame pos="14">
		<descr>colonna 12</descr>
		<sketch x1="0" y1="7" x2="11" y2="8" />
	</frame>
	<frame pos="15">
		<descr>colonna 12</descr>
		<sketch x1="0" y1="9" x2="11" y2="10" />
	</frame>
	<frame pos="16">
		<descr>footer</descr>
		<sketch x1="0" y1="11" x2="11" y2="12" />
	</frame>
	<frame pos="17">
		<descr>footer</descr>
		<sketch x1="0" y1="13" x2="11" y2="14" />
	</frame>
</frames>

',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"]>

    <html lang="en">
        <head>
            <meta charset="utf-8" />
            <title>
                <@wp.currentPage param="title" /> - <@wp.i18n key="SALES_DEMO" />
            </title>
            <meta name="viewport" content="width=device-width,  user-scalable=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <link rel="icon" href="<@wp.info key="systemParam" paramName="applicationBaseURL" />favicon.png" type="image/png" />
            <@wp.fragment code="keycloak" escapeXml=false/>
			<@wp.fragment code="angular" escapeXml=false />

            <!-- FA -->
            <link rel="stylesheet" href="<@wp.resourceURL />static/css/all.css">
            <!-- Bootstrap core -->
            <link href="<@wp.resourceURL />static/css/bootstrap.min.css" rel="stylesheet">
            <!-- Material Design Bootstrap -->
            <link href="<@wp.resourceURL />static/css/mdb.min.css" rel="stylesheet">
            <!-- custom styles -->
            <link rel="stylesheet" href="<@wp.resourceURL />static/css/seed.css" rel="stylesheet">
            <link rel="stylesheet" href="<@wp.resourceURL />static/css/media-queries.css" rel="stylesheet">
            <!-- JQuery -->
            <script type="text/javascript" src="<@wp.resourceURL />static/js/jquery.min.js"></script>

        </head>
        <body>
            <div class="custom-navbar ">
                <!--Navbar-->
                <nav class="navbar fixed-top navbar-expand-lg navbar-light ">
                    <!-- Navbar brand -->
                    <@wp.show frame=0 />
                    <!-- Collapse button -->
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-mobile"
                            aria-controls="navbar-mobile" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Collapsible content -->
                    <div class="collapse navbar-collapse" id="navbar-mobile">
                        <!-- Links -->
                         <@wp.show frame=1 />
                    <ul class="navbar-nav mr-auto">
                        <!-- Dropdown -->
                        <li class="nav-item">
                            <a class="nav-link" href="<@wp.url page="homepage" />">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false">
                                Checking & Savings
                            </a>
                            <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                                <div class="dropdown-content-wrapper">
                                    <div class="row dropdown-wrapper">
                                        <div class="col-6  dropdown-col">
                                            <a class="checking" href="<@wp.url page="interest" />"><span>Interest Checking</span></a>
                                            <div class="savings">High Yield Savings</div>
                                        </div>
                                        <div class="col-6 dropdown-right">
                                            <div class="debit-cards">Debit Cards</div>
                                            <div class="send-money">Send Money</div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-around dropdown-wrapper-footer">
                                        <div class="col-6 dropdown-footer-heading">
                                            Company
                                            <div class="row ">
                                                <div class="col-6 dropdown-footer-content">
                                                    <div>About</div>
                                                    <div>Service</div>
                                                    <div>Careers</div>
                                                    <div>Blog</div>
                                                </div>
                                                <div class="col-6 dropdown-footer-content">
                                                    <div>Media</div>
                                                    <div>Terms</div>
                                                    <div>Privacy</div>
                                                    <div>Cookies</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 dropdown-footer-heading">
                                            Customers
                                            <div class="row ">
                                                <div class="col-12 col-lg-6 dropdown-footer-content">
                                                    <div>Travel</div>
                                                    <div>Pricing</div>
                                                    <div>Account</div>
                                                    <div>Help</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="<@wp.url page="credit_card" />">Credit Cards</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="<@wp.url page="seed_insurances" />">Insurances</a>
                        </li>
                        <!--
                        <li class="nav-item">
                            <a class="nav-link" href="#">Grow</a>
                        </li> 
                        -->
                        <#if (Session.currentUser != "guest")>
                        <li class="nav-item">
                            <a class="nav-link" href="<@wp.url page="dashboard" />"><@wp.i18n key="MY_DASHBOARD" /></a>
                        </li>
                        </#if>

                    </ul>
                    <div class="d-block d-sm-block d-md-none ">
                        <@wp.show frame=2 />
                        <@wp.show frame=3 />
                    </div>
                </div>
                <div class="d-none d-lg-block d-xl-block">
                    <@wp.show frame=2 />
                    <@wp.show frame=3 />
                </div>
                <!-- Collapsible content -->
            </nav>
                <div class="dashboard-container ">   
                    <h1 class="current-page">
                        <@wp.currentPage param="title" />
                    </h1>
                    <div class="row ">
                      <div class="col-12 col-lg-4">
                        <@wp.show frame=4 />
                      </div>
                      <div class="col-12 col-lg-4">
                        <@wp.show frame=5 />
                      </div>
                      <div class="col-12 col-lg-4">
                        <@wp.show frame=6 />
                      </div>
                    </div>
                    <div class="row">
                        <div class="NotificationBar">

                           
                            <@wp.show frame=8 />
                            <@wp.show frame=9 />
                            <@wp.show frame=10 />

                            <div class="NotificationBar__btn">
                                <@wp.show frame=7 />
                            </div>
                            <div class="NotificationBar__btn">
                                <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Framepay.png" />

                                Pay bills
                            </div>
                            <div class="NotificationBar__btn">
                                <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Framemoney.png" />

                                Send money
                            </div>
                            <div class="NotificationBar__btn">
                                <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Frameinvest.png" />

                                Investments
                            </div>
<div class="NotificationBar__btn">
                            <@wp.show frame=11 />
  </div>
<div class="NotificationBar__btn">
                            <@wp.show frame=12 />
  </div>

                        </div>
                    </div>
                    <div class="row">
                      <div class="col-12">
                        <@wp.show frame=13 />
                      </div>
                    </div>
                    <div class="row">
                        <@wp.show frame=14 />
                    </div>
                    <div class="row">
                        <@wp.show frame=15 />
                    </div>
                </div>
                <@wp.show frame=16 />
                <@wp.show frame=17 />
            </div>

            <script type="text/javascript"  src="<@wp.resourceURL />static/js/bootstrap.min.js"></script>
            <script type="text/javascript" src="<@wp.resourceURL />static/js/mdb.min.js"></script>
            <script type="text/javascript" src="<@wp.resourceURL />static/js/datatables.min.js"></script>

        </body>
    </html>');
INSERT INTO pagemodels (code,descr,frames,plugincode,templategui) VALUES ('seed_home','Seed homepage','<?xml version="1.0" encoding="UTF-8"?>
<frames>
	<frame pos="0">
		<descr>brand</descr>
		<sketch x1="0" y1="0" x2="1" y2="0" />
	</frame>
	<frame pos="1">
		<descr>navbar</descr>
		<sketch x1="2" y1="0" x2="7" y2="0" />
	</frame>
	<frame pos="2">
		<descr>login widget</descr>
		<sketch x1="8" y1="0" x2="9" y2="0" />
	</frame>
	<frame pos="3">
		<descr>empty space</descr>
		<sketch x1="10" y1="0" x2="11" y2="0" />
	</frame>
	<frame pos="4">
		<descr>main banner</descr>
		<sketch x1="0" y1="1" x2="11" y2="2" />
	</frame>
	<frame pos="5">
		<descr>colonna 12</descr>
		<sketch x1="0" y1="3" x2="11" y2="4" />
	</frame>
	<frame pos="6" main="true">
		<descr>colonna 12</descr>
		<sketch x1="0" y1="5" x2="11" y2="6" />
	</frame>
	<frame pos="7">
		<descr>colonna 12</descr>
		<sketch x1="0" y1="7" x2="11" y2="8" />
	</frame>
	<frame pos="8">
		<descr>colonna 12</descr>
		<sketch x1="0" y1="9" x2="11" y2="10" />
	</frame>
	<frame pos="9">
		<descr>colonna 12</descr>
		<sketch x1="0" y1="11" x2="11" y2="12" />
	</frame>
	<frame pos="10">
		<descr>colonna 12</descr>
		<sketch x1="0" y1="13" x2="11" y2="14" />
	</frame>
	<frame pos="11">
		<descr>colonna 12</descr>
		<sketch x1="0" y1="15" x2="11" y2="15" />
	</frame>
	<frame pos="12">
		<descr>footer</descr>
		<sketch x1="0" y1="16" x2="11" y2="16" />
	</frame>
	<frame pos="13">
		<descr>footer</descr>
		<sketch x1="0" y1="17" x2="11" y2="17" />
	</frame>
</frames>

',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"]>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>
            <@wp.currentPage param="title" /> - <@wp.i18n key="SALES_DEMO" />
        </title>
        <meta name="viewport" content="width=device-width,  user-scalable=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="icon" href="<@wp.info key="systemParam" paramName="applicationBaseURL" />favicon.png" type="image/png" />
        <@wp.fragment code="keycloak" escapeXml=false/>

              <!-- FA -->
              <link rel="stylesheet" href="<@wp.resourceURL />static/css/all.css">
        <!-- Bootstrap core -->
        <link href="<@wp.resourceURL />static/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="<@wp.resourceURL />static/css/mdb.min.css" rel="stylesheet">
        <!-- custom styles -->
        <link rel="stylesheet" href="<@wp.resourceURL />static/css/seed.css" rel="stylesheet">
        <link rel="stylesheet" href="<@wp.resourceURL />static/css/media-queries.css" rel="stylesheet">
        <!-- JQuery -->
        <script type="text/javascript" src="<@wp.resourceURL />static/js/jquery.min.js"></script>
    </head>
    <body>
        <div class="custom-navbar ">
            <!--Navbar-->
            <nav class="navbar fixed-top navbar-expand-lg navbar-light ">
                <!-- Navbar brand -->
                <@wp.show frame=0 />
                <!-- Collapse button -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-mobile"
                        aria-controls="navbar-mobile" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Collapsible content -->
                <div class="collapse navbar-collapse" id="navbar-mobile">
                    <!-- Links -->
                    <@wp.show frame=1 />
                    <ul class="navbar-nav mr-auto">
                        <!-- Dropdown -->
                         <li class="nav-item">
                            <a class="nav-link" href="<@wp.url page="homepage" />">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false">
                                Checking & Savings
                            </a>
                            <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                                <div class="dropdown-content-wrapper">
                                    <div class="row dropdown-wrapper">
                                        <div class="col-6  dropdown-col">
                                            <a class="checking" href="<@wp.url page="interest" />"><span>Interest Checking</span></a>
                                            <div class="savings">High Yield Savings</div>
                                        </div>
                                        <div class="col-6 dropdown-right">
                                            <div class="debit-cards">Debit Cards</div>
                                            <div class="send-money">Send Money</div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-around dropdown-wrapper-footer">
                                        <div class="col-6 dropdown-footer-heading">
                                            Company
                                            <div class="row ">
                                                <div class="col-6 dropdown-footer-content">
                                                    <div>About</div>
                                                    <div>Service</div>
                                                    <div>Careers</div>
                                                    <div>Blog</div>
                                                </div>
                                                <div class="col-6 dropdown-footer-content">
                                                    <div>Media</div>
                                                    <div>Terms</div>
                                                    <div>Privacy</div>
                                                    <div>Cookies</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6 dropdown-footer-heading">
                                            Customers
                                            <div class="row ">
                                                <div class="col-12 col-lg-6 dropdown-footer-content">
                                                    <div>Travel</div>
                                                    <div>Pricing</div>
                                                    <div>Account</div>
                                                    <div>Help</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                       
                        <li class="nav-item">
                            <a class="nav-link" href="<@wp.url page="credit_card" />">Credit Cards</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="<@wp.url page="seed_insurances" />">Insurances</a>
                        </li>
                        <!--
                        <li class="nav-item">
                            <a class="nav-link" href="#">Grow</a>
                        </li> 
                        -->
                        <#if (Session.currentUser != "guest")>
                        <li class="nav-item">
                         <a class="nav-link" href="<@wp.url page="dashboard" />"><@wp.i18n key="MY_DASHBOARD" /></a>
                         </li>
                        </#if>
                        
                    </ul>
                    <div class="d-block d-sm-block d-md-none ">
                      <@wp.show frame=2 />
                      <@wp.show frame=3 />
                    </div>
                </div>
                <div class="d-none d-lg-block d-xl-block">
                      <@wp.show frame=2 />
                      <@wp.show frame=3 />
                </div>
                <!-- Collapsible content -->
                </nav>
       
        <@wp.show frame=4 />
        <@wp.show frame=5 />
        <@wp.show frame=6 />
        <@wp.show frame=7 />
        <@wp.show frame=8 />
        <@wp.show frame=9 />
        <@wp.show frame=10 />
        <@wp.show frame=11 />
        <@wp.show frame=12 />
        <@wp.show frame=13 />

    </div>
        
        <!-- Bootstrap core js -->
        <script type="text/javascript"  src="<@wp.resourceURL />static/js/bootstrap.min.js"></script>
        <!-- MDB core js -->
        <script type="text/javascript" src="<@wp.resourceURL />static/js/mdb.min.js"></script>

    </body>
</html>
');
INSERT INTO pagemodels (code,descr,frames,plugincode,templategui) VALUES ('OotbcHomepage','Ootbc Homepage','<?xml version="1.0" encoding="UTF-8"?>
<frames>
	<frame pos="0">
		<descr>Header</descr>
	</frame>
	<frame pos="1">
		<descr>Colonna 12</descr>
	</frame>
	<frame pos="2">
		<descr>Colonna 12</descr>
	</frame>
	<frame pos="3">
		<descr>Colonna 12</descr>
	</frame>
	<frame pos="4">
		<descr>Colonna 12</descr>
	</frame>
	<frame pos="5">
		<descr>Colonna 12</descr>
	</frame>
	<frame pos="6">
		<descr>Footer</descr>
	</frame>
</frames>

',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"]>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>
            <@wp.currentPage param="title" /> - <@wp.i18n key="SALES_DEMO" />
        </title>
        <meta name="viewport" content="width=device-width,  user-scalable=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="icon" href="<@wp.info key="systemParam" paramName="applicationBaseURL" />favicon.png" type="image/png" />
        <link rel="stylesheet" href="<@wp.resourceURL />ootbc-bundle/static/css/ootbc.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="header">
            <@wp.show frame=0 />
        </div>
        <div class="page__body">
            <@wp.show frame=1 />
            <@wp.show frame=2 />
            <@wp.show frame=3 />
            <@wp.show frame=4 />
            <@wp.show frame=5 />
        </div>
        <div class="page__footer">
            <@wp.show frame=6 />
        </div>
  </body>
</html>
');
INSERT INTO pagemodels (code,descr,frames,plugincode,templategui) VALUES ('insurance_home','Insurance pages','<?xml version="1.0" encoding="UTF-8"?>
<frames>
	<frame pos="0">
		<descr>go Seed Home</descr>
		<sketch x1="0" y1="0" x2="1" y2="0" />
		<defaultWidget code="back_to_seed" />
	</frame>
	<frame pos="1">
		<descr>search bar</descr>
		<sketch x1="8" y1="0" x2="9" y2="0" />
		<defaultWidget code="search_form" />
	</frame>
	<frame pos="2">
		<descr>choose language</descr>
		<sketch x1="10" y1="0" x2="11" y2="0" />
		<defaultWidget code="language_choose" />
	</frame>
	<frame pos="3">
		<descr>brand logo</descr>
		<sketch x1="0" y1="1" x2="1" y2="1" />
		<defaultWidget code="brand_insurance" />
	</frame>
	<frame pos="4">
		<descr>Navigation bar</descr>
		<sketch x1="6" y1="1" x2="8" y2="1" />
	</frame>
	<frame pos="5">
		<descr>Insurance login</descr>
		<sketch x1="9" y1="1" x2="11" y2="1" />
		<defaultWidget code="insurance_login" />
	</frame>
	<frame pos="6">
		<descr>breadcrumb</descr>
		<sketch x1="0" y1="2" x2="11" y2="2" />
		<defaultWidget code="Breadcrumb" />
	</frame>
	<frame pos="7">
		<descr>100% column</descr>
		<sketch x1="0" y1="3" x2="11" y2="4" />
	</frame>
	<frame pos="8">
		<descr>100% column</descr>
		<sketch x1="0" y1="5" x2="11" y2="6" />
	</frame>
	<frame pos="9" main="true">
		<descr>100% column</descr>
		<sketch x1="0" y1="7" x2="11" y2="8" />
	</frame>
	<frame pos="10">
		<descr>100% column</descr>
		<sketch x1="0" y1="9" x2="11" y2="10" />
	</frame>
	<frame pos="11">
		<descr>100% column</descr>
		<sketch x1="0" y1="11" x2="11" y2="12" />
	</frame>
	<frame pos="12">
		<descr>100% column</descr>
		<sketch x1="0" y1="13" x2="11" y2="14" />
	</frame>
	<frame pos="13">
		<descr>Footer</descr>
		<sketch x1="0" y1="15" x2="11" y2="15" />
	</frame>
	<frame pos="14">
		<descr>Footer</descr>
		<sketch x1="0" y1="16" x2="11" y2="16" />
		<defaultWidget code="footer-insurance" />
	</frame>
</frames>

',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"]>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>
            <@wp.currentPage param="title" /> - <@wp.i18n key="SALES_INSURANCE" />
        </title>
        <meta name="viewport" content="width=device-width,  user-scalable=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="icon" href="<@wp.info key="systemParam" paramName="applicationBaseURL" />favicon.png" type="image/png" />
              <!--<@wp.fragment code="keycloak" escapeXml=false/>-->
              <@wp.fragment code="insurance_inclusions" escapeXml=false />

    </head>
    <body class="insurance">

        <!--Navbar-->
        <nav class="navbar first-nav navbar-expand-lg navbar-light ">

            <!-- Collapsible content -->
            <div class="collapse navbar-collapse navbars" id="basicExampleNav">
                <div class="first-header">
                    <div class="back-button">
                        <@wp.show frame=0 />
                    </div>
                    <div class="search-language">
                        <@wp.show frame=1 />
                        <@wp.show frame=2 />
                    </div>
                </div>
            </div>
            <!-- Collapsible content -->

        </nav>
        <nav class="navbar second-nav navbar-expand-lg navbar-light ">

            <@wp.show frame=3 />

            <!-- Collapse button -->
            <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target=".navbars" aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Collapsible content -->
            <div class="collapse navbar-collapse navbars" id="basicExampleNav2">

                <@wp.show frame=4 />

                <!-- Links -->
                <ul class="navbar-nav ml-auto">
                    <@wp.show frame=5 />
                </ul>
                
                <div class="d-block d-sm-block d-md-none ">
                    <@wp.show frame=1 />
                    <@wp.show frame=2 />
                </div>

            </div>
            <!-- Collapsible content -->

        </nav>
        <!--/.Navbar-->

        <@wp.show frame=6 />
        <@wp.show frame=7 />
        <@wp.show frame=8 />
        <@wp.show frame=9 />
        <@wp.show frame=10 />
        <@wp.show frame=11 />
        <@wp.show frame=12 />
        <@wp.show frame=13 />
        <@wp.show frame=14 />

        <@wp.fragment code="insurance_inclusions_footer" escapeXml=false />

    </body>
</html>
');
