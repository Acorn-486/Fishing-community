# JSP를 이용한 낚시 커뮤니티 사이트
## 0. 목차
1. [개요](#1-개요)
2. [기술](#2-기술)
3. [DB EER Diagram](#3-db-eer-diagram)
4. [사이트맵](#4-사이트맵)
5. [기능](#5-기능)
## 1. 개요
  ![메인](https://user-images.githubusercontent.com/97069940/156348525-7b01e7e2-7850-420e-98a8-f3f3aab5f5fb.JPG)
  낚시에 관심있는 사람들이 서로 소통하고 필요한 용품들의 정보 및 구매를 할수 있도록 jsp를 사용하여 만든 사이트 입니다.
  
  낚시 포인트는 카카오지도api에 클러스터를 사용해서 위치들을 등록해 놓았고, 회원가입의 주소는 입력은 다음 주소api를 사용했습니다.
  
## 2. 기술
  1. Web Front : ```HTML5```, ```CSS```, ```JavaScript```, ```Bootstrap```
  2. Web Server : ```Java```, ```ApacheTomcat```
  3. DBMS : ```MySQL```
  4. 개발환경 : ```Eclipse```

## 3. DB EER Diagram
  ![EER Diagram](https://user-images.githubusercontent.com/97069940/158005579-c693b6df-445e-4949-a894-2d1b60b89045.JPG)
  
## 4. 사이트맵
  ![사이트맵](https://user-images.githubusercontent.com/97069940/156521264-a3f5f7cf-5aa5-4621-b1dd-1ec4f221e09c.JPG)
  
## 5. 기능
  1. 회원 CRUD
  2. 로그인
  3. 게시물 CRUD
  4. 댓글 CRUD
  5. 페이징
  6. 게시물 검색
  7. 상품 장바구니 담기/보기
  8. 지도 API 사용해서 포인트 구현
  9. 회원가입시 주소 API 사용
