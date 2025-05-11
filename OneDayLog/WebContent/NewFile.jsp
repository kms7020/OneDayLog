<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>맛집 지도</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 임시 스타일 (map.css가 없다면 적용) -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        .styled-box {
            font-size: 16px;
            margin-bottom: 10px;
        }

        .instruction-box {
            margin-bottom: 20px;
            font-weight: bold;
        }

        .map-container {
            margin-bottom: 20px;
        }

        #map {
            width: 100%;
            height: 500px;
            border: 1px solid #ccc;
        }

        .restaurant-info-container {
            background-color: #f9f9f9;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .recommend-button {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 6px;
        }

        .menu-button {
            display: inline-block;
            margin-top: 10px;
            margin-right: 10px;
            text-decoration: none;
            color: #333;
            background-color: #f0f0f0;
            padding: 6px 12px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">🍽️ 맛집 지도 🍽️</h1>

    <div class="styled-box">추천 맛집들을 지도로 확인해보세요!</div>

    <div class="instruction-box">
        <strong>지도에서 마커를 클릭하면 맛집 정보를 확인할 수 있습니다.</strong>
    </div>

    <!-- 지도 영역 -->
    <div class="map-container">
        <div id="map"></div>
    </div>

    <!-- 맛집 정보 표시 -->
    <div class="restaurant-info-container" id="restaurantInfo">
        <h3>맛집 정보</h3>
        <p>지도에서 맛집 마커를 클릭하면 정보가 표시됩니다.</p>
    </div>

    <!-- 메인 페이지로 -->
    <a href="<%=cp%>/main.jsp" class="recommend-button">메인으로 돌아가기</a>

    <!-- Kakao Map SDK (마지막에 위치) -->
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db746cc19d8758e6bc0d2918bdcb108e&autoload=true"></script>

    <script>
        const restaurantData = [
            { name: "을지로 필동면옥", lat: 37.5658, lng: 126.9926, description: "70년 전통의 평양냉면 전문점", category: "한식", rating: "⭐⭐⭐⭐" },
            { name: "봉피양", lat: 37.5744, lng: 126.9812, description: "정갈한 평양냉면과 만두", category: "한식", rating: "⭐⭐⭐⭐⭐" },
            { name: "광화문국밥", lat: 37.5720, lng: 126.9769, description: "깔끔한 선지해장국과 소고기국밥", category: "한식", rating: "⭐⭐⭐⭐" },
            { name: "두툼 삼청점", lat: 37.5826, lng: 126.9832, description: "두툼한 고기가 올라간 연어덮밥", category: "일식", rating: "⭐⭐⭐⭐" },
            { name: "이치에", lat: 37.5273, lng: 127.0276, description: "가성비 좋은 정통 일식 오마카세", category: "일식", rating: "⭐⭐⭐⭐⭐" }
        ];

        let map;
        let currentMarkers = [];

        window.onload = function () {
            initMap();
        };

        function initMap() {
            const mapContainer = document.getElementById('map');
            const mapOption = {
                center: new kakao.maps.LatLng(37.566826, 126.9786567),
                level: 7
            };
            map = new kakao.maps.Map(mapContainer, mapOption);
            displayRestaurants();
        }

        function displayRestaurants() {
            restaurantData.forEach((restaurant) => {
                const markerPosition = new kakao.maps.LatLng(restaurant.lat, restaurant.lng);
                const marker = new kakao.maps.Marker({
                    map: map,
                    position: markerPosition,
                    title: restaurant.name
                });

                kakao.maps.event.addListener(marker, 'click', function () {
                    showRestaurantInfo(restaurant);
                });

                currentMarkers.push(marker);
            });
        }

        function showRestaurantInfo(restaurant) {
            const infoContainer = document.getElementById('restaurantInfo');
            infoContainer.innerHTML = `
                <h3>${restaurant.name}</h3>
                <div class="restaurant-details">
                    <p><strong>카테고리:</strong> ${restaurant.category}</p>
                    <p><strong>평점:</strong> ${restaurant.rating}</p>
                    <p><strong>설명:</strong> ${restaurant.description}</p>
                    <a href="#" class="menu-button" onclick="alert('준비 중인 기능입니다.'); return false;">메뉴 보기</a>
                    <a href="#" class="menu-button" onclick="alert('준비 중인 기능입니다.'); return false;">리뷰 작성</a>
                </div>
            `;
        }
    </script>
</body>
</html>
