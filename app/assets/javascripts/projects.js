//masonry fluid homepage
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
	$('#input1').keyup(function() {
	  var maxLength = parseInt($(this).attr('maxlength'));  ;
	  var length = $(this).val().length;
	  var length = maxLength-length;
	  $('.charscount1').text(length);
	});
  $('#input2').keyup(function() {
    var maxLength = parseInt($(this).attr('maxlength'));  ;
    var length = $(this).val().length;
    var length = maxLength-length;
    $('.charscount2').text(length);
  });
   $('#input3').keyup(function() {
    var maxLength = parseInt($(this).attr('maxlength'));  ;
    var length = $(this).val().length;
    var length = maxLength-length;
    $('.charscount3').text(length);
  });
   $('#input4').keyup(function() {
    var maxLength = parseInt($(this).attr('maxlength'));  ;
    var length = $(this).val().length;
    var length = maxLength-length;
    $('.charscount4').text(length);
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


// geoplugin for the location input (project form)
var geourl = 'http://www.geoplugin.net/json.gp?jsoncallback=?';

$(document).ready(function() {
    $.getJSON(geourl).success(function(data) {
        var country_code = data.geoplugin_countryName;
        var $country = $('#country');
        $country.find('option[value="' + country_code + '"]').prependTo($country);
        $country.find('option[value=""]').text('--------------');
        $country.val(country_code);
    });
});


//froala text editor (wysiwyg)
$(document).ready(function() {
    $('textarea#edit').editable({
      inlineMode: false,
      plainPaste: true,
      minHeight: 400,
      buttons: ["bold", "italic", "underline", "strikeThrough", "fontFamily", "fontSize", "formatBlock", "blockStyle", "align", "insertOrderedList", "insertUnorderedList", "outdent", "indent", "createLink", "insertImage", "insertVideo", "insertHorizontalRule", "html" ]
    })
});


