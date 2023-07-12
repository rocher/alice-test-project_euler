with Project_Euler.GUI.Runners.Gnoga; use Project_Euler.GUI.Runners.Gnoga;
with P0002_Even_Fibonacci_Numbers.GUI;   use P0002_Even_Fibonacci_Numbers.GUI;

procedure G0002_Even_Fibonacci_Numbers is
   Runner : Runner_Gnoga_Type;
begin

   Runner.Run (P0002_Factory'Access, P0002_Configure_Options'Access);

end G0002_Even_Fibonacci_Numbers;
