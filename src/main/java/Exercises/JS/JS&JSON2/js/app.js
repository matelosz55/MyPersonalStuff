const form = document.querySelector("form");

const baseUrl = "https://www.googleapis.com/books/v1/volumes?q=isbn:";

const addBookTitle = function (title) {
    const header = document.createElement('h2');
    header.innerText = title;
    document.querySelector('.book-info').appendChild(header);
}

const handleSubmit = function (event) {
    event.preventDefault();
    const isbn = this.elements.isbn.value;

    const url = baseUrl + isbn;
    fetch(url)
        .then((response) => {
            console.log(response);
            return response.json();
        }).then((data) => {
        addBookTitle(data.items[0].volumeInfo.title);
    })

}

form.addEventListener("submit", handleSubmit);