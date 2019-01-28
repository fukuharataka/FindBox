$(function(){
  var setFileInput = $('.imgInput'),
  setFileImg = $('.imgView');

  setFileInput.each(function(){
    var selfFile = $(this),
    selfInput = $(this).find('input[type=file]'),
    prevElm = selfFile.find(setFileImg),
    orgPass = prevElm.attr('src');

    selfInput.change(function(){
      var file = $(this).prop('files')[0],
      fileRdr = new FileReader();

      if (!this.files.length){
        prevElm.attr('src', orgPass);
        return;
      } else {
        if (!file.type.match('image.*')){
        prevElm.attr('src', orgPass);
        return;
        } else {
          fileRdr.onload = function() {
            prevElm.attr('src', fileRdr.result);
          }
          fileRdr.readAsDataURL(file);
        }
      }

        var form = new FormData;
        form.append("Contnt-Type", file.type);
        form.append("photo[image]", file);

        var xhr = new XMLHttpRequest;
        xhr.open("POST", "/photos.json", true);
        xhr.setRequestHeader("X-CSRF-Token", Rails.csrfToken());

        xhr.onload = function () {
          var data = JSON.parse(xhr.responseText);
          console.log(data);
        };
        xhr.send(form);

      });
  });
});
