
  /*eslint-disable */

  $(document).ready(function() {
    console.log('hello world');

     function addVideoToList(video) {


        var apiKey = 'AIzaSyAKY-WMT6Iy8iLsjPnQ3X86Yogt-Wg7b70';
        var ratingYoutubeURL = 'https://www.googleapis.com/youtube/v3/videos?part=statistics&id=' + video.youtubeId + '&key=' + apiKey

        var getJSON = function (yourUrl) {
          var Httpreq = new XMLHttpRequest(); // a new request
          Httpreq.open("GET", yourUrl, false);
          Httpreq.send(null);
          return Httpreq.responseText;
        }


        var json_obj = JSON.parse(getJSON(ratingYoutubeURL));
        var likeCount = parseInt(json_obj.items[0]['statistics'].likeCount);
        var dislikeCount = parseInt(json_obj.items[0]['statistics'].dislikeCount);

        // making rating the number of likes video got out of total votes
        var videoRating = (likeCount / (likeCount + dislikeCount)) * 100
        var videoRatingFloat = parseFloat(videoRating.toFixed(2))

        var ratingUrl = 'https://chart.googleapis.com/chart?cht=gom&chd=t:' + videoRatingFloat + '&chs=200x200&chl=' + videoRatingFloat + '&chxt=x,y&chxl=0:|' + videoRatingFloat + '|1:|0%|50%|100%'
        var videoLink = $('<a>');
        videoLink.append(video.title);
        var linkUrl = videoLink.attr('href');
        var thumbnailUrl = youtube.generateThumbnailUrl(video.youtubeId);
        var thumbnailImg = $('<img>');
        var ratingImg = $('<img>');
        thumbnailImg.attr('src', thumbnailUrl);
        ratingImg.attr('src', ratingUrl);
        videoLink.append(thumbnailImg);
        videoLink.append(ratingImg);





        videoLink.on('click', function(e) {
            e.preventDefault();
            var videoTitle = $('<h2>');
            videoTitle.html(video.title + ' <small>' + video.author + '</small>');
            var videoEmbed = $('<iframe></iframe>');
            videoEmbed.attr('src', youtube.generateEmbedUrl(video.youtubeId));
            videoEmbed.attr('width', 560);
            videoEmbed.attr('height', 315);

            var videoWatcher = $('#video-watcher');
            videoWatcher.hide();
            videoWatcher.empty();
            videoWatcher.append(videoTitle);
            videoWatcher.append(videoEmbed);
            videoWatcher.fadeIn();
        });

        var videoItem = $('<li>');
        videoItem.append(videoLink);
        $('#videos-list').append(videoItem);
     }

    var videos = [
      {"youtubeId": "TddFnTB_7IM",
        "title": "Trip through the 80s",
        "author": "meliberty"
      },
      {"youtubeId": "HwSKkKrUzUk",
        "title": "Circle of Life",
        "author": "parkerjademerce"
      },
      {"youtubeId": "il2IrgFHfsg",
        "title": "The Ooooh Cat",
        "author": "RnBTree"
      },
      {"youtubeId": "epUk3T2Kfno",
        "title": "Otters Holding Hands",
        "author": "cynthiaholmes"
      }
    ]

    for (var i = 0; i < videos.length; i++) {
       addVideoToList(videos[i]);
    }
  });