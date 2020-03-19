with Ada;                     use Ada;
with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Characters;          use Ada.Characters;

Procedure attri is
   n,m,p : Integer; c: character;
Begin
   N := integer'first; --N sera le premier des Integer
   M := integer'last; --M sera le dernier des Integer
   C := character'val(93); --C sera la 93ème valeur des Character
   P := character'Pos('f'); --P aur pour valeur la position du charater 'f'
   Put(N);New_Line;
   Put(M);New_Line;
   Put(C);New_Line;
   Put(P);New_Line;
end attri;
