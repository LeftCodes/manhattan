export function initSimpleSliders() {
  const sliders = document.querySelectorAll(".simple-slider");

  sliders.forEach((slider) => {
    const track = slider.querySelector(".simple-slider__track");
    const controls = slider.querySelector(".simple-slider__controls");
    // initGrabToScroll(track);
    initControls(track, controls);
  });
}

function initGrabToScroll(track) {
  if ("ontouchstart" in window || navigator.maxTouchPoints > 0) return;

  let mouseDown = false;
  let startX, scrollLeft;
  let prevUserSelect = "";
  const speedFactor = 2; // >1 = faster drag, <1 = heavier feel

  const startDragging = (e) => {
    if (
      e.target.tagName === "P" ||
      e.target.tagName === "VIDEO" ||
      e.target.tagName === "UL" ||
      e.target.tagName === "LI" ||
      e.target.tagName === "A"
    )
      return;

    mouseDown = true;
    startX = e.pageX - track.offsetLeft;
    scrollLeft = track.scrollLeft;
    track.style.cursor = "grabbing";
    track.style.scrollSnapType = "x proximity";

    // Prevent text selection while dragging
    prevUserSelect = document.body.style.userSelect;
    document.body.style.userSelect = "none";
  };

  const stopDragging = () => {
    if (!mouseDown) return;
    mouseDown = false;
    track.style.removeProperty("cursor");
    track.style.removeProperty("scroll-snap-type");
    document.body.style.userSelect = prevUserSelect;
    // CSS scroll-snap will handle snapping automatically
  };

  const move = (e) => {
    if (!mouseDown) return;
    e.preventDefault();

    const x = e.pageX - track.offsetLeft;
    const delta = x - startX;

    // Multiply delta for faster or heavier feel
    track.scrollLeft = scrollLeft - delta * speedFactor;
  };

  track.addEventListener("mousedown", startDragging);
  track.addEventListener("mousemove", move);
  track.addEventListener("mouseup", stopDragging);
  track.addEventListener("mouseleave", stopDragging);
}

function initControls(track, controls) {
  if (!track || !controls) return;

  const prevButton = controls.querySelector(".simple-slider__arrow-prev");
  const nextButton = controls.querySelector(".simple-slider__arrow-next");

  const firstSlide = track.querySelector(
    ".simple-slider__slide:not(.simple-slider__padding-spaceholder)",
  );

  if (!firstSlide) return;

  const slideWidth = firstSlide.offsetWidth;

  prevButton?.addEventListener("click", () => {
    track.scrollLeft -= slideWidth;
  });

  nextButton?.addEventListener("click", () => {
    track.scrollLeft += slideWidth;
  });
}
