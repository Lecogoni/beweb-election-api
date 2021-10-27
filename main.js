//  ---------------------- REQUIRE

const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});


// ---------------------- DECLARATION DES VARIABLES

let allMenu = [];
let numberOfRows = 50;

// ---------------------- STARRT PROGRAM

const enterOrNot = () => {
    return new Promise((resolve, reject) => {
        readline.question('menu m ou quitter q ? ', (answer) => {
        // envoie le result a une fonction qui le traitera
        resolve(checkUserInput(answer))
        })
    })
}

const startProgram = async () => {
    await enterOrNot()
    //readline.close()
}

startProgram()


// ---------------------- ANALYSE USER INPUT 

function checkUserInput(answer) {
    if (answer == 'm') {
        defineMenu()
    }
    else if (answer == 'q') {
        console.log('aurevoir');
        process.exit();
    }
    else {
        console.log('mauvais choix');
        startProgram() 
    } 
}

// ---------------------- DEFINE MENU


// ask menu name
const menuName = (menu) => {
    return new Promise((resolve, reject) => {
        readline.question('MENU NAME ? ', (answer) => {
        menu['nom'] = answer
        resolve()
        })
    })
}

// ask starter name
const menuStarter = (menu) => {
    return new Promise((resolve, reject) => {
        readline.question('MENU ENTREE ? ', (answer) => {
            menu['entree'] = answer 
        resolve()
        })
    })
}

// ask main dishe name
const menuPlate = (menu) => {
    return new Promise((resolve, reject) => {
        readline.question('MENU PLAT ? ', (answer) => {
            menu['plat'] = answer 
        resolve()
        })
    })
}

// ask dessert name
const menuDessert = (menu) => {
    return new Promise((resolve, reject) => {
        readline.question('MENU DESSERT  ? ', (answer) => {
            menu['dessert'] = answer 
        resolve()
        })
    })
}


const defineMenu = async () => {

    // set an empty object
    let menu = {
        nom: '',
        entree: '',
        plat: '',
        dessert: '' 
    };

    await menuName(menu)
    await menuStarter(menu)
    await menuPlate(menu)
    await menuDessert(menu)

    allMenu.push(menu)
    showMenu(sizeOfLonguestElement());
    
    startProgram()
    //readline.close()
}



// ---------------------- FORMAT RESULT => ARRAY OF MENU

function showMenu(sizeOfLonguestElement){
    
    let size = sizeOfLonguestElement;
    
    console.log('');
    console.log('#'.repeat(numberOfRows));
    console.log('#' + ' '.repeat(numberOfRows - 2) + '#');
    console.log('# LA CARTE ' + ' '.repeat(numberOfRows - 12 ) + '#');
    console.log('#' + ' '.repeat(numberOfRows - 2) + '#');
    
    
    
    for (let i = 0 ; i < allMenu.length ; i++) {
        console.log('#' + '-'.repeat(numberOfRows - 2) + '#');
        console.log('#' + ' '.repeat(numberOfRows - 2) + '#');
        console.log(defineElementSizing(allMenu[i]['nom'].toUpperCase()))
        console.log('#' + ' '.repeat(numberOfRows - 2) + '#');
        console.log(defineElementSizing(allMenu[i]['entree']))
        console.log(defineElementSizing(allMenu[i]['plat']))
        console.log(defineElementSizing(allMenu[i]['dessert']))
        console.log('#' + ' '.repeat(numberOfRows - 2) + '#');
    }
    console.log('#' + ' '.repeat(numberOfRows - 2 ) + '#');
    console.log('#'.repeat(numberOfRows));
    console.log('');

   
}



// ---------------------- CONNAITRE LA LONGUER DE L'ELEMENT LE PLUS GRAND POUR CALIBRER L'AFFICHAGE

function sizeOfLonguestElement() {

    let sizeLonguestMenuItem = 0;

    allMenu.forEach((element, index, array) => {
        array.forEach((element, index, array) => {
        if (element['nom'].length > sizeLonguestMenuItem){
            sizeLonguestMenuItem = element['nom'].length
        }
        if (element['entree'].length > sizeLonguestMenuItem){
            sizeLonguestMenuItem = element['entree'].length
        }
        if (element['plat'].length > sizeLonguestMenuItem){
            sizeLonguestMenuItem = element['plat'].length
        }
        if (element['dessert'].length > sizeLonguestMenuItem){
            sizeLonguestMenuItem = element['dessert'].length
        }
        })
    });

    return sizeLonguestMenuItem
}


function defineElementSizing(ele) {

    let remains = numberOfRows - 2 - ele.length
    if (remains % 2 === 0) {
        return str = '#' + (' '.repeat(remains / 2)) + ele + (' '.repeat(remains / 2)) + '#'
    } else {
        return str = '#' + (' '.repeat(remains / 2)) + ele + (' '.repeat((remains / 2) + 1)) + '#'
    }

}