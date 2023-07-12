--  ---------------------------------------------------------------------------
--
--  The following problem is taken from Project Euler:
--
--                 https://projecteuler.net/problem=@_NUMBER_@
--
--  @_TITLE_TEXT_@
--  ------------
--
--  @_DESCRIPTION_@
--
-------------------------------------------------------------------------------

with Project_Euler.GUI.Problems;
with Project_Euler.GUI.Plotters;

package P@_NUMBER_@_@_TITLE_@.GUI is

   use Project_Euler.GUI;

   task type Problem_Task is new Problems.Problem_Task with
      overriding entry Initialize
        (P : not null Plotters.Pointer_To_Plotter_Class);
      overriding entry Start;
      overriding entry Continue;
      overriding entry Stop;
   end Problem_Task;

   function P0002_Factory return Problems.Pointer_To_Problem_Task;
   procedure P0002_Configure_Options;

   overriding function Number (Problem : Problem_Task) return Natural is
     (Problem_Number);

   overriding function Title (Problem : Problem_Task) return String is
     (Title_Text);

   overriding function Brief (Problem : Problem_Task) return String is
     (Brief_Text);

   overriding function Answer
     (Problem : Problem_Task; Notes : in out Unbounded_String) return String is
     ("Use CLI implementation");

end P@_NUMBER_@_@_TITLE_@.GUI;
