// console.log('Works fine')
// var ENDPOINT = "http://api.songkick.com/api/3.0/search/artists.json?query="
// var finalEndpoint = "&apikey=Nvz5ypKtb8V40c3S"
// var artistResponse = {
// 	artistName: "",
// 	id: "",
// 	// onTourUntil: "",
// 	events : []
// };
// var calendarEndpoint = "http://api.songkick.com/api/3.0/artists/"
// var finalCalendarEndpoint = "/calendar.json?apikey=Nvz5ypKtb8V40c3S"

// function searchBand(artist) {	
// 	$.ajax({
// 		type: "GET",
// 		url: ENDPOINT + artist + finalEndpoint,
// 		success: bandHandler,
// 		error: responseError
// 	})
// };

// function bandHandler(response){
// 	$('#results').empty();
// 	var artistName = response.resultsPage.results.artist[0].displayName;
// 	var artistId = response.resultsPage.results.artist[0].id
// 	artistResponse.artistName = artistName;
// 	//artistResponse.id = artistId;
// 	artistResponse.onTourUntil = response.resultsPage.results.artist[0].onTourUntil
// 	// $('.js-artist-name').empty();
// 	// $('.js-artist-id').empty();
// 	 $('.section').append('<p>' + artistName + '<button class="favorite">Favorite</button></p>'); 
// 	 //' '<button class="js-favorite" id='+ artist);
// 	// $('.js-artist-id').append(artistId);
// 	$.ajax({
// 		type: "GET",
// 		url: calendarEndpoint + artistId + finalCalendarEndpoint,
// 		success: getConcerts
// 	})
// 	// debugger
// 	// console.log(artistName)
// };


// function getConcerts(response){
// 	console.log('aqui')
// 	$('#results').append('<ul class="js-artist-nextdates"></ul>');
// 	var artistEvents = response.resultsPage.results.event
// 	for (var i = 0; i < artistEvents.length; i++){
// 		$('.js-artist-nextdates').append("<li> City: " + artistEvents[i].location.city + ", Date: " + artistEvents[i].start.date + "</li>");
// 	};
// };

// function responseError(){
// 	console.log("no entra")
// };

// $(document).on('ready',function(){
// 	$('.guest-js-form').on('submit', function(event){
// 		event.preventDefault();
		
// 		var artist = $('.js-artist').val();
// 		searchBand(artist);	
// 	});
// });