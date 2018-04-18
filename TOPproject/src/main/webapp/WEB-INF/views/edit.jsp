<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
	<meta charset="UTF-8">
	<title>TOP - 혁신적인 프로젝트 관리</title>
	
	<link rel="stylesheet" href='./resources/css/mystyles.css'/>
	<script src="https://cdn.ckeditor.com/4.8.0/full-all/ckeditor.js"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
	<%-- <script type="text/javascript" src="<c:url value='/resources/js/script.js'/>"></script> --%>
	<%-- <script type="text/javascript" src="<c:url value='/resources/js/ckeditor.js'/>"></script> --%>
	<%-- <script type="text/javascript" src="<c:url value='/resources/js/sample.js'/>"></script>
	<link rel="stylesheet" href='./resources/css/neo.css'/>
	<link rel="stylesheet" href='./resources/css/samples.css'/> --%>
	
	<script type="text/javascript">
		function test1(){
			var testT = $("#editor1").val();
			alert(testT);
			return true;
		}
	</script>
	<style type="text/css">
	
	/* #cke_1_contents{
		height:70% !important;
	} */
	
	body {
		padding: 0px;
		display: flex;
		align-items: center;
		text-align: center;
	}
	
	.container {
		margin: 0 auto;
		padding: 0 auto;
	}
	
	</style>
</head>

<body>
	<div class="container">
		<form action="testUP" method="post" onsubmit="return test1()">
			<textarea name="text" id="editor1">
			<input type="text">
				
				&lt;h2 style="text-align: center;"&gt;The Flavorful Tuscany Meetup&lt;/h2&gt;
				&lt;p style="text-align: center;"&gt;&lt;span style="color: #007ac9;"&gt;&lt;strong&gt;Welcome letter&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;
				&lt;p&gt;Dear Guest,&lt;/p&gt;
				&lt;p&gt;We are delighted to welcome you to the annual &lt;em&gt;Flavorful Tuscany Meetup&lt;/em&gt; and hope you will enjoy the programme as well as your stay at the Bilancino Hotel.&lt;/p&gt;
				&lt;p&gt;Please find below the full schedule of the event.&lt;/p&gt;
				&lt;table class="schedule" cellpadding="15" cellspacing="0" style="border-collapse:collapse;width:100%;"&gt;
				&lt;thead&gt;
				&lt;tr&gt;
				&lt;th colspan="2" scope="col" style="background-color: #F2F9FF; text-align: center; font-size: 21px;"&gt;&lt;span&gt;Saturday, July 14&lt;/span&gt;&lt;/th&gt;
				&lt;/tr&gt;
				&lt;/thead&gt;
				&lt;tbody&gt;
				&lt;tr&gt;
				&lt;td style="white-space:nowrap;"&gt;&lt;span&gt;9:30 AM - 11:30 AM&lt;/span&gt;&lt;/td&gt;
				&lt;td&gt;&lt;span&gt;Americano vs. Brewed - “know your coffee” session with &lt;strong&gt;Stefano Garau&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;
				&lt;/tr&gt;
				&lt;tr&gt;
				&lt;td style="white-space:nowrap;"&gt;&lt;span&gt;1:00 PM - 3:00 PM&lt;/span&gt;&lt;/td&gt;
				&lt;td&gt;&lt;span&gt;Pappardelle al pomodoro - live cooking session with &lt;strong&gt;Rita Fresco&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;
				&lt;/tr&gt;
				&lt;tr&gt;
				&lt;td style="white-space:nowrap;"&gt;&lt;span&gt;5:00 PM - 8:00 PM&lt;/span&gt;&lt;/td&gt;
				&lt;td&gt;&lt;span&gt;Tuscan vineyards at a glance - wine-tasting session with &lt;strong&gt;Frederico Riscoli&lt;/strong&gt;&lt;/span&gt;&lt;/td&gt;
				&lt;/tr&gt;
				&lt;/tbody&gt;
				&lt;/table&gt;
				&lt;blockquote&gt;
				&lt;p&gt;The annual Flavorful Tuscany meetups are always a culinary discovery. You get the best of Tuscan flavors during an intense one-day stay at one of the top hotels of the region. All the sessions are lead by top chefs passionate about their profession. I would certainly recommend to save the date in your calendar for this one!&lt;/p&gt;
				&lt;p&gt;Angelina Calvino, food journalist&lt;/p&gt;
				&lt;/blockquote&gt;
				&lt;p&gt;Please arrive at the Bilancino Hotel reception desk at least &lt;strong&gt;half an hour earlier&lt;/strong&gt; to make sure that the registration process goes as smoothly as possible.&lt;/p&gt;
				&lt;p&gt;We look forward to welcoming you to the event.&lt;/p&gt;
				&lt;p&gt;&lt;/p&gt;
				&lt;p&gt;&lt;strong&gt;Victoria Valc&lt;/strong&gt;&lt;/p&gt;
				&lt;p&gt;&lt;strong&gt;Event Manager&lt;/strong&gt;&lt;/p&gt;
				&lt;p&gt;&lt;strong&gt;Bilancino Hotel&lt;/strong&gt;&lt;/p&gt;
			</textarea>
			<input type="submit" value="저장">
		</form>
	</div>
	
	<script>
		CKEDITOR.replace( 'editor1', {
			// Define the toolbar: http://docs.ckeditor.com/ckeditor4/docs/#!/guide/dev_toolbar
			// The full preset from CDN which we used as a base provides more features than we need.
			// Also by default it comes with a 3-line toolbar. Here we put all buttons in a single row.
			toolbar: [
				{ name: 'document', items: [ 'Print' ] },
				{ name: 'clipboard', items: [ 'Undo', 'Redo' ] },
				{ name: 'styles', items: [ 'Format', 'Font', 'FontSize' ] },
				{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'RemoveFormat', 'CopyFormatting' ] },
				{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
				{ name: 'align', items: [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
				{ name: 'links', items: [ 'Link', 'Unlink' ] },
				{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
				{ name: 'insert', items: [ 'Image', 'Table' ] },
				{ name: 'tools', items: [ 'Maximize' ] },
				{ name: 'editing', items: [ 'Scayt' ] }
			],
		
			// Since we define all configuration options here, let's instruct CKEditor to not load config.js which it does by default.
			// One HTTP request less will result in a faster startup time.
			// For more information check http://docs.ckeditor.com/ckeditor4/docs/#!/api/CKEDITOR.config-cfg-customConfig
			customConfig: '',
		
			// Sometimes applications that convert HTML to PDF prefer setting image width through attributes instead of CSS styles.
			// For more information check:
			//  - About Advanced Content Filter: http://docs.ckeditor.com/ckeditor4/docs/#!/guide/dev_advanced_content_filter
			//  - About Disallowed Content: http://docs.ckeditor.com/ckeditor4/docs/#!/guide/dev_disallowed_content
			//  - About Allowed Content: http://docs.ckeditor.com/ckeditor4/docs/#!/guide/dev_allowed_content_rules
			disallowedContent: 'img{width,height,float}',
			extraAllowedContent: 'img[width,height,align]',
		
			// Enabling extra plugins, available in the full-all preset: http://ckeditor.com/presets-all
			extraPlugins: 'tableresize,uploadimage,uploadfile',
		
			/*********************** File management support ***********************/
			// In order to turn on support for file uploads, CKEditor has to be configured to use some server side
			// solution with file upload/management capabilities, like for example CKFinder.
			// For more information see http://docs.ckeditor.com/ckeditor4/docs/#!/guide/dev_ckfinder_integration
		
			// Uncomment and correct these lines after you setup your local CKFinder instance.
			// filebrowserBrowseUrl: 'http://example.com/ckfinder/ckfinder.html',
			// filebrowserUploadUrl: 'http://example.com/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
			/*********************** File management support ***********************/
		
			// Make the editing area bigger than default.
			height: 600,
		
			// An array of stylesheets to style the WYSIWYG area.
			// Note: it is recommended to keep your own styles in a separate file in order to make future updates painless.
			/* contentsCss: [ 'https://cdn.ckeditor.com/4.8.0/full-all/contents.css', 'mystyles.css' ], */
			contentsCss: [ './resources/css/mystyles.css', 'mystyles.css' ],
			// This is optional, but will let us define multiple different styles for multiple editors using the same CSS file.
			bodyClass: 'document-editor',
		
			// Reduce the list of block elements listed in the Format dropdown to the most commonly used.
			format_tags: 'p;h1;h2;h3;pre',
		
			// Simplify the Image and Link dialog windows. The "Advanced" tab is not needed in most cases.
			removeDialogTabs: 'image:advanced;link:advanced',
		
			// Define the list of styles which should be available in the Styles dropdown list.
			// If the "class" attribute is used to style an element, make sure to define the style for the class in "mystyles.css"
			// (and on your website so that it rendered in the same way).
			// Note: by default CKEditor looks for styles.js file. Defining stylesSet inline (as below) stops CKEditor from loading
			// that file, which means one HTTP request less (and a faster startup).
			// For more information see http://docs.ckeditor.com/ckeditor4/docs/#!/guide/dev_styles
			stylesSet: [
				/* Inline Styles */
				{ name: 'Marker', element: 'span', attributes: { 'class': 'marker' } },
				{ name: 'Cited Work', element: 'cite' },
				{ name: 'Inline Quotation', element: 'q' },
		
				/* Object Styles */
				{
					name: 'Special Container',
					element: 'div',
					styles: {
						padding: '5px 10px',
						background: '#eee',
						border: '1px solid #ccc'
					}
				},
				{
					name: 'Compact table',
					element: 'table',
					attributes: {
						cellpadding: '5',
						cellspacing: '0',
						border: '1',
						bordercolor: '#ccc'
					},
					styles: {
						'border-collapse': 'collapse'
					}
				},
				{ name: 'Borderless Table', element: 'table', styles: { 'border-style': 'hidden', 'background-color': '#E6E6FA' } },
				{ name: 'Square Bulleted List', element: 'ul', styles: { 'list-style-type': 'square' } }
			]
		});
		</script>
	</body>
</html>

