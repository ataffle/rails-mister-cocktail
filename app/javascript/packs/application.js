/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import 'bootstrap';

import 'select2/dist/css/select2.css';

import { initSelect2 } from '../components/init_select2';

initSelect2();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

import { rating } from '../components/cocktail_rating';
rating();
