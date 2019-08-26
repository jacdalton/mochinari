import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/css-stars.css";

window.initStarRating = () => {
  $('#snack_rating_stars').barrating({
    theme: 'css-stars'
  });
};

const initStarRating = window.initStarRating

export { initStarRating };
