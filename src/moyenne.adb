---------------------------------------------------------------------------
-- Nom du Fichier   : main.adb                                            --
-- Auteur du Code   : Shannon                                             --
-- Date de Création : 07/12/2019                                          --
-- But du Programme : Manipulation des Variables et Entrées/Sorties       --
-- Dates de Modif   : Uniquement en Cas de Modificaation                  --
-- Raison           : Apprentissage Du Langage                            --
-- Modules Appelés  :  Ada, Text_IO, Integer_Text_IO, Float_Text_IO       --
-- Mat. Particulier : Matériel Nécessaire pour l'utilisation de ce module --
-- Environnement    : GPS                                                 --
-- Compilation      : GNAT                                                --
-- Mode d'execution : Console                                             --
----------------------------------------------------------------------------
-- Partie d'inclusion et d'appels des Packages
with Ada;                    use Ada;
with Text_IO;                use Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;      use Ada.Float_Text_IO;

-- Ce Programme Permet de Calculer la Moyenne d'un Etudiant

procedure Moyenne is

   Coef_Maths , Coef_Info  : Integer;
   Coef  , Note_Maths, Note_Info ,Notes ,Moyenne    : Float;

begin
   New_Line;
   Put("-----------Début du Programme-------------");
   New_Line;New_Line;
   Put("Veuillez saisir la Note de Mathématiques: ");
   Get(Note_Maths);
   New_Line;
   Put("Entrez le Coefficient de Mathématiques: ");
   Get(Coef_Maths);
   New_Line;
   Put("Veuillez saisir la Note d'Informatique: ");
   Get(Note_Info);
   New_Line;
   Put("Entrez le Coefficient d'Informatique: ");
   Get(Coef_Info);
   New_Line;
   -- Calcul de la Moyenne
   Coef    := Float(Coef_Info) + Float(Coef_Maths);
   Notes   := Note_Maths * Float(Coef_Maths) + Note_Info * Float(Coef_Info);
   Moyenne := Notes/Coef;
   -- Afficher la Moyenne à l'écran
   Put("Votre Moyenne est de: ");
   Put(Moyenne);
   New_Line;New_Line;
   Put("-----------Fin du Programme------------------");
exception
   when others => Put_Line("Erreur dans le Programme Principal");
end Moyenne;
