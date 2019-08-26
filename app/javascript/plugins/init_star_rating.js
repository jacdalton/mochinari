import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/css-stars.css";

const initStarRating = () => {
  $('#snack_rating_stars').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
