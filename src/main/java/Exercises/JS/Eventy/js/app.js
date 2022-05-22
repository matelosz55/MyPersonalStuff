let counterValue = 0;

const buttons = document.querySelectorAll(".btn-outline-primary");

const handleClick = function (event) {
    counterValue += 1;
    document.querySelector('.counter').innerHTML = counterValue;
}

buttons.forEach(function (button){
    button.addEventListener("click", handleClick);
})