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
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure ManipTableau is

   Taille : constant natural := 12;
   Type T_TABLEAU is array(1..Taille) of Integer;

   -- La Fonction Init Renvoie un Tableau à valeurs aléatoires

   function init return T_TABLEAU is
      T:T_TABLEAU;
      subtype Intervalle is Integer range 1..100;
      package Aleatoire is new Ada.Numerics.Discrete_Random(Intervalle);
      use Aleatoire;
      Hasard: Generator;
   begin
      Reset(Hasard);
      for i in T'Range loop
         T(i) := Random(Hasard);
      end loop;
      return T;
   end init;

   -- La Procédure Afficher affiche les valeurs d'un tableau sur une même ligne

   procedure Afficher(T: T_TABLEAU) is
   begin
      for i in T'Range loop
         Put(T(i), 4);
      end loop;
   end Afficher;

   -- Echanger est une Procédure qui échange deux valeurs : a vaudra b et vice versa

   procedure Echanger(a: in out Integer; b: in out Integer) is
      c: Integer;
   begin
      c := a;
      a := b;
      b := c;
   end Echanger;

   -- Partitionner est une Procédure qui permet de Partitionner un tableau en deux en sorte que le pivot choisit soit encadré par les 2 sous tableaux

   procedure Partition(T: in out T_TABLEAU) is
      x,i,j,a,b : Integer;
   begin
      x := T(12);
      i := 0;
      j := 0;
      for j in 0..11 loop
         if T(j) <= x then
            i := i+1;
            a := T(i);
            b := T(j);
            T(i) := b;
            T(j) := a;
         end if;
      end loop;
      a := T(i+1);
      b := T(12);
      Echanger(a, b);
      T(i+1) := b;
      T(12)  := a;
   end Partition;

   -- Rangmin cherche la valeur minimale dans une partie d'uun tableau; Du rang
   -- Elle ne renvoie pas le minimum mais son rang, ie l'indice du minimum

   function RangMin(T:T_TABLEAU; debut : Integer; fin : Integer) return Integer is
      Rang : Integer := debut;
      Min  : Integer := T(debut);
   begin
      for i in debut..fin loop
         if T(i) < Min then
            Min  := T(i);
            Rang := i;
         end if;
      end loop;
      return Rang;
   end RangMin;

   -- Trier est une fonction qui renvoie un tableau trié du plus petit au plus grand
   function Trier(Tab: T_TABLEAU) return T_TABLEAU is
      T: T_TABLEAU := Tab;
   begin
      for i in T'Range loop
         Echanger(T(i), T(RangMin(T,i,T'last)));
      end loop;
      return T;
   end Trier;

   T : T_TABLEAU;
   r : Integer := 0;
begin
   New_Line;
   Put("-----------Début du Programme 1 ----------------");
   New_Line;New_Line;New_Line;
   T := init;
   Put_Line("Le Tableau Généré par l'ordinateur est le suivant:  ");
   New_Line;
   Afficher(T); New_Line;New_Line;
   r := T((T'first + T'last)/2);New_Line;Put(r);New_Line;
   Put_Line("Voici le Tableau, une Fois trié : ");New_Line;
   Afficher(Trier(T));
   New_Line;New_Line;
   Put("-----------Fin du Programme------------------");
exception
   when others => Put_Line("Erreur dans le Programme Principal");
end ManipTableau;
