/* EXTRAS */
/*  4- FizzBuzz*/
/**
 * Generer un nombre aléatoire 
 *  - Si le nombre est un multiple de 3 afficher en console fizz
 *  - Si le nombre est un multiple de 5 afficher en console buzz
 *  - Si le nombre est un multiple de de 3 et de 5 afficher en console fizzbuzz
 */

let a = parseInt(Math.random() *100);

if (a % 3 === 0 && a % 5 === 0 ) {
    console.log('fizzbuzz');
} else if (a % 5 === 0) {
    console.log('buzz');
} else if (a % 3 === 0) {
    console.log('fizz');
} else {
    console.log("ni l'un ni l'autre");
}