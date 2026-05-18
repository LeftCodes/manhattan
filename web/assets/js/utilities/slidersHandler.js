// slidersHandler.js

import { expandCollapsibleContaining } from "./collapsiblesHandler.js";

export function initSliders() {
  const sliders = document.querySelectorAll('.slider');
  const thumbSliders = document.querySelectorAll('.slider-thumbnails');

  const optionsSlider = {
    pagination: false,
    snap: true,
    gap: '2px',
    arrows: true,
    mediaQuery: 'min',
  };

  const optionsSliderThumb = {
    pagination: false,
    snap: true,
    gap: '2px',
    arrows: false,
    fixedWidth: 'auto',
    fixedHeight: '100%',
    mediaQuery: 'min',
  };

  sliders.forEach((sliderEl, index) => {

    const slider = new Splide(sliderEl, optionsSlider);
    const thumbSlider = new Splide(thumbSliders[index], optionsSliderThumb);

    // Add your own wheel listener to scroll horizontally
    thumbSlider.on('mounted', () => {
      thumbSlider.Components.Elements.track.addEventListener('wheel', (e) => {
        e.preventDefault(); // stop page scroll
        const delta = e.deltaX; // horizontal scroll
        if (delta > 0) thumbSlider.go('>'); 
        else if (delta < 0) thumbSlider.go('<'); 
      });
    });

    slider.sync(thumbSlider);

    thumbSlider.mount();
    slider.mount();

    // Add click event listener to each thumbnail
    thumbSlider.Components.Elements.list.querySelectorAll('.splide__slide').forEach((thumbSlide) => {
      thumbSlide.addEventListener('click', () => {
        const slideIndex = parseInt(thumbSlide.dataset.index, 10);
        expandCollapsibleContaining(thumbSlide);
        thumbSlider.refresh();
        slider.go(slideIndex);
      });
    });
  });
}
