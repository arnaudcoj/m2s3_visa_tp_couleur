// Une macro-squelette pour la couleur.
// Version: 0.1
// Date: 14/09/2011
// Author: L. Macaire

macro "augmentation_luminance" {

// recuperation du ID de l'image
image = getImageID();

valeur = getNumber ("quelle augmentation (absolue) de luminance",valeur);

Dialog.create("Debut");
Dialog.addMessage(" Cliquer sur OK pour commencer le traitement ");
Dialog.show();


setBatchMode(true);



// recuperation de la taille W x H de l'image
W = getWidth();
H = getHeight();

run("Duplicate...", "title=luminance modifiee");
image_luminance_aug = getImageID();

for (j=0; j<H; j++) {
   for (i=0; i<W; i++)
	{
	selectImage (image);
	couleur_avant = getPixel(i,j);
	R_avant = (couleur_avant & 0xff0000) >> 16;
	G_avant = (couleur_avant & 0x00ff00) >> 8;
	B_avant = (couleur_avant & 0x0000ff) ;

	R_apres = minOf(R_avant + valeur, 255);
	G_apres = minOf(G_avant + valeur, 255);
	B_apres = minOf(B_avant + valeur, 255);

	couleur_apres = ((R_apres & 0xff ) << 16) + ((G_apres & 0xff) << 8) + B_apres & 0xff;


	selectImage (image_luminance_aug);
	setPixel(i,j,couleur_apres);
      	}
   }

setBatchMode(false);

Dialog.create("Fin");
Dialog.addMessage(" Cliquer sur OK pour terminer le traitement");
Dialog.show();


}
