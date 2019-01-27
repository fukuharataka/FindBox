// document.addEventListener('DOMContentLoaded', function(){
//   document.getElementById('content').addEventListener('change', function(){
//     var file = attachment.file;
//     var form = new FormData;
//     form.append("Contnt-Type", file.type);
//     form.append("photo[image]", file);
//
//     var xhr = new XMLHttpRequest;
//     xhr.open("POST", "/photos.json", true);
//     xhr.setRequestHeader("X-CSRF-Token", Rails.csrfToken());
//
//
//
//   })
// })
$('#content').change(function() {
  console.log('aaa');
});


//
// $("#content").on("change", 'input[type="file"]', function(e){
// 	e.preventDefault();
//   console.log('aaa');
// 	var form = new FormData();
// 	var files = this.files;
// 	$.each(files, function(i, file){
// 		form.append('photo[image]', file);
// 	});
// 	$.ajax({
// 		url: '/photos',
// 		type: 'POST',
// 		data: form,
// 		processData: false,
// 		contentType: false,
// 		dataType: 'html',
// 		complete: function(){},
// 		success: function(res) {}
// 	})
// });
