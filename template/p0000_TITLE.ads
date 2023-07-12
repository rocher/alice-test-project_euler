--  ---------------------------------------------------------------------------
--
--  The following problem is taken from Project Euler:
--
--                 https://projecteuler.net/problem=@_NUMBER_@
--
--  @_TITLE_TEXT_@
--  ------------
--
--  DESCRIPTION
--
-------------------------------------------------------------------------------

with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Project_Euler.CLI.Problems; use Project_Euler.CLI.Problems;

package P@_NUMBER_@_@_TITLE_@ is

   Problem_Number : constant Natural := @_NUMBER_@;
   Title_Text     : constant String  := "@_TITLE_TEXT_@";
   Brief_Text     : constant String  := "@_BRIEF_@";

   type Problem_Type is new Problem_Interface with null record;

   overriding function Number (Problem : Problem_Type) return Natural is
     (Problem_Number);

   overriding function Title (Problem : Problem_Type) return String is
     (Title_Text);

   overriding function Brief (Problem : Problem_Type) return String is
     (Brief_Text);

   overriding procedure Configure_Options (Problem : Problem_Type) is null;

   overriding procedure Parse_Options (Problem : in out Problem_Type) is null;

   overriding function Answer
     (Problem : Problem_Type; Notes : in out Unbounded_String) return String;

end P@_NUMBER_@_@_TITLE_@;
