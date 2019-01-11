import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["1 cocktail = 1 happy life"],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };
