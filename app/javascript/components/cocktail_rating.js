const rating = () => {
  const stars = document.querySelectorAll(".js-star");
  stars.forEach((star) => {
    star.addEventListener( 'click', (event) => {
      stars.forEach((newStar) => {
        if (newStar.dataset.value <= star.dataset.value) {
          newStar.classList.remove('far');
          newStar.classList.add('fas');
        } else {
          newStar.classList.add('far');
          newStar.classList.remove('fas');
        }
      });
      document.getElementById('review_rating').value = star.dataset.value;
    });
  });
};

export { rating };
