console.log('Works fine')
// var testUrl = 'http://api.bandsintown.com/artists/Skrillex/events.json?api_version=2.0&app_id=Groopietravel'
var ENDPOINT = "http://api.songkick.com/api/3.0/search/artists.json?query="
var finalEndpoint = "&apikey=Nvz5ypKtb8V40c3S";
var artistResponse = {
	name: "",
	id : "",
	events : []
};
artistResponse.events = [];
var calendarEndpoint = "http://api.songkick.com/api/3.0/artists/"
var finalCalendarEndpoint = "/calendar.json?apikey=Nvz5ypKtb8V40c3S"

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
	artistResponse.name = artistName;
	artistResponse.id = artistId;
	$('.js-artist-name').empty();
	$('.js-artist-id').empty();
	// $('.js-artist-name').append(artistName);
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
	console.log(artistEvents);
	 // console.log(artistEvents[0].location.city)
	 // console.log(artistEvents.length)
	$(".js-artist-nextdates").empty()
	for (var i = 0; i < artistEvents.length; i++){
			//createListArtistEvent(artistEvents[i].location.city);
			artistResponse.events[i] = {city: artistEvents[i].location.city, date: artistEvents[i].start.date};

			// debugger	
			$(".js-artist-nextdates").append("<li> City: " + artistEvents[i].location.city + ", Date: " + artistEvents[i].start.date + "</li>")
	};
};

function createListArtistEvent(event){
	$(".js-artist-nextdates").append("<li> City: " + event + ", Date: ") // + //event.start.date + "</li>")
};

function responseError(){
	alert("Error on Request")
};

$(document).ready(function(){
	$('.js-form').on('submit', function(event){
		event.preventDefault();
		var artist = $('.js-artist').val();	
		searchArtistEvents(artist);
	})
});