<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.0.4/tailwind.min.css">


<style>
	@import url("https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap");
	
	body * {
	  font-family: "Poppins", sans-serif;
	}
	
	.bg-header {
	  background: #000034 !important;
	}
	
	.rounded-custom {
	  border-radius: 20px;
	}
	
	.sidebar {
	  border-top-left-radius: 40px;
	}
	
	.filter-menu {
	  background: rgba(255, 255, 255, 0.1) !important;
	}
	
	.invert {
	  filter: invert(1);
	}
	
	.p-btn {
	  padding: 5px;
	}
	
	.today-card {
	  transform: translateY(-3rem);
	  width: 61%;
	}
	
	.content {
	  transform: translateY(-3rem);
	}
	
	.klatsch-grid {
	  display: grid;
	  grid-template-columns: 1fr;
	  grid-row-gap: 2rem;
	}
</style>

</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.10/vue.min.js"></script>


	<div class="relative bg-gray-100 min-h-screen flex" id="app">
		<nav class="w-16 bg-white shadow-lg flex flex-col items-center">
			<a class="text-3xl font-black mt-2 mb-8">K</a> <img
				src="https://image.flaticon.com/icons/svg/61/61689.svg"
				class="h-8 w-8 mb-10 cursor-pointer hover:opacity-100" /> <img
				src="https://image.flaticon.com/icons/svg/179/179679.svg"
				class="h-8 w-8 opacity-25 hover:opacity-100 mb-10 cursor-pointer" />

			<img src="https://image.flaticon.com/icons/svg/1077/1077076.svg"
				class="h-8 w-8 opacity-25  cursor-pointer mb-10" /> <img
				src="https://image.flaticon.com/icons/svg/61/61122.svg"
				class="h-8 w-8 opacity-25  cursor-pointer" />
		</nav>
		<div class="w-full">
			<div
				class="h-24 bg-header flex justify-between items-start px-16 pt-4">
				<h2 class="text-4xl text-white font-bold">{{ title }}</h2>
				<div class="flex items-center">
					<img class="h-12 w-12 mr-4 rounded-full border-2 border-blue-500"
						:src="profilePic" />
					<h4 class="text-white font-thin">John Doe</h4>
				</div>
			</div>
			<div class="px-16 bg-header flex items-center">
				<div
					class="filter-menu h-12 px-4 py-3 rounded-full bg-gray-200 w-1/2 flex justify-between items-center">
					<span class="text-white text-xs">Show Only: </span>
					<div class="options flex items-center py-2">
						<button
							class="text-xs font-thin p-1 border-2 text-white rounded-full w-24 hover:bg-white hover:text-black mr-4">All</button>
						<button
							class="text-xs flex items-center justify-between opacity-50 font-thin py-1 border-2 text-white rounded-full w-26 hover:bg-white hover:text-black mr-4 px-2">
							Confirmed <img class="pl-1 h-4 w-4"
								src="https://image.flaticon.com/icons/svg/443/443138.svg" />
						</button>
						<button
							class="text-xs flex items-center justify-between opacity-50 font-thin py-1 border-2 text-white rounded-full w-26 hover:bg-white hover:text-black mr-4 px-4">
							Pending <img class="pl-1 h-4 w-4"
								src="https://image.flaticon.com/icons/svg/189/189106.svg" />
						</button>
						<button
							class="text-xs flex items-center justify-between opacity-50 font-thin py-1 border-2 text-white rounded-full w-26 hover:bg-white hover:text-black px-2">
							Cancelled <img class="pl-1 h-3 w-3"
								src="https://image.flaticon.com/icons/svg/579/579006.svg" />
						</button>
					</div>
				</div>
				<div
					class="ml-4 filter-menu h-12 p-btn rounded-full bg-gray-200 w-48 flex justify-between items-stretch">
					<div
						class="bg-green-500 hover:bg-green-400 cursor-pointer flex justify-center items-center rounded-full w-48 text-white">
						<img class="invert h-4 w-4 mr-3"
							src="https://image.flaticon.com/icons/svg/227/227121.svg" alt="" />
						<span class="font-hairline">Add Klatsch</span>
					</div>
				</div>
			</div>
			<div class="bg-header flex  px-16 pt-4 items-baseline">
				<h4 class="text-xl font-bold text-white w-1/2">Today</h4>
				<p
					class="w-48 italic text-sm opacity-75 text-white font-hairline text-right">Meeting
					in 19 minutes</p>
			</div>
			<header class="h-16  bg-header w-full  rounded-bl-full"> </header>
			<app-klatsch v-bind:klatsch="today"></app-klatsch>
			<div class="px-16 pt-8 content">
				<div class="h-2 border-gray-200 border-t-2 w-2/3"></div>
				<h4 class="text-xl font-bold text-gray-800 w-1/2 pt-4 mb-4">Upcoming</h4>
			</div>
			<div class="klatsch-grid">
				<app-klatsch v-for="kl in upcoming" v-bind:klatsch="kl"></app-klatsch>
			</div>
		</div>
		<div
			class="sidebar absolute right-0 bottom-0 top-0 w-1/4 bg-white mt-20 shadow-lg">
			<div
				class="relative text-center flex justify-center items-center border-b py-4 border-gray-200">
				<span> < </span> <span
					class="ml-4 mr-2 font-extrabold text-xl text-gray-900">September</span>
				<span class="mr-4 text-xl text-gray-600">2019</span> <span> >
				</span> <span class="absolute text-xl right-0 top-0 px-6 pt-1"> + </span>
			</div>
			<div
				class="flex justify-center items-center py-6 border-b border-gray-200">
				<div class="flex flex-col justify-center items-center">
					<div
						class="h-8 w-8 rounded-full flex justify-center items-center text-white"
						:class="getBgColor('Confirmed')">✔</div>
					<div>
						<span class=" font-extrabold">5</span><span
							class="text-sm text-gray-600"> Confirmed</span>
					</div>
				</div>
				<div class="mx-4 flex flex-col justify-center items-center">
					<div
						class="h-8 w-8 rounded-full flex justify-center items-center text-white"
						:class="getBgColor('Pending')">🕘</div>
					<div>
						<span class=" font-extrabold">3</span><span
							class="text-sm text-gray-600"> Pending</span>
					</div>
				</div>
				<div class="flex flex-col justify-center items-center">
					<div
						class="h-8 w-8 rounded-full flex justify-center items-center text-white"
						:class="getBgColor('Cancelled')">✖</div>
					<div>
						<span class=" font-extrabold">1</span><span
							class="text-sm text-gray-600"> Cancelled</span>
					</div>
				</div>
			</div>
			<div
				class="flex flex-col items-center mx-4 py-3 border-b border-gray-200">
				<span class="font-extrabold text-gray-900 text-xl">Klatsch
					Details</span>
				<div class="flex items-center justify-center my-4">
					<div class="h-2 w-2 mr-1 rounded-full"
						:class="getBgColor('Confirmed')"></div>
					<span class="text-sm font-bold" :class="getTextColor('Confirmed')">Confirmed</span>
				</div>
				<div class="flex justify-center items-center">
					<img :src="profilePic" class="h-16 w-16 rounded-full" alt="">
					<img src="https://image.flaticon.com/icons/svg/251/251078.svg"
						class="h-10 w-10 mx-6 opacity-75"> <img :src="today.avatar"
						class="h-16 w-16 rounded-full" alt="">
				</div>
				<div class="mt-4 flex flex-col">
					<span class="font-extrabold text-lg text-gray-900">{{today.client}}</span>
					<span class="text-base text-gray-600 mt-1">{{today.phone}}</span>
				</div>
			</div>
			<div class="mx-4 py-3 border-b border-gray-200">
				<div class="px-8">
					<div class="flex justify-between items-start mb-4">
						<div class="flex flex-col">
							<span class="font-extrabold text-xl text-gray-900">Date &
								Time</span>
							<p class="text-sm text-gray-600 flex items-center">3.30PM -
								4.00PM</p>
						</div>
						<img src="https://image.flaticon.com/icons/svg/1159/1159876.svg"
							alt="" class="cursor-pointer h-4 w-4 opacity-25 mt-2">
					</div>
					<div class="flex justify-between items-start mb-4">
						<div class="flex flex-col">
							<span class="font-extrabold text-xl text-gray-900">Location</span>
							<p class="text-sm font-bold text-gray-600 flex items-center">
								Interpid Cafe</p>
							<p class="text-sm text-gray-600 flex items-center">150 First
								St, Cambridge, MA 02141</p>
						</div>
						<img src="https://image.flaticon.com/icons/svg/1159/1159876.svg"
							alt="" class="cursor-pointer h-4 w-4 opacity-25 mt-2">
					</div>
					<div class="flex justify-between items-start">
						<div class="flex flex-col">
							<span class="font-extrabold text-xl text-gray-900">Topics</span>
							<p class="text-sm text-gray-600 flex items-center">Movies,
								Health, Food</p>
						</div>
						<img src="https://image.flaticon.com/icons/svg/1159/1159876.svg"
							alt="" class="cursor-pointer h-4 w-4 opacity-25 mt-2">
					</div>
				</div>
			</div>
			<div class="mx-4 py-3">
				<div class="px-8">
					<div class="flex justify-between items-center mb-4">
						<span class="font-extrabold text-xl text-gray-900">Status</span>
						<p
							class="text-sm text-gray-600 flex items-end underline cursor-pointer">
							Cancel Klatsch</p>
					</div>
				</div>
			</div>
		</div>

</body>


</html>