document.addEventListener('DOMContentLoaded', function(){
  document.getElementById('post-image')
  const ImageList = document.getElementById('image-list');

  document.getElementById('post_image').addEventListener('change', function(e){
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const imageElement = document.createElement('div');

    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('class', 'preview-image');

    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement);
  });
});