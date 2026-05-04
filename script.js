const quoteForm = document.querySelector("#quoteForm");
const formNote = document.querySelector("#formNote");

quoteForm?.addEventListener("submit", (event) => {
  event.preventDefault();

  const data = new FormData(quoteForm);
  const name = data.get("name")?.toString().trim();
  const phone = data.get("phone")?.toString().trim();
  const zip = data.get("zip")?.toString().trim();
  const details = data.get("details")?.toString().trim();

  const subject = encodeURIComponent(`Junk removal quote request from ${name || "website"}`);
  const body = encodeURIComponent(
    [
      `Name: ${name}`,
      `Phone: ${phone}`,
      `ZIP: ${zip}`,
      "",
      "What needs to go:",
      details,
    ].join("\n"),
  );

  formNote.textContent = "Opening an email draft...";
  window.location.href = `mailto:hello@getshtout.com?subject=${subject}&body=${body}`;
});
