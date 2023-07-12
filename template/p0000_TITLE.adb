package body P@_NUMBER_@_@_TITLE_@ is

   overriding function Answer
     (Problem : Problem_Type; Notes : in out Unbounded_String) return String
   is
   begin

      Notes := To_Unbounded_String ("Not implemented yet");
      --  Your implementation here ...

      return "0";
   end Answer;

end P@_NUMBER_@_@_TITLE_@rs;
