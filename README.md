## 📝 EPA
> OpenCV를 이용한 실시간 운동자세 분석 통합 관리 서비스 


</br>

## 📌 수행내용

1️⃣ 프로젝트 기획

- 기획 및 시장 조사 
- 기술 조사
- 프로젝트 목표 및 진행 단계 설정
- 서비스 흐름도 및 화면 구성도 구성 
- 기획서 및 개요서 작성
</br>

2️⃣ 데이터 수집 및 전처리 

 - AI-Hub의 피트니스 자세 이미지 수집
 - 데이터 Numpy 배열로 변환 및 csv 파일 변환
 - OpenCV 및 MediaPipe를 이용한 사용자 데이터 수집
 </br>
 
3️⃣ 딥러닝

 - MLP 모델을 통한 학습 및 시스템 검증
 - 스탠딩 사이드 크런치, 런지, 팔굽혀펴기 정자세에 대한 좌표값을 통해 정자세 모델 학습
   (라벨링 데이터 사용)
 - MediaPipe를 landmark와 데이터의 골격 포인트 매칭
 </br>
 
4️⃣ DB구축

 - 각종 Table 정의 및 구성
   
</br>

5️⃣ 웹페이지 및 기능 구현 

 - 운동 루틴 설정, 등급 등 웹 기능을 직관적으로 구성
 - OpenCV를 통하여 웹캠을 통해 사용자 운동 영상을 입력할 수 있도록 구성
 - flask, Python, java를 활용하여 Deep Learning모델과 연동
 - Html/CSS, Java, JSP, JS, MySQL, Spring 등을 이용한 웹페이지 기능
   
</br>

6️⃣ 후처리 

- 최종 자세 분석 Test 진행
- 보완할 점 보완 진행
  
</br>

7️⃣ 최종 마무리 

- 분석데이터 – Back –Front 연동


</br>

## ✨ 제작 기간 & 참여 인원
- 2024년 1월 3일 ~ 3월 5일
- 4인 프로젝트

</br>

## 🛠 사용 기술

| JavaScript | Python |  Spring  |  Mediapipe   | Falsk | OpenCV |
| :--------: | :--------: | :------: | :-----: | :-----: | :-----: |
|  <img src="https://github.com/n0hack/readme-template/assets/151595284/cba04890-eae7-4dce-8769-d4130c0b56cb.png" width="100" height="100"/> |    <img src="https://github.com/n0hack/readme-template/assets/151595284/76433d79-57d7-4626-b32b-8323d551ae1b" width="100" height="100"/>     | <img src="https://github.com/n0hack/readme-template/assets/151595284/72f17840-9db3-489d-b895-b62dcedf7149" width="100" height="100"/>| <img src="https://github.com/n0hack/readme-template/assets/151595284/54b5b452-7ff5-46a6-ab4b-cb02eed2c0fe" width="100" height="100"/> | <img src="https://github.com/n0hack/readme-template/assets/151595284/93032b6f-05f2-43e7-8544-58981c7f8dde" width="100" height="100"/> | <img src="https://github.com/SMHRD-2021-KDT-BigData-19/EPA/assets/151595284/86b2dd86-1459-4339-b674-67dd005cb3bb" width="100" height="100"/> |


</br>

## 📦 ERD 설계
![image01](https://github.com/SMHRD-2021-KDT-BigData-19/EPA/assets/151595284/14a664da-2943-437e-ac78-d707920a9368)


## 🔎 핵심 기능
이 서비스의 핵심 기능은 컨텐츠 등록 기능입니다.  
사용자는 단지 컨텐츠의 카테고리를 선택하고, URL만 입력하면 끝입니다.  
이 단순한 기능의 흐름을 보면, 서비스가 어떻게 동작하는지 알 수 있습니다.  

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### ⭐  전체 흐름
![image](https://github.com/SMHRD-2021-KDT-BigData-19/EPA/assets/151595284/0ce162ac-6b75-4877-8e5d-1f5008a482b2)

### ⭐  운동자세 분석기능



### 3️⃣



### 4️⃣ 



### 5️⃣ 

</div>
</details>

</br>

## 🌟 핵심 트러블 슈팅
<details>
  <summary><b>Flask MediaPipe 오류, 딜레이</b></summary>
<div markdown="1">

Spring의 web cam에서 이미지 형태로 flask로 전송을 하여 실시간 MediaPipe가 적용된 화면을 출력하고자 하였으나  MediaPipe가 적용되지 않는 현상이 발생하였고, MediaPipe가 적용된 이미지를 저장하여 출력한 결과 매우 심한 딜레이가 발생함
![flask 딜레이](https://github.com/SMHRD-2021-KDT-BigData-19/EPA/assets/151595343/6ec100cc-bfd3-457d-8363-895c8f3bd7b3)
=> 웹소켓을 통해 Web cam에서 이미지 데이터를 flask로 전송하여 flask에서 MediaPipe가 적용된 이미지 데이터를 바로 JSP 파일로 전송하여 딜레이를 줄일 수 있었음
<br>

</div>
</details>

## 📍그외 트러블슈팅

<details>
  <summary><b>출석 기능오류</b></summary>
<div markdown="1">

하루에 단 한번만 출석이 가능하게 구현하고자 하였으나
출석일수가 버튼을 누르면 계속 증가하거나 증가되지 않는 문제가 있었음 
![error](https://github.com/n0hack/readme-template/assets/151595284/0b448dfa-9a9d-4692-bcd9-d32deec22d24)
=> 회원가입 단계에서 등급 객체를 추가하여 회원가입 일자로 default 값을 지정, 출석 버튼 클릭 시 TEAR_TB에 LASTDATE를 갱신하여 이전 값과 비교해 날짜가 다른 경우에만 UPDATE 되도록 수정
<br>
![KakaoTalk_20240227_154531080](https://github.com/n0hack/readme-template/assets/151595284/d14a9197-b409-484a-b093-571b0594298b)
![tnwjd](https://github.com/n0hack/readme-template/assets/151595284/20dfff08-ae9a-4322-bbb3-84601e997425)
</div>
</details>

<details>
  <summary><b>게시판 이미지업로드오류</b></summary>
<div markdown="1">
게시판에 이미지를 업로드할 때, 이미지를 컨트롤러로 전송하기 위해 DTO를 사용했습니다. 이 DTO에는 파일 이름, 파일 경로 및 게시판 번호를 필드 생성자로 포함하여 전송했습니다. 그러나 이미지를 불러올 때 DB에서 문제가 발생했습니다.
<details>
<summary><b>기존 코드</b></summary>
<div markdown="1">

      @PostMapping("/boardInsert.do")
      public String boardInsert(Board vo, MultipartHttpServletRequest file) {
         
         // user_id, category, title, content DB에 업로드
         mapper.boardInsert(vo);
         
         
         int BD_NO = vo.getBD_NO();
         
         // 업로드한 이미지 파일을 서버에 저장 할 경로
         String uploadFolder = "C:\\image\\post\\" + BD_NO;
         
         // 이미지 파일 리스트에 저장
         List<MultipartFile> list = file.getFiles("file");
         
         // 이미지 파일 서버에 저장
         for(int i = 0; i<list.size(); i++) {
            String fileRealName = list.get(i).getOriginalFilename();
            
            
            // 폴더가 존재하지 않으면 생성
            File folder = new File(uploadFolder);
              if (!folder.exists()) {
                  folder.mkdirs();
              }
            
            File saveFile = new File(uploadFolder + "\\" + fileRealName);
            
            try {
               list.get(i).transferTo(saveFile);
            } catch (IllegalStateException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            } catch (IOException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            
            // 게시물 이미지 DB에 저장
            // picture_id = i+1, post_id = post_id, folder = uploadFolder, file_name = fileRealName
            image Ivo = new image(fileRealName,BD_NO, uploadFolder);
            
            
            mapper.imageUp(Ivo);
            
         }
         return "redirect:/boardList.do";
      }
</div>
</details>
=> 이 문제는 필드 생성자에서 파일 번호를 함께 전송하지 않았기 때문에 발생한 것으로 확인되었습니다. 따라서 파일 번호를 함께 보내기 위해 별도의 DTO를 만들어 컨트롤러로 전송하는 방법으로 문제를 해결했습니다.
<details>
<summary><b>개선 코드</b></summary>
<div markdown="1">
	
	public imageList(int file_NO, String file, int bD_NO, String filePath) {
			super();
			this.file_NO = file_NO;
			this.file = file;
			BD_NO = bD_NO;
			this.filePath = filePath;
		}
</div>
</details>
</div>
</details>

<details>
  <summary><b>캘린더 일정등록 오류</b></summary>
<div markdown="1">
기존 Fullcalendar API를 사용하여 종료시간이 시작시간보다 작을 때 알림창을 표시하고, 그렇지 않은 경우에는 캘린더에 이벤트를 추가하도록 코드를 작성했습니다. 그러나 이렇게 해도 DB에 값이 전송되지 않는 오류가 발생했습니다. 
<details>
  <summary><b>기존 코드</b></summary>
<div markdown="1">
	
  	 select: function(arg) {
           // 모달을 표시
           $("#exampleModal").modal("show");
           var startDate = new Date(arg.start).toISOString().substring(0, 16);
           var endDate = new Date(arg.end).toISOString().substring(0, 16);
           $("#EX_ID").val('code1');
           $("#EXPL_ID").val('');
           $("#EX_SDATE").val(startDate);
           $("#EX_FDATE").val(endDate);
           $("#P_COLOR").val('pink'); // 기본 색상 설정

           
           // '추가' 버튼 클릭 이벤트 핸들러 설정
           $("#saveChanges").off("click").on("click", function() {
             var eventData = {
               title: $("#EXPL_ID").val(), // 사용자가 입력한 일정 이름
               start: $("#EX_SDATE").val(), // 사용자가 선택한 시작 시간
               end: $("#EX_FDATE").val(), // 사용자가 선택한 종료 시간
               color: $("#P_COLOR").val(), // 사용자가 선택한 배경색상
             };
             if (eventData.title && eventData.start && eventData.end) {
               if (eventData.start > eventData.end) {
                 alert("시작 시간이 종료 시간보다 늦을 수 없습니다.");
               } else {
	         title: $("#EXPL_ID").val(), 
                 start: $("#EX_SDATE").val(), 
                 end: $("#EX_FDATE").val(), 
                 color: $("#P_COLOR").val(),
                 calendar.addEvent(eventData);
               }
             } else {
	     	
               alert("비어있는 일정을 채워주세요.");
               return false;
             }
             
             
             $("#cancelButton").off("click").on("click", function() {
            	    $("#exampleModal").modal("hide"); // 모달을 숨깁니다.
            	});
              
           });
     
         },
</div>
</details>
=> 이를 해결하기 위해 else 블록에서 값을 추가하는 대신, 별도의 AJAX 요청을 추가하여 값을 받아왔습니다.
<details>
  <summary><b>개선 코드</b></summary>
<div markdown="1">
      
      $.ajax({
    	  url : "calendarRest",
    	  type : "post",
    	  success : function(data){
    		  
    		  console.log(data);
    		  
    		  for(let i = 0; i < data.length; i++){
    			  
    			  
    			  var dd = {
    		               title: data[i].expl_ID, // 사용자가 입력한 일정 이름
    		               url : "myScDelete.do?pl_BUNHO=" + data[i].pl_BUNHO,
    		               start: data[i].ex_SDATE, // 사용자가 선택한 시작 시간
    		               end: data[i].ex_FDATE, // 사용자가 선택한 종료 시간
    		               color: data[i].pn_COLOR, // 사용자가 선택한 배경색상
    		             };
    			  calendar.addEvent(dd);
    			 
    		  }
    		  
    	  }, error : function(){
    		  alert("error!");
    	  }
      });
</div>
</details>


</div>
</details>

<details>
  <summary><b>DB컬럼 NAME오류</b></summary>
<div markdown="1">
캘린더에 일정을 DB에 등록할 때 일정 이름, 일정 날짜, 운동 코드는 정상적으로 DB에 들어가지만, 일정색이 DB에 들어가지 않는 오류가 발생했습니다. 
	<br>
초기에는 일정색의 컬럼 이름을 P_NAME으로 설정했었으나, 이전에 알파벳이 두 번 들어가는 컬럼이 정상적으로 값이 들어갔다는 것을 확인하여, 컬럼 이름을 P_NAME을 PN_NAME으로 수정하였더니 문제가 해결되었습니다.
	
![스크린샷 2024-02-27 165811](https://github.com/SMHRD-2021-KDT-BigData-19/EPA/assets/151595284/30eb0bbd-8d29-4cc7-90be-d5c102699ac0)
</div>
</details>

## 📺시연 영상
https://youtu.be/Q3Po9jLjGHc
