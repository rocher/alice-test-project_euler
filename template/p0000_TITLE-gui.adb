package body P@_NUMBER_@_@_TITLE_@.GUI is

   -------------------
   -- P@_NUMBER_@_Factory --
   -------------------

   function P@_NUMBER_@_Factory return Problems.Pointer_To_Problem_Task is
      Problem : constant Problems.Pointer_To_Problem_Task := new Problem_Task;
   begin
      return Problem;
   end P@_NUMBER_@_Factory;

   -----------------------------
   -- P@_NUMBER_@_Configure_Options --
   -----------------------------

   procedure P@_NUMBER_@_Configure_Options is
   begin
      null;
   end P@_NUMBER_@_Configure_Options;

   -------------------
   -- Plotter_Setup --
   -------------------

   procedure Plotter_Setup (Plotter : Plotters.Pointer_To_Plotter_Class) is
   begin
      null;
      Plotter.Set_Axes
        (X_Min => 0.0, X_Max => 100.0, Y_Min => 0.0, Y_Max => 10.0);
      Plotter.Draw_Grid
        (X_Major => 25.0, X_Minor => 5.0, Y_Major => 5.0, Y_Minor => 1.0);
      Plotter.Draw_Axes_Rectangle;
   end Plotter_Setup;

   ------------------
   -- Problem Task --
   ------------------

   task body Problem_Task is
      Plotter : Plotters.Pointer_To_Plotter_Class;
      Answer  : Natural;
   begin

      accept Initialize (P : not null Plotters.Pointer_To_Plotter_Class) do
         Plotter := P;
      end Initialize;
      Plotter_Setup (Plotter);

      Infinite_Loop :
      loop

         accept Start;
         Plotter.Start;
         Answer := 0;

         Plotter.Pause;
         select
            accept Continue;
         or
            accept Stop;
            goto Exit_Problem;
         end select;

         Plotter.Answer (Answer'Image);

         <<Exit_Problem>>
         Plotter.Stop;

      end loop Infinite_Loop;
   end Problem_Task;

end P@_NUMBER_@_@_TITLE_@.GUI;
