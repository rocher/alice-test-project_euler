package body P0002_Even_Fibonacci_Numbers is

   overriding function Answer
     (Problem : Problem_Type; Notes : in out Unbounded_String) return String
   is
   begin

      Notes := To_Unbounded_String ("Not implemented yet");
      --  Your implementation here ...

      return "0";
   end Answer;

end P0002_Even_Fibonacci_Numbers;
