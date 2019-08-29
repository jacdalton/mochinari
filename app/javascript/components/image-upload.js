const onUpload = (event) => {
  const formElement = document.getElementById('new_snack_image');
  console.log(formElement.value);
  // console.log(event.fpfile.filename);
  alert("Ahh!")
  formElement.submit();
}

export { onUpload } ;

// document.getElementById('snack_image_image_path').onchange = () => {
//   alert('Submitting...');
//   document.getElementById('new_snack_image').submit();
//   };