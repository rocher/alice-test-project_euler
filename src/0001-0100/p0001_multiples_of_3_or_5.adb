package body P0001_Multiples_Of_3_Or_5 is

   overriding function Answer
     (Problem : Problem_Type; Notes : in out Unbounded_String) return String
   is
      Answer : Natural := 0;
   begin
      for I in 3 .. 1_000 loop
         if I mod 3 = 0 then
            Answer := @ + I;
         end if;
      end loop;

      for I in 5 .. 1_000 loop
         if I mod 5 = 0 then
            Answer := @ + I;
         end if;
      end loop;

      Notes := To_Unbounded_String ("Please provide a correct implementation");
      return Answer'Image;
   end Answer;

end P0001_Multiples_Of_3_Or_5;
