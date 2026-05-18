export function initScrollObserverHandler() {
  const target = document.querySelector("footer");

  // adjust threshold values as needed
  const options = {
    root: null,
    rootMargin: "0px",
    threshold: [0.0, 0.8],
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      const el = entry.target;

      if (entry.intersectionRatio <= 0) {
        // console.log("leaving viewport");
      } else {
        // console.log("enter target");
      }
    });
  }, options);

  observer.observe(target);
}
