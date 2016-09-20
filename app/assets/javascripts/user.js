console.log('Ok')
var ENDPOINT = "http://api.songkick.com/api/3.0/search/artists.json?query="
var finalEndpoint = "&apikey=Nvz5ypKtb8V40c3S"
var artistResponse = {
	artistName: "",
	id: "",
	events : []
};
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
				searchForArtist(r.band)
			} else if(r.hasOwnProperty('success')){
				// $('.js-artist-name ul').empty()
				// $('.js-artist-ontour').empty()
				$('.js-artist-name').append('<p>'+ r.band.name + '<button class="js-favorite" id='+ r.band.id + '>Favorite</button></p>')
				//$('.js-artist-name ul').append("<a class='button'><span class='icon is-small'><i class='fa fa-object-ungroup'></i></span> fa-object-ungroup</a>");
				$('.js-artist-ontour').append('<p>'+ r.band.on_tour_until + '</p>')
			}
		}
	})
};
function favBand(id){
	$.ajax({
		url: '/api/v1/bands/favorite_band',
		type: 'POST',
		data: {
		'id' : id
		},
		success: function(r){
			console.log("Favorited in Database!")
		}
	});
}
//============================================================
// BUSCA ARTISTA EN SONGKICK
//============================================================

function searchForArtist(artist) {	
	$.ajax({
		type: "GET",
		url: ENDPOINT + artist + finalEndpoint,
		success: responseHandler,
		error: responseError
	})
};

//============================================================
// BUSCA LOS CONCIERTOS DE UN ARTISTA CON SU ID 
//============================================================
function responseHandler(response){ 
	var artistName = response.resultsPage.results.artist[0].displayName;
	var artistId = response.resultsPage.results.artist[0].id
	artistResponse.artistName = artistName;
	artistResponse.id = artistId;
	artistResponse.onTourUntil = response.resultsPage.results.artist[0].onTourUntil
	$('.js-artist-name').empty();
	$('.js-artist-id').empty();
	// $('.js-artist-name').append('<p>' + artistName + '</p>') //' '<button class="js-favorite" id='+ artist);
	// $('.js-artist-id').append(artistId);
	$.ajax({
		type: "GET",
		url: calendarEndpoint + artistId + finalCalendarEndpoint,
		success: getTourDates
	})		
};
function getTourDates(response){
	var artistEvents = response.resultsPage.results.event
	if (artistEvents === undefined ){
		alert("No Matches Found")
	} else {
		console.log(artistEvents)
		$(".js-artist-nextdates").empty()
		for (var i = 0; i < artistEvents.length; i++){
				artistResponse.events.push({
					city: artistEvents[i].location.city, 
					date: artistEvents[i].start.date,
					lat: artistEvents[i].location.lat,
					lng: artistEvents[i].location.lng,
					name: artistEvents[i].displayName,
					venue: artistEvents[i].venue.displayName
				});
			$(".js-artist-nextdates").append("<li> City: " + artistEvents[i].location.city + ", Date: " + artistEvents[i].start.date + "</li>")
		};
		$.ajax({
			type: "POST",
			url: "/api/v1/bands/",
			data: artistResponse,
			success: function(r){		
				$('.js-artist-name').append('<li>'+ r.name + '<button class="js-favorite" id='+ r.id + '>Favorite</button></li>');
				console.log(response)
			}
		});
	}
};

function unfavoritize(id){
	$.ajax({
		url: '/api/v1/bands/unfavorite/' + id,
		type: 'PATCH',
		// data: {
		// 'id' : id
		// },
		success: handleUnfavoriteResponse
	});
}


function handleUnfavoriteResponse(response){
	console.log("UnFavorited in Database!");
	//$('.no-favorite').val("Unfavorited!")
}

function responseError(){
	alert("Error on Request")
};
$(document).ready(function(){
	$('.js-form').on('submit', function(event){
		event.preventDefault();
		var artist = $('.js-artist').val();
		searchArtistInDatabase(artist);
		$('.js-submit').prop('disabled', true)	
	})
	$('.js-artist-name').on('click', '.js-favorite', function(event){
		event.preventDefault();
		var id = $(this).attr('id');
		favBand(id);
	$('.js-favorite').prop('disabled', true)
	});	
	$('.no-favorite').on('click', function(event){
		event.preventDefault();
		var id = $(this).attr('id')
		$('.no-favorite').prop('disabled', true)
		unfavoritize(id);
	})	
});