import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const availabilities = document.getElementById("availabilities")
  if (availabilities) {
  flatpickr(".datepicker", { disable: JSON.parse(availabilities.dataset.availabilities)});
  }
}

export { initFlatpickr };
