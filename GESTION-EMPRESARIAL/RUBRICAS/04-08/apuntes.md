1) Paradigma de programación declarativa basado en el uso de funciones matemáticas
2) Sí, mediante funciones de orden superior
3) Sí, porl a inclusión de funciones lambda en Java8
4) Sï: 
function haceAlgo(miCallback){
    //hago algo y llamo al callback avisando que terminé
    miCallback();
}

haceAlgo(function(){
   console.log('terminó de hacer algo');
});
