defmodule SentenceRecognizer do
  def is_a_question?(phrase) do
    String.ends_with?(phrase, "?")
  end

  def shouting?(phrase) do
    Regex.run(%r/[A-Za-z]/, phrase) &&
    String.upcase(phrase) == phrase
  end

  def silent?(phrase) do
    String.strip(phrase) |> String.length == 0
  end
end

defmodule Teenager do
  import SentenceRecognizer

  def hey(phrase) do
    cond do
      silent?(phrase)            -> "Fine. Be that way!"
      shouting?(phrase)          -> "Woah, chill out!"
      is_a_question?(phrase)     -> "Sure."
      ELSE                       -> "Whatever."
    end
  end
end
