import "bootstrap";
import { autocomplete } from '../components/autocomplete';
import { autocompleteTrail } from '../components/autocomplete-trail';
import { initStarRating } from '../plugins/init_star_rating';
import { onUpload } from '../components/image-upload';
import $ from 'jquery';
window.jQuery = $;
window.$ = $;

autocomplete();
autocompleteTrail();
initStarRating();
onUpload(event);
