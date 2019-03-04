<!-- 송운선 2019-01-22 17:43 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../Template/setting.jsp"%>
<html>
<script type="text/javascript">
	
</script>
<body>
	<div>
		<div>
			<input type="hidden" name="pageNum" value="${pageNum}"> 
			<input type="hidden" name="eve_num" value="${dto.eve_num}">

			<table class="table table-hover">
				<thead>
					<tr style="background: #2980B9;">
						<th colspan="4" style="color: #ffffff; text-align: center;">이벤트
							수정</th>
					</tr>
				</thead>
				<tr>
					<td colspan="4">
						<div class="eq-ui-form-group eq-ui-input-file">
							<a class="btn btn-primary eq-ui-waves-light"
								style="color: white;"> Upload <input class="btn btn-primary"
								id="img2" type="file" name="eve_img" multiple autofocus required>
							</a>
							<div class="eq-ui-input-file-path">
								<input type="text" class="eq-ui-input"
									placeholder="Upload image files" readonly style="width: 700px;">
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td colspan="4">
						<div style="text-align: center;">
							<img
								style="max-width: 400px; max-height: 380px; display: inline-block;"
								id="imgView2" src="/benkfit/resources/img/event/${dto.eve_img}" />
						</div>
					</td>
				</tr>

				<tr>
					<td colspan="4">
						<div style="text-align: center;">
							<img
								style="max-width: 400px; max-height: 380px; display: inline-block;"
								id="imgView2" />
						</div>
					</td>
				</tr>

				<tr>
					<th style="padding-top: 37px;">제목</th>
					<td colspan="3">
						<div class="eq-ui-form-group eq-ui-input-field">
							<input id="first_name" type="text" class="eq-ui-input"
								value="${dto.eve_title}" name="eve_title" maxlength="37"
								style="width: 100%;">
						</div>
					</td>
				</tr>

				<tr>
					<th style="padding-top: 52px;">내용</th>
					<td colspan="3">
						<div class="eq-ui-form-group eq-ui-input-field">
							<textarea id="textarea_field" class="eq-ui-textarea"
								name="eve_content">${dto.eve_content}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th style="padding-top: 16px;">시작일</th>
					<td style="width: 20%;">
						<input type="date" class="date_kay" name="eve_start"
							value="<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.eve_start}" />">
					<th style="padding-top: 16px;">종료일</th>
					<td style="width: 20%;">
						<input type="date" class="date_kay" name="eve_end"
							value="<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.eve_end}" />"></td>
				</tr>
			</table>
		</div>
	</div>

	<script
		src="/benkfit/resources/assets/js/vendor/jquery/dist/jquery.min.js?v=2.1.4"></script>
	<script
		src="/benkfit/resources/assets/js/vendor/moment/min/moment.min.js?v=2.13.0"></script>
	<script
		src="/benkfit/resources/assets/js/vendor/jquery-timeago/jquery.timeago.js?v=1.4.3"></script>
	<script
		src="/benkfit/resources/assets/js/exentriq-bootstrap-material-ui.min.js?v=0.4.5"></script>

	<script src="/benkfit/resources/assets/js/tp/tp-color.html"
		type="riot/tag"></script>
	<script
		src="/benkfit/resources/assets/js/vendor/riot/riot+compiler.min.js?v=2.3.0"></script>

	<script src="https://unpkg.com/lodash@4.16.0"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="https://unpkg.com/vue@2.5.21/dist/vue.js"></script>

	<script src="/benkfit/resources/assets/js/doc.js?v=0.4.5"></script>
	<script src="/benkfit/resources/assets/js/ctrl/ctrl-color.js"></script>
	<script src="/benkfit/resources/assets/js/vue/collapsible.js"></script>
	<script src="/benkfit/resources/assets/js/vue/dropdown.js"></script>
	<script src="/benkfit/resources/assets/js/vue/tabs.js"></script>

	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
	<script>
		(function(b, o, i, l, e, r) {
			b.GoogleAnalyticsObject = l;
			b[l] || (b[l] = function() {
				(b[l].q = b[l].q || []).push(arguments)
			});
			b[l].l = +new Date;
			e = o.createElement(i);
			r = o.getElementsByTagName(i)[0];
			e.src = '//www.google-analytics.com/analytics.js';
			r.parentNode.insertBefore(e, r)
		}(window, document, 'script', 'ga'));
		ga('create', 'UA-XXXXX-X', 'auto');
		ga('send', 'pageview');
	</script>
</body>
</html>