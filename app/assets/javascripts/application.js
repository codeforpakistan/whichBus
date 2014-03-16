// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require turbolinks
//= require twitter/bootstrap
//= require_tree .

var myArray1 = new Array();

$(document).ready(function()
{
	//var myArray1 = new Array();
	$(function()
	{
		$( "#sortable" ).sortable();
		$( "#sortable" ).disableSelection();
	});
	$("#save #button").click(function()
	{
		var sortedIDs = $("#sortable").sortable( "toArray" );
		$("#save p").html(sortedIDs.toString());
		$("#save #saveRoute").append("<input name=\'sortedRoute\' id=\'sortedRoute\' type=\'hidden\' value= \'"+ sortedIDs.toString() + "\'>");
		alert(sortedIDs.join(" "));

	});

	$('#searchAjaxForm input').keyup(function()
	{
		$('#busStopsHolder').hide();
		$('#searchAjaxForm').submit();
	});
	
	$('#busStopsHolder').click(function()
	{
		//alert("Incldue Button Presed.");
	});



	// $("#busStopsHolder .includeButtonPressed").click(function()
	// {
	// 	alert("hello to include button option");
	// 	$('.includeButtonPressed').submit();
	// 	alert("From Submitted");
	// 	// var tag = event.target.nodeName;
 //        $(event.target).hide();
 //        alert(event.target);

	// 	//alert("Include button is pressed");
	// });
	$(".removeButtonPressed input").click(function()
	{
		//alert("hello to remove button");
		$('.removeButtonPressed').submit();
		var tag = event.target.nodeName;
        $(event.target).hide();

	});
});
