import "bootstrap";
import { autocomplete } from '../components/autocomplete';
import { autocompleteTrail } from '../components/autocomplete-trail';
import { initStarRating } from '../plugins/init_star_rating';
import { initImagePicker } from '../components/snack-images-picker';
import $ from 'jquery';
window.jQuery = $;
window.$ = $;

autocomplete();
autocompleteTrail();
initStarRating();
initImagePicker();
