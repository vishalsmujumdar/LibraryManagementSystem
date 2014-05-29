# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Randomize = ->
  images = new Array(asset-data-url("1.jpg"),
  					 asset-data-url("2.jpg"),
  					 asset-data-url("3.jpg"), 
  					 asset-data-url("7.jpg"), 
  					 asset-data-url("8.jpg"), 
  					 asset-data-url("9.jpg"), 
  					 asset-data-url("10.jpg"), 
  					 asset-data-url("11.jpg"), 
  					 asset-data-url("12.jpg"), 
  					 asset-data-url("13.jpg"), 
  					 asset-data-url("14.jpg")
  					)
  imageNum = Math.floor(Math.random() * images.length)
  document.getElementById("banner").style.background = "url('" + images[imageNum] + "')"
  return
