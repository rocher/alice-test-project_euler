--  ---------------------------------------------------------------------------
--
--  The following problem is taken from Project Euler:
--
--                 https://projecteuler.net/problem=1
--
--  Multiples of 3 or 5
--  -------------------
--
--  If we list all the natural numbers below 10 that are multiples of 3 or 5,
--  we get 3, 5, 6 and 9. The sum of these multiples is 23.
--
--  Find the sum of all the multiples of 3 or 5 below 1000.
--
-------------------------------------------------------------------------------

with Project_Euler.GUI.Problems;
with Project_Euler.GUI.Plotters;

package P0001_Multiples_Of_3_Or_5.GUI is

   use Project_Euler.GUI;

   task type Problem_Task is new Problems.Problem_Task with
      overriding entry Initialize
        (P : not null Plotters.Pointer_To_Plotter_Class);
      overriding entry Start;
      overriding entry Continue;
      overriding entry Stop;
   end Problem_Task;

   function P0001_Factory return Problems.Pointer_To_Problem_Task;
   procedure P0001_Configure_Options;

   overriding function Number (Problem : Problem_Task) return Natural is
     (Problem_Number);

   overriding function Title (Problem : Problem_Task) return String is
     (Title_Text);

   overriding function Brief (Problem : Problem_Task) return String is
     (Brief_Text);

   overriding function Answer
     (Problem : Problem_Task; Notes : in out Unbounded_String) return String is
     ("Use CLI implementation");

end P0001_Multiples_Of_3_Or_5.GUI;
