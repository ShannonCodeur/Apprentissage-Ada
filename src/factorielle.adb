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


procedure Facorielle is
   function Somme(nb1: in out Integer; nb2: in out Integer) return Integer is
      A: Integer;
   begin
      A := nb1 + nb2;
      return A;
   end Somme;
   function Factorielle(n: Integer) return Integer is
   begin
      if n = 0 or n = 1 then
         return 1;
      else
        return n * Factorielle(n-1);
      end if;
   end Factorielle;
   val1, val2 : Integer;
begin
   New_Line;
   Put("-----------Début du Programme 1 ----------------");
   New_Line;New_Line;New_Line;
   Put("Veuillez Saisisr un Nombre ");
   Get(val1);New_Line;
   val2 := Factorielle(val1);
   Put("La Valeur du Factorielle de ");Put(val1);Put(" est de ");Put(val2);
   New_Line;New_Line;
   Put("-----------Fin du Programme------------------");
exception
   when others => Put_Line("Erreur dans le Programme Principal");
end Factorielle;
