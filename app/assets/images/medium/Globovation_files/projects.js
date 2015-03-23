$(function() {
  return $('#masonry-container').imagesLoaded(function() {
    return $('#masonry-container').masonry({
      itemSelector: '.box',
      isFitWidth: true,
      gutterWidth: 40,
      columnWidth: 150
    });
  });
});

//text area and input counter
$(document).ready(function() {  
	$('#input1, #input2').keyup(function() {
	  var maxLength = parseInt($(this).attr('maxlength'));  ;
	  var length = $(this).val().length;
	  var length = maxLength-length;
	  $('#chars').text(length);
	});
}); 

//show file name to upload
$(document).on('change', '.btn-file :file', function() {
  var input = $(this),
      numFiles = input.get(0).files ? input.get(0).files.length : 1,
      label = String.fromCharCode(0x2714) + ' ' + input.val().replace(/\\/g, '/').replace(/.*\//, '');
  input.trigger('fileselect', [numFiles, label]);
});

$(document).ready( function() {
    $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
        
        var input = $(this).parents('.input-group').find(':text'),
            log = numFiles > 1 ? numFiles + ' files selected' : label;
        
        if( input.length ) {
            input.val(log);
        } else {
            if( log ) alert(log);
        }
        
    });
});
