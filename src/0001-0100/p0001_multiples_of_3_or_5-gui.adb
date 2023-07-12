with Parse_Args;

package body P0001_Multiples_Of_3_Or_5.GUI is

   Option_Add_First_Multiples_Of_5_Name : constant String := "First 5";
   Option_Use_Rectangles_Name           : constant String := "Use rectangles";
   Option_Skip_15_Name                  : constant String := "Skip 15";

   -------------------
   -- P0001_Factory --
   -------------------

   function P0001_Factory return Problems.Pointer_To_Problem_Task is
      Problem : constant Problems.Pointer_To_Problem_Task := new Problem_Task;
   begin
      return Problem;
   end P0001_Factory;

   -----------------------------
   -- P0001_Configure_Options --
   -----------------------------

   procedure P0001_Configure_Options is
   begin
      Project_Euler.Argument_Parser.Add_Option
        (Parse_Args.Make_Boolean_Option (False),
         Name => Option_Add_First_Multiples_Of_5_Name, Short_Option => 'f',
         Long_Option => "first5",
         Usage       => "Add first multiples of 5, then multiples of 3");

      Project_Euler.Argument_Parser.Add_Option
        (Parse_Args.Make_Boolean_Option (False),
         Name        => Option_Use_Rectangles_Name, Short_Option => 'r',
         Long_Option => "rect", Usage => "Draw rectangles (default: lines)");

      Project_Euler.Argument_Parser.Add_Option
        (Parse_Args.Make_Boolean_Option (False), Name => Option_Skip_15_Name,
         Short_Option => 's', Long_Option => "skip15",
         Usage => "Skip multiples of 15");
   end P0001_Configure_Options;

   -------------------
   -- Plotter_Setup --
   -------------------

   procedure Plotter_Setup (Plotter : Plotters.Pointer_To_Plotter_Class) is
   begin
      Plotter.Set_Axes
        (X_Min => 0.0, X_Max => 2_000.0, Y_Min => 0.0, Y_Max => 270_000.0);
      Plotter.Draw_Grid
        (X_Major => 1_000.0, X_Minor => 500.0, Y_Major => 100_000.0,
         Y_Minor => 25_000.0);
      Plotter.Draw_Axes ("Number", "Sum");
   end Plotter_Setup;

   ------------------
   -- Problem Task --
   ------------------

   task body Problem_Task is
      Option_Add_First_Multiples_Of_5 : Boolean := False;
      Option_Use_Rectangles           : Boolean := False;
      Option_Skip_15                  : Boolean := False;
      N1, N2                          : Natural;
      Answer                          : Natural;
      Plotter                         : Plotters.Pointer_To_Plotter_Class;

      -----------------------
      -- Info_Multiples_Of --
      -----------------------

      procedure Info_Multiples_Of (N : Natural; Shift : Float := 0.0) is
      begin
         Plotter.Set_Layer_Information;
         Plotter.Stroke_color ("#000");
         Plotter.Fill_Color ("#000");
         Plotter.Font ("sans-serif", "22px");
         Plotter.Text
           (Shift + 150.0, 250_000.0,
            "Adding multiples of " &
            (if N = 3 then "3 (red)" else "5 (blue)"));
         if Shift > 0.0 and then Option_Skip_15 then
            Plotter.Text (Shift + 150.0, 240_000.0, "* Skip multiples of 15");
         end if;
         Plotter.Pause;
      end Info_Multiples_Of;

      ----------------------
      -- Add_Multiples_Of --
      ----------------------

      procedure Add_Multiples_Of (N : Natural; Shift : Float := 0.0) is
         I  : Natural := 0;
         X0 : Float   := Shift;
         Y0 : Float   := Float (Answer);
      begin
         Plotter.Set_Layer_Drawing;
         Plotter.Line_Width (2);
         Plotter.Stroke_color (if N = 3 then "#933" else "#339");
         Plotter.Fill_Color (if N = 3 then "#933" else "#339");

         loop
            I := @ + N;
            exit when I > 1_000;

            if Shift = 0.0 or else not Option_Skip_15 or else I mod 15 /= 0
            then
               Answer := @ + I;

               if Option_Use_Rectangles then
                  Plotter.Fill_Rectangle
                    (X0 => Shift + Float (I) - (Float (N) / 2.0),
                     Y0 => Float (Answer),
                     X1 => Shift + Float (I) + (Float (N) / 2.0), Y1 => 0.0);
               else
                  Plotter.Line (X0, Y0, Shift + Float (I), Float (Answer));
                  X0 := Shift + Float (I);
                  Y0 := Float (Answer);
               end if;
            end if;

         end loop;
      end Add_Multiples_Of;

   begin

      accept Initialize (P : not null Plotters.Pointer_To_Plotter_Class) do
         Plotter := P;
      end Initialize;
      Plotter_Setup (Plotter);

      Option_Add_First_Multiples_Of_5 :=
        Project_Euler.Argument_Parser.Boolean_Value
          (Option_Add_First_Multiples_Of_5_Name);

      Option_Use_Rectangles :=
        Project_Euler.Argument_Parser.Boolean_Value
          (Option_Use_Rectangles_Name);

      Option_Skip_15 :=
        Project_Euler.Argument_Parser.Boolean_Value (Option_Skip_15_Name);

      Infinite_Loop :
      loop

         accept Start;
         Plotter.Start;
         Answer := 0;

         if Option_Add_First_Multiples_Of_5 then
            N1 := 5;
            N2 := 3;
         else
            N1 := 3;
            N2 := 5;
         end if;

         Info_Multiples_Of (N1);
         select
            accept Continue;
         or
            accept Stop;
            goto Exit_Problem;
         end select;
         Add_Multiples_Of (N1);

         Info_Multiples_Of (N2, 1_000.0);
         select
            accept Continue;
         or
            accept Stop;
            goto Exit_Problem;
         end select;
         Add_Multiples_Of (N2, 1_000.0);

         Plotter.Set_Layer_Information;
         Plotter.Text_Align (Align => "right");
         Plotter.Text (1_000.0, 220_000.0, "Done!");

         Plotter.Answer (Answer'Image);

         <<Exit_Problem>>
         Plotter.Stop;

      end loop Infinite_Loop;
   end Problem_Task;

end P0001_Multiples_Of_3_Or_5.GUI;
