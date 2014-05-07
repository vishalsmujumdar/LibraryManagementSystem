angular.module('AuthorSelectorApp.controllers', []).controller('authorsController',function($scope, $http){
	
	$scope.nameFilter = null;
	
	// $scope.authorsList = [
	// 	{
	// 		id: 1,
	// 		name: "J K Rowling"
	// 	},
	// 	{
	// 		id: 2,
	// 		name: "Jeffrey Archer"
	// 	},
	// 	{
	// 		id: 3,
	// 		name: "Chetan Bhagat"
	// 	}
	// ];
    $http.jsonp("/authors/ajaxsearchauthors").success(function(data,status,headers,config){
		$scope.authorsList = data;
		console.log(data);
    });
	
});