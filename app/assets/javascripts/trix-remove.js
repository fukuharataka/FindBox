function removeAttachment(attachment){
  var file = attachment.file;
  var form = new FormData;
  // var xhr = new XMLHttpRequest;
  // xhr.open("POST", "/photos.json", true);
  // xhr.setRequestHeader("X-CSRF-Token", Rails.csrfToken());
  //
  // xhr.onload = function(){
  //   if (xhr.status === 201) {
  //     var data = JSON.parse(xhr.responseText);
  //     return attachment.setAttributes({
  //       url: data.image_url,
  //       href: data.image_url
  //     })
  //   }
  // }
  // return xhr.send(form);
}

document.addEventListener("trix-attachment-remove", function(event){
  var attachment = event.attachment;

  if (attachment.file) {
    return removeAttachment(attachment);
  }
});
