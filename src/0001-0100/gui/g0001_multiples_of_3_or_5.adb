with Project_Euler.GUI.Runners.Gnoga; use Project_Euler.GUI.Runners.Gnoga;
with P0001_Multiples_Of_3_Or_5.GUI;   use P0001_Multiples_Of_3_Or_5.GUI;

procedure G0001_Multiples_Of_3_Or_5 is
   Runner : Runner_Gnoga_Type;
begin

   Runner.Run (P0001_Factory'Access, P0001_Configure_Options'Access);

end G0001_Multiples_Of_3_Or_5;
