// Macro permettant de multiplier la saturation d'une image
// Version: 0.1
// Date: 26/10/2016
// Author: L. Macaire & A. Cojez

macro "multiplication saturation" {

// recuperation du ID de l'image
image = getImageID();

valeur = getNumber ("quelle multiplication (absolue) de saturation",valeur);

Dialog.create("Debut");
Dialog.addMessage(" Cliquer sur OK pour commencer le traitement ");
Dialog.show();


setBatchMode(true);

//macro
run("Color Space Converter", "from=RGB to=HSB white=D65");
run("Split Channels");
//run("Multiply...", "value=" + valeur);
//run("Merge Channels...", "c1=[cas_2_dalton16-question2-1.bmp (HSB) (red)] c2=[cas_2_dalton16-question2-1.bmp (HSB) (green)] c3=[cas_2_dalton16-question2-1.bmp (HSB) (blue)] create");
//run("Color Space Converter", "from=HSB to=RGB white=D65");

setBatchMode(false);

Dialog.create("Fin");
Dialog.addMessage(" Cliquer sur OK pour terminer le traitement");
Dialog.show();


}
