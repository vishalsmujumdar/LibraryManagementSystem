angular.module('AuthorSelectorApp.controllers', []).controller('authorsController',function($scope){
	$scope.authorsList = [
		{
			id: 1,
			name: "J K Rowling"
		},
		{
			id: 2,
			name: "Jeffrey Archer"
		},
		{
			id: 3,
			name: "Chetan Bhagat"
		}
	];
});