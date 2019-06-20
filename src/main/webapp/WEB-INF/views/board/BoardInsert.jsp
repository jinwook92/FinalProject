<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/NewFile1.css">
<style>
body {
	font-family: "맑은 고딕";
}

.pr {
	display: inline-block;
	height: 150px;
}

.fileInput {
	position: relative;
	width: 100%;
	overflow: hidden;
}

.fileInputHidden {
	width: 100%;
	position: absolute;
	opacity: 0;
}

#image_preview {
	display: none;
}

#preimg {
	width: 400px;
	height: 500px;
}
</style>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* $('#toggle--switch').change(function(){
		
	
	});
	 */
	
	
	$('#submit').click(function(e) {
		if($("#board_image").val() =="" && $('#movielink').val() == "") {
			alert("사진이나 영상을 입력하세요!");
			return false;
		}
	});

	
/* 	 $("input[name=maps]").keydown(function (key) {
		 
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	       return false;
	       
	        }
	 
	    }); */
	 $("input[name=maps]").keydown(function(e){
		    // Enter was pressed without shift key
		    if (e.keyCode == 13 )
		    {
		        // prevent default behavior
		        e.preventDefault();
		        $('#locbtn').trigger("click");
		    }
		});




	
/* 	 $("input[name=maps]").keydown(function (key) {
		 
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	       return false;
	       
	        }
	 
	    }); */
	 $("input[name=maps]").keydown(function(e){
		    // Enter was pressed without shift key
		    if (e.keyCode == 13 )
		    {
		        // prevent default behavior
		        e.preventDefault();
		        $('#locbtn').trigger("click");
		    }
		});


	$('.maps').hide();
	$('#chooseloc').click(function(){
		$('.maps').toggle();			
	});
});
</script>

</head>
<body>
	<div style="width: 1000px; margin: 25px auto; background-color: white;">
		<form:form commandName="boardVO" action="insertok"
			enctype="multipart/form-data" method="post" name="form">
			<form:label path="user_id">ID : ${sessionScope.session_id }</form:label>
			<input type="hidden" value="${sessionScope.session_id }"
				name="user_id">
			<br>
			<br>
		
			<br>
				<!-- Inspiration – https://dribbble.com/shots/96984-MIT-Sloan-iPad-App-High-Resolution?list=searches&tag=toggle&offset=11 -->
		<h2 class="headingOuter">[ PICTURE & VIDEO ]</h2>
		<div class="toggle toggle--switch" id="radioArea">
			<input type="checkbox" id="toggle--switch" class="toggle--checkbox" name="radioName">
			<label class="toggle--btn" for="toggle--switch"><span id="toglef" class="toggle--feature" data-label-on="picture"  data-label-off="video"></span></label>
		</div>
			<!-- <div id="radioArea">
				<ul>
					<li><input type="radio" name="radioName" value="M" /><label>사진</label></li>
					<li><input type="radio" name="radioName" value="I" /><label>영상</label></li>
				</ul>
			</div> -->
			<input type="hidden" id="radioId" value="I">
			<br>
			<br>
			<div id="changeTextArea">
				<div id="changeM">
					<div class="pr">
						<form:label path="board_image"
							cssStyle="cursor:pointer;width:120px;">Image
                  <img alt="searchImg" src="resources/images/photos.png"
								style="cursor: pointer;">
						</form:label>
						<div class="fileInput">
							<input type="file" name="board_image" id="board_image"
								class="fileInputHidden">
							<form:errors path="board_image" />
						</div>
						<div id="image_preview">
							<img src="#" id="preimg" /><br> <a href="#">Remove</a>
						</div>
					</div>
					<Br>
					<form:label path="loc" id="chooseloc">Location<img src="resources/images/placeholder.png" alt="chooseloc"></form:label><br>


					<input class="maps" type="text" id="loctxt" style="width:150px;" name="maps"><input id="locbtn" type="button" class="maps" value="검색" style="width:50px;">
					<form:input class="maps" path="loc" id="locresult" value="" readonly="true" cssStyle="border:none;"></form:input>
				

					<div class="maps" id="map" style="width: 400px; height: 400px;" class="thumbnail"></div>
					<hr>
					<form:label path="board_content">Content : </form:label>
					<form:textarea id="checkText" path="board_content" cols="20"
						rows="3" />
					<form:errors path="board_content" />
				</div>
				<div id="changeI">
					<form:label path="movielink">태그나 영상 주소를 넣어주세요</form:label>
					<form:textarea path="movielink" id="movielink" cols="20" rows="3" />
					<form:errors path="movielink" />
					<form:label path="board_content">Content : </form:label>
					<form:textarea path="board_content" cols="20" rows="2" />
					<form:errors path="board_content" />				
				</div>
			</div>

			<script type="text/javascript"
				src="//apis.daum.net/maps/maps3.js?apikey=7af9218b4f1364a532c1e1dd88f1a98f&libraries=services"></script>
			<script>
				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				var infowindow = new daum.maps.InfoWindow({
					zIndex : 1
				});

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer, mapOption);
			$('#locbtn').click(function(){				
				var loctxt=$('#loctxt').val();
				console.log(loctxt);					

				// 장소 검색 객체를 생성합니다
				var ps = new daum.maps.services.Places();
				console.log(loctxt);
				// 키워드로 장소를 검색합니다
				ps.keywordSearch(loctxt, placesSearchCB);

				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB(status, data, pagination) {
					if (status === daum.maps.services.Status.OK) {

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
						// LatLngBounds 객체에 좌표를 추가합니다
						var bounds = new daum.maps.LatLngBounds();

						for (var i = 0; i < data.places.length; i++) {
							displayMarker(data.places[i]);
							bounds.extend(new daum.maps.LatLng(
									data.places[i].latitude,
									data.places[i].longitude));
						}

						// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
						map.setBounds(bounds);
					}
				}

				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {

					// 마커를 생성하고 지도에 표시합니다
					var marker = new daum.maps.Marker({
						map : map,
						position : new daum.maps.LatLng(place.latitude,
								place.longitude)
					});

					// 마커에 클릭이벤트를 등록합니다
					daum.maps.event
							.addListener(
									marker,
									'click',
									function() {
										// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
										infowindow
												.setContent('<div style="padding:5px;font-size:12px;">'
														+ place.title
														+ '</div>');
										infowindow.open(map, marker);
										$('#locresult').val(place.title);
									});
				}

			});
			</script>
			<br>
			<button name="submit" class="submit-btn" type="submit" id="submit">
				<span class="ti-shift-right"></span>Submit
			</button>
		</form:form>
	</div>
	<script>
		hideExclude("changeM");
		// radio change 이벤트
		var vcheck = 0;
		$("input[name=radioName]").change(function() {
			//alert("dd");
			vcheck++;
			
			if(vcheck%2==1){
			hideExclude("changeI");
			}
			else
				hideExclude("changeM");
		/* 	var radioValue = $('#toglef');
			console.log(radioValue);
			if (radioValue == "M") {
				hideExclude("changeM");
			} else if (radioValue == "I") {
				hideExclude("changeI");
			} */
		});
		
		// 서버에서 전달 받은 값으로 radio 버튼 변경
		$("#changeUpdateRadio").click(
				function() {
					var resultValue = $("#radioId").val();
					$("input[name=radioName][value=" + resultValue + "]").attr(
							"checked", true);
				});
		
		// 체크 되어 있는지 확인
		var checkCnt = $("input[name=radioName]:checked").size();
		if (checkCnt == 0) {
			// default radio 체크 (첫 번째)
			$("input[name=radioName]").eq(0).attr("checked", true);
		}

		// text area 숨김
		function hideExclude(excludeId) {
			$("#changeTextArea").children().each(function() {
				$(this).hide();
			});
			// 파라미터로 넘겨 받은 id 요소는 show
			$("#" + excludeId).show();
		}
		$('#board_image').on('change', function() {
			ext = $(this).val().split('.').pop().toLowerCase(); //확장자
			//배열에 추출한 확장자가 존재하는지 체크
			if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
				resetFormElement($(this)); //폼 초기화
				window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
			} else {
				file = $('#board_image').prop("files")[0];
				blobURL = window.URL.createObjectURL(file);
				$('#image_preview img').attr('src', blobURL);
				$('#image_preview').slideDown(); //업로드한 이미지 미리보기 
				$(this).slideUp(); //파일 양식 감춤
			}
		});
		
		$('#image_preview a').bind('click', function() {
			resetFormElement($('#board_image')); //전달한 양식 초기화
			$('#board_image').slideDown(); //파일 양식 보여줌
			$(this).parent().slideUp(); //미리 보기 영역 감춤
			return false; //기본 이벤트 막음
		});
		
		
		
		function resetFormElement(e) {
			e.wrap('<form>').closest('form').get(0).reset();
			e.unwrap();
		}
	</script>
</body>
</html>