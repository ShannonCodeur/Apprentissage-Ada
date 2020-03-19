---------------------------------------------------------------------------
-- Nom du Fichier   : main.adb                                            --
-- Auteur du Code   : MEGNA MFOUAKIE Ibrahim                              --
-- Date de Création : 07/12/2019                                          --
-- But du Programme : Manipulation des Variables et Entrées/Sorties       --
-- Dates de Modif   : Uniquement en Cas de Modificaation                  --
-- Raison           : Implémentation de l'algorithme de QuickSort         --
-- Modules Appelés  :  Ada, Text_IO, Integer_Text_IO, Float_Text_IO       --
-- Mat. Particulier : Matériel Nécessaire pour l'utilisation de ce module --
-- Environnement    : GPS                                                 --
-- Compilation      : GNAT                                                --
-- Mode d'execution : Console                                             --
----------------------------------------------------------------------------
-- Partie d'inclusion et d'appels des Packages
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random, Ada.Characters;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters;

procedure Main is

   -- Déclaration d'un Tableau
   Taille : constant natural := 12;
   Type T_TABLEAU is array(1..Taille) of Integer;

   --up: Integer;
   --ii: Integer;
   ASCENDANT: constant natural := 1;
   DESCENDANT: constant natural := 0;

   -- Fonction qui calcule et retourne la somme de 2 Nombres

   function Somme(nb1: in out Integer; nb2: in out Integer) return Integer is
      A: Integer;
   begin
      A := nb1 + nb2;
      return A;
   end Somme;
   -- Fonction qui permet de Calculer le Factorielle
   function Factorielle(n: Integer) return Integer is
   begin
      if n = 0 or n = 1 then
         return 1;
      else
        return n * Factorielle(n-1);
      end if;
   end Factorielle;

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
    -- Rangmin cherche la valeur minimale dans une partie d'un tableau; Du rang
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

   -- Partitionner est une Procédure qui permet de Partitionner un tableau en deux en sorte que le pivot choisit soit encadré par les 2 sous tableaux

   function Partition(A: in out T_TABLEAU; p: in Integer; r: in Integer) return Integer is
      x, i: Integer;
   begin
      x := A(r);
      i := p - 1;
      for j in p..r-1 loop
         if A(j) <= x then
            i := i+1;
            Echanger(A(i), A(j));
         end if;
      end loop;
      Echanger(A(i + 1), A(r));
      return i + 1;
   end Partition;

   -- Procédure de Tri Rapide
   procedure QuickSort(A: in out T_TABLEAU; p: in Integer; r: in Integer) is
      q : Integer;
   begin
      if p < r then
         q := Partition(A, p, r);
         QuickSort(A,p,q - 1);
         QuickSort(A,q + 1,r);
      end if;
   end QuickSort;

   T : T_TABLEAU;
   r: Integer := 0;
   i: Integer := 1;
   j: Integer := 12;
   c: Character;
   val1, val2 : Integer;


   -- Tri Bitonique


   -- Procédure CompreEchanger

  -- procedure CompareEchanger(Tab: in out T_TABLEAU; i: in out Integer; j: in out Integer; dir: in out Integer) is
  -- begin
   --   if(((Tab(i) > Tab(j)) and (dir = ASCENDANT)) or (Tab(i) < Tab(j) and (dir = DESCENDANT))) then
  --       Echanger(Tab(i), Tab(j));
   --   end if;
   --end CompareEchanger;


--   procedure TriSuiteBitonique(Tab: in out T_TABLEAU; low: in out Integer; cnt: in out Integer; dir: in out Integer) is
--      k: Integer;
--      i: Integer;
--   begin
--      k := (cnt/2);
--      for i in low..((low+k)-1) loop
--         CompareEchanger(Tab, i, i+k, dir);
--      end loop;
 --     TriSuiteBitonique(Tab, low, k, dir);
--      TriSuiteBitonique(Tab, low+k, k, dir);
--   end TriSuiteBitonique;

   -- Tri Récursif

  -- procedure TrierRec(Tab: in out T_TABLEAU; low: in out Integer; cnt: in out Integer; dir: in out Integer) is
    --  k: Integer;
  -- begin
    --  if (cnt > 1) then
      --   k := (cnt/2);
        -- TrierRec(Tab, low, k, ASCENDANT);
       --  TrierRec(Tab, low+k, k, DESCENDANT);
       --  TrierRec(Tab, low, cnt, dir);
     -- end if;
   --end TrierRec;

begin
   New_Line;
   Put("################# Début du Programme #################");
   New_Line;New_Line;
   Put("-----------Menu du Programme  ----------");
   New_Line;New_Line;New_Line;
   Put("a- Somme de 2 Nombres");New_Line;
   Put("b- Calcul du Factoriel d'un Nombre");New_Line;
   Put("c- Tri d'un Tableau rempli aléatoirement ");New_Line;
   Put("d- Tri par Segmentation ou Quicksort");New_Line;
   Put("e- Tri Bitonique");New_Line;
   New_Line;
   Put("-----------Fin de Menu  ----------------");New_Line;New_Line;
   Put("Faites un Choix en choisissant une lettre ");
   Get(c);
   while c > 'd' or c < 'a' loop
      Put("Faites un Choix ");Get(c);
   end loop;New_Line;
   if c = 'a' or c = 'A' then
      Put("***************** Somme de 2 Nombres *****************");
      New_Line;New_Line;New_Line;
      Put("Veuillez Saisisr un Nombre ");Get(val1);New_Line;
      Put("Veuillez Saisir un autre Nombre ");Get(val2);New_Line;
      i := Somme(val1, val2);
      Put(" La Somme des 2 Nombres est "); Put(i);
      New_Line;New_Line;
      Put("***************** Somme de 2 Nombres *****************");
   end if;

   if c = 'b' or c ='B' then
      Put("\\\\\\\\\\\\\\\\\ Factorielle \\\\\\\\\\\\\\\\\\\");
      New_Line;New_Line;New_Line;
      Put("Veuillez Saisisr un Nombre ");
      Get(val1);New_Line;
      val2 := Factorielle(val1);
      Put("La Valeur du Factorielle de ");Put(val1);Put(" est ");Put(val2);
      New_Line;New_Line;
      Put("\\\\\\\\\\\\\\\\\ Factorielle \\\\\\\\\\\\\\\\\\\");
   end if;
   if c = 'c' or c = 'C' then
       Put("//////////////////// Random Sort ////////////////////");
       New_Line;New_Line;
       T := init;
       Put_Line("Le Tableau Généré par l'ordinateur est le suivant:  ");
       Afficher(T); New_Line;New_Line;
       Put_Line("Voici le Tableau, une Fois trié : ");New_Line;
       Afficher(Trier(T));
       New_Line;New_Line;
        Put("//////////////////// Random Sort ////////////////////");
   end if;
   if c = 'd' or c = 'D' then
      T := init;
      Put("||||||||||||||||||||| QuickSort |||||||||||||||||||||");New_Line;
      Put_Line("Le Tableau Généré par l'ordinateur est le suivant:  ");
      Afficher(T); New_Line;New_Line;
      QuickSort(T,i,j);
      Put_Line("Voici le Tableau, une Fois trié avec le QuickSort: ");New_Line;
      Afficher(T);New_Line;
      Put("||||||||||||||||||||| QuickSort |||||||||||||||||||||");
   end if;
   if c = 'e' or c = 'E' then
      T := init;
      Put("||||||||||||||||||||| Tri Bitonique |||||||||||||||||||||");New_Line;
      Put_Line("Le Tableau Généré par l'ordinateur est le suivant:  ");
    --  Afficher(T); New_Line;New_Line;
   --   TriRec(T, DESCENDANT,Taille, up);
      --QuickSort(T,i,j);
      Put_Line("Voici le Tableau, une Fois trié avec le QuickSort: ");New_Line;
      Afficher(T);New_Line;
      Put("||||||||||||||||||||| Tri Bitonique |||||||||||||||||||||");
   end if;
   New_Line;New_Line;
   Put("################## Fin du Programme ##################");
exception
   when others => Put_Line("Erreur dans le Programme Principal");
end Main;
