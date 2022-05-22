//password = 123
//  checkPassword(123) -> OK OK PASS
//  checkPassword(124) -> OK OK FAIL
//  checkPassword(12) -> OK OK FAIL
//  checkPassword(1234) -> OK OK OK FAIL
//  checkPassword(81234) -> FAIL

const pass0 = "812";

function checkPassword(password) {
    const pass = "123";

    for (let i = 0; i < pass.length; i++) {

        if (pass[i] === password[i] && i === pass.length - 1 && pass.length === password.length) {
            console.log("PASS");
        } else if (i === pass.length - 1 && pass.length !== password.length && pass[i] === password[i]) {
            console.log("OK");
            console.log("FAIL");
            break;
        } else if (pass[i] === password[i]) {
            console.log("OK");
        } else if (pass[i] !== password[i]){
            console.log("FAIL");
            break;
        }
    }
}
/*
checkPassword("123")
checkPassword("124")
checkPassword("12")
checkPassword("1234")
checkPassword("81234")
*/

function checkPassword2(password){

    for(let i = 0; i < password.length; i++){
        let pass2 = password;
        const length = password.length;
        if (password[i] === "#"){
            password = password.substring(0, i-1);
            pass2 = pass2.substring(i+1, length);
            pass2 = password + pass2;

        }
        checkPassword(pass2);
    }
}

checkPassword2("124#3");


