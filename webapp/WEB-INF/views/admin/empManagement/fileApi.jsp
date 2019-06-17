<!DOCTYPE html>
<html lang="en-US" itemscope itemtype="https://schema.org/WebPage">
<head>
	<title>File API Simple	</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta charset="UTF-8">
</head>

<article>
  <div id="holder"></div>
  <p id="status" style="display: none;"> </p>
  <p><input type=file></p>
</article>

<script>
	var upload = document.getElementsByTagName('input')[0],
	    holder = document.getElementById('holder'),
	    state = document.getElementById('status');
	
	if (typeof window.FileReader === 'undefined') {
	  state.className = 'fail';
	} /* else {
	  state.className = 'success';
	  state.innerHTML = 'File API & FileReader available';
	} */
	 
	upload.onchange = function (e) {
	  e.preventDefault();
	
	  var file = upload.files[0],
	      reader = new FileReader();
	  reader.onload = function (event) {
	    var img = new Image();
	    img.src = event.target.result;
	    // note: no onload required since we've got the dataurl...I think! :)
	    if (img.width > 560) { // holder width
	      img.width = 560;
	    }
	    holder.innerHTML = '';
	    holder.appendChild(img);
	  };
	  reader.readAsDataURL(file);
	
	  return false;
	};
</script>
       
</body>
</html>