console.log('Works fine')
var ENDPOINT = "http://api.songkick.com/api/3.0/search/artists.json?query="
var finalEndpoint = "&apikey=Nvz5ypKtb8V40c3S"
var artistResponse = {
	artistName: "",
	id: "",
	events : []
};
artistResponse.events = [];
var calendarEndpoint = "http://api.songkick.com/api/3.0/artists/"
var finalCalendarEndpoint = "/calendar.json?apikey=Nvz5ypKtb8V40c3S"

function searchArtistInDatabase(bandName){
	$.ajax({
		type: 'POST',
		url: '/api/v1/bands/search',
		data: {
			'band' : bandName
		},
		success: function(r){
			if (r.hasOwnProperty('error')){
				searchArtistEvents(r.band)
			} else if(r.hasOwnProperty('success')){
				$.each(r.band, function(key, value) {
				   $('.js-artist-name ul').append('<li>'+key+': '+value+'</li>');
				});
				
			}
		}
	})
};
function searchArtistEvents(artist) {	
	$.ajax({
		type: "GET",
		url: ENDPOINT + artist + finalEndpoint,
		success: responseHandler,
		error: responseError
	})
};
function responseHandler(response){

	var artistName = response.resultsPage.results.artist[0].displayName;
	var artistId = response.resultsPage.results.artist[0].id
	artistResponse.artistName = artistName;
	artistResponse.id = artistId;
	$('.js-artist-name').empty();
	$('.js-artist-id').empty();
	 $('.js-artist-name').append(artistName);
	// $('.js-artist-id').append(artistId);
	$.ajax({
		type: "GET",
		url: calendarEndpoint + artistId + finalCalendarEndpoint,
		success: getTourDates
	})
	// debugger
	// console.log(artistName)
};

function getTourDates(response){
	var artistEvents = response.resultsPage.results.event
	 //console.log(artistEvents);
	 // console.log(artistEvents[0].location.city)
	 // console.log(artistEvents.length)
	$(".js-artist-nextdates").empty()
	for (var i = 0; i < artistEvents.length; i++){
			//createListArtistEvent(artistEvents[i].location.city);
			artistResponse.events.push({
				city: artistEvents[i].location.city, 
				date: artistEvents[i].start.date,
				lat: artistEvents[i].location.lat,
				lng: artistEvents[i].location.lng,
				name: artistEvents[i].displayName
			});
			$(".js-artist-nextdates").append("<li> City: " + artistEvents[i].location.city + ", Date: " + artistEvents[i].start.date + "</li>")
	};
	$.ajax({
		type: "POST",
		url: "/api/v1/bands/",
		data: artistResponse,
		success: function(response){		
			console.log(response)
		}
	});
};
// function createListArtistEvent(event){
// 	$(".js-artist-nextdates").append("<li> City: " + event + ", Date: ") // + //event.start.date + "</li>")
// };
function responseError(){
	alert("Error on Request")
};
$(document).ready(function(){
	$('.js-form').on('submit', function(event){
		event.preventDefault();
		var artist = $('.js-artist').val();
		searchArtistInDatabase(artist);	
	})
});