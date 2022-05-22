const url = "https://pokeapi.co/api/v2/pokemon";

const list = document.querySelector(".list");

const addRows = function (pokemonName){
    const listItem = document.createElement('li');
    listItem.innerText = pokemonName;

    list.appendChild(listItem);

}

fetch(url)
    .then((response) => {
        return response.json();
    }).then((data) => {
    data.results.forEach(function (pokemon){
        addRows(pokemon.name)
    })
})