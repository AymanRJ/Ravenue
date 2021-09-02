const initPopup = () => {
  const images = document.querySelectorAll(".image-trigger")
  const background = document.querySelector(".popup-background")
  const popupImage = background.querySelector("img")
  images.forEach(image => {
      image.addEventListener("click", () => {
        background.style.display= "flex"
        popupImage.src = image.src
        background.addEventListener("click", () => {
          background.style.display = "none"
        })
      })
  })
}


export { initPopup }
