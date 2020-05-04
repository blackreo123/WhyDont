function audioPlayer() {
				var currentSong=0;
				$("#ap")[0].src = $("#pl li a")[0];
				$("#ap")[0].play();
				$("#pl li a").click(function(e){
					e.preventDefault();
					$("#ap")[0].src = this;
			    $("#ap")[0].play();
			    $("#pl li").removeClass("current-song");
			    currentSong = $(this).parent().index();
			     $(this).parent().addClass("current-song");
				});
				$("#ap")[0].addEventListener("ended", function(){
					currentSong++;
					if(currentSong == $("#pl li a").length)
						currentSong=0;
				$("#pl li").removeClass("current-song");
				$("#pl il:eq("+currentSong+")").addClass("current-song");
				$("#ap")[0].src = $("#pl li a")[currentSong].href;
				$("#ap")[0].play();
				})
			}