// Macro permettant de multiplier la saturation d'une image
// Version: 0.1
// Date: 26/10/2016
// Author: L. Macaire & A. Cojez

macro "Changement de Teinte" {

// recuperation du ID de l'image
image = getImageID();

valeur = getNumber ("quel degre de rotation de teinte",valeur);

Dialog.create("Debut");
Dialog.addMessage(" Cliquer sur OK pour commencer le traitement ");
Dialog.show();


setBatchMode(true);

//operation start
titre=getTitle();
//print (titre);
run("Color Space Converter", "from=RGB to=HSB white=D65");
run("Split Channels");
command = titre+" (HSB) (red)";
selectWindow(command);
//selectWindow("it3_72pp_saturation_faible.bmp (HSB) (green)");

run("Add...", "value=" + (valeur * 256) / 360);

command = "c1=["+titre+" (HSB) (red)] c2=["+titre+" (HSB) (green)] c3=["+titre+" (HSB) (blue)] ignore"
//run("Merge Channels...", "c1=[it3_72pp_saturation_faible.bmp (HSB) (red)] c2=[it3_72pp_saturation_faible.bmp (HSB) (green)] c3=[it3_72pp_saturation_faible.bmp (HSB) (blue)] ignore");
run("Merge Channels...", command);
run("Color Space Converter", "from=HSB to=RGB white=D65");
//operation end


setBatchMode(false);

Dialog.create("Fin");
Dialog.addMessage(" Cliquer sur OK pour terminer le traitement");
Dialog.show();


}
