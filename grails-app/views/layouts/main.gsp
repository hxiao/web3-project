<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'screen.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
    <!-- header starts-->
	  <div id="header-wrap"><div id="header" class="container_16">						
		
		  <h1 id="logo-text"><a href="index.html" title="">League Manager</a></h1>
		  <p id="intro">For Lacrosse and Other Sports</p>
		
		  <!-- navigation -->
		  <div  id="nav">
			  <ul>
				  <li id="current"><a href="index.html">Home</a></li>
				  <li><a href="style.html">Style Demo</a></li>
				  <li><a href="blog.html">Blog</a></li>
				  <li><a href="index.html">Services</a></li>
				  <li><a href="index.html">Support</a></li>
				  <li><a href="index.html">About</a></li>		
			  </ul>		
		  </div>		
		
		  <div id="header-image"></div> 		
	  <!-- header ends here -->
	  </div></div>

	  <!-- content starts -->
	  <div id="content-outer"><div id="content-wrapper" class="container_16">
		
      <!-- left-columns starts -->
		  <div id="left-columns" class="grid_4">
		
			  <div class="grid_4 alpha">
			
				  <div class="sidemenu">	
					  <h3>Sidebar Menu</h3>
					  <ul>				
						  <li><a href="index.html">Home</a></li>
						  <li><a href="index.html#TemplateInfo">TemplateInfo</a></li>
						  <li><a href="style.html">Style Demo</a></li>
						  <li><a href="blog.html">Blog</a></li>
					  </ul>	
				  </div>
				
				  <div class="sidemenu">
					  <h3>Links</h3>
					  <ul>
						  <li><a href="http://www.PDPhoto.org/">PDPhoto</a></li>
						  <li><a href="http://www.alistapart.com">Alistapart</a></li>					
						  <li><a href="http://960.gs/">960 Grid System</a></li>
						  <li><a href="http://www.freephotos.se/">FreePhotos.se</a></li>				
					  </ul>
				  </div>
			  </div>
		  
      <!-- end left-columns -->
		  </div>		
		  
		  <!-- main -->
		  <div id="main" class="grid_12">
        <g:layoutBody/>
		  <!-- main ends -->
		  </div>
		
	  <!-- contents end here -->	
	  </div></div>

	  <!-- footer starts here -->	
	  <div id="footer-wrapper" class="container_16">
	
    </div>
	  <!-- footer ends here -->
		
    <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
