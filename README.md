# :pushpin: EPA
> OpenCV를 이용한 실시간 운동자세 분석 통합 관리 서비스 


</br>

## 1. 제작 기간 & 참여 인원
- 2024년 1월 3일 ~ 3월 5일
- 4인 프로젝트

</br>

## 2. 사용 기술

| JavaScript | Python |  Spring  |  Mediapipe   | Falsk |
| :--------: | :--------: | :------: | :-----: | :-----: |
|  <img src="https://github.com/n0hack/readme-template/assets/151595284/cba04890-eae7-4dce-8769-d4130c0b56cb.png" width="100" height="100"/> |    <img src="https://github.com/n0hack/readme-template/assets/151595284/76433d79-57d7-4626-b32b-8323d551ae1b" width="100" height="100"/>     | <img src="https://github.com/n0hack/readme-template/assets/151595284/72f17840-9db3-489d-b895-b62dcedf7149" width="100" height="100"/>| <img src="https://github.com/n0hack/readme-template/assets/151595284/54b5b452-7ff5-46a6-ab4b-cb02eed2c0fe" width="100" height="100"/> | <img src="https://github.com/n0hack/readme-template/assets/151595284/93032b6f-05f2-43e7-8544-58981c7f8dde" width="100" height="100"/> |

</br>

## 3. ERD 설계
![image01](https://github.com/SMHRD-2021-KDT-BigData-19/EPA/assets/151595284/14a664da-2943-437e-ac78-d707920a9368)


## 4. 핵심 기능
이 서비스의 핵심 기능은 컨텐츠 등록 기능입니다.  
사용자는 단지 컨텐츠의 카테고리를 선택하고, URL만 입력하면 끝입니다.  
이 단순한 기능의 흐름을 보면, 서비스가 어떻게 동작하는지 알 수 있습니다.  

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름


### 4.2. 사용자 요청



### 4.3.



### 4.4. 



### 4.5. 

</div>
</details>

</br>

## 5. 핵심 트러블 슈팅
### 5.1. 

## 6. 그외 트러블슈팅
<details>
<div markdown="1">
출석 기능

하루에 단 한번만 출석이 가능하게 구현하고자 하였으나
출석일수가 버튼을 누르면 계속 증가하거나 증가되지 않는 문제가 있었음 
![error](https://github.com/n0hack/readme-template/assets/151595284/0b448dfa-9a9d-4692-bcd9-d32deec22d24)
=> 회원가입 단계에서 등급 객체를 추가하여 회원가입 일자로 default 값을 지정, 출석 버튼 클릭 시 TEAR_TB에 LASTDATE를 갱신하여 이전 값과 비교해 날짜가 다른 경우에만 UPDATE 되도록 수정
![KakaoTalk_20240227_154531080](https://github.com/n0hack/readme-template/assets/151595284/d14a9197-b409-484a-b093-571b0594298b)
![tnwjd](https://github.com/n0hack/readme-template/assets/151595284/20dfff08-ae9a-4322-bbb3-84601e997425)
</div>
</details>

