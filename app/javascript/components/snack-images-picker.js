const initImagePicker = () => {

  const bottomImages = document.querySelectorAll(".bottom-image");
  bottomImages.forEach((image) => {
    image.addEventListener("click", changeMainImage);
  });
};

const changeMainImage = (event) => {
  const mainImage = document.querySelector(".main-image img");
  mainImage.src = (event.currentTarget.src);
};

export { initImagePicker }
