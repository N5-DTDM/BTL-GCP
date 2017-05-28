
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/froala_editor.min.css">
<link rel="stylesheet" href="/css/froala_style.min.css">
<link rel="stylesheet" href="/css/plugins/code_view.min.css">
<link rel="stylesheet" href="/css/plugins/colors.min.css">
<link rel="stylesheet" href="/css/plugins/emoticons.min.css">
<link rel="stylesheet" href="/css/plugins/image.min.css">
<link rel="stylesheet" href="/css/plugins/line_breaker.min.css">
<link rel="stylesheet" href="/css/plugins/table.min.css">
<link rel="stylesheet" href="/css/plugins/char_counter.min.css">
<link rel="stylesheet" href="/css/plugins/video.min.css">
<link rel="stylesheet" href="/css/plugins/fullscreen.min.css">
<link rel="stylesheet" href="/css/plugins/quick_insert.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">
<link rel="stylesheet" href="/css/admin.css">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

</head>
<body>
	<div id="wrapper" style="padding: 10px">
		<div class="container">
			<div role="navigation">
				<div class="navbar navbar-default">
					<a href="/" class="navbar-brand glyphicon glyphicon-home"></a>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li><a href="web">WebDemo</a></li>
							<li><a href="upload">Upload</a></li>
							<li><a href="listupload">List Upload</a></li>
						</ul>
					</div>
				</div>
			</div>

			<h1 class="text-center">List Upload</h1>
			<table class="table table-default">
				<tr>
					<th>Id</th>
					<th>Title</th>
					<th>Content</th>
					<th>Url</th>
					<th></th>
				</tr>
				<c:forEach var="d" items="${documents}">
					<tr class="nn-record">
						<td>${d.id}</td>
						<td>${d.title}</td>
						<td>${d.content}</td>
						<td><a href="${d.url}">${d.url}</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>


	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>
	<script type="text/javascript" src="/js/froala_editor.min.js"></script>
	<script type="text/javascript" src="/js/plugins/align.min.js"></script>
	<script type="text/javascript" src="/js/plugins/char_counter.min.js"></script>
	<script type="text/javascript" src="/js/plugins/code_beautifier.min.js"></script>
	<script type="text/javascript" src="/js/plugins/code_view.min.js"></script>
	<script type="text/javascript" src="/js/plugins/colors.min.js"></script>
	<script type="text/javascript" src="/js/plugins/emoticons.min.js"></script>
	<script type="text/javascript" src="/js/plugins/entities.min.js"></script>
	<script type="text/javascript" src="/js/plugins/font_size.min.js"></script>
	<script type="text/javascript" src="/js/plugins/font_family.min.js"></script>
	<script type="text/javascript" src="/js/plugins/fullscreen.min.js"></script>
	<script type="text/javascript" src="/js/plugins/image.min.js"></script>
	<script type="text/javascript" src="/js/plugins/line_breaker.min.js"></script>
	<script type="text/javascript" src="/js/plugins/inline_style.min.js"></script>
	<script type="text/javascript" src="/js/plugins/link.min.js"></script>
	<script type="text/javascript" src="/js/plugins/lists.min.js"></script>
	<script type="text/javascript"
		src="/js/plugins/paragraph_format.min.js"></script>
	<script type="text/javascript" src="/js/plugins/paragraph_style.min.js"></script>
	<script type="text/javascript" src="/js/plugins/quick_insert.min.js"></script>
	<script type="text/javascript" src="/js/plugins/quote.min.js"></script>
	<script type="text/javascript" src="/js/plugins/table.min.js"></script>
	<script type="text/javascript" src="/js/plugins/save.min.js"></script>
	<script type="text/javascript" src="/js/plugins/url.min.js"></script>
	<script type="text/javascript" src="/js/plugins/video.min.js"></script>
	<script type="text/javascript" src="/js/languages/vi.js"></script>
	<script>
		$(function() {
			$('#edit').froalaEditor({
				language : 'vi',
				imageInsertButtons : [ 'imageByURL' ],
				videoInsertButtons : [ 'videoByURL', 'videoEmbed' ],
				imageUpload : false,
				pasteImage : false,
				height : 200

			});
		});
	</script>
</body>

</html>
