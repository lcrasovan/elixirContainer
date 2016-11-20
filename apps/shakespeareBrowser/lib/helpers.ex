defmodule WordCount do
  def count(words) when is_list(words) do
    Enum.reduce(words, %{}, &update_count/2)
  end

  def count(sentence) do
    sentence
    |> String.split
    |> count
  end

  def text_count(sentences) do
    count Enum.join(sentences, " ")
  end

  def update_count(word, acc) do
    Map.update acc, String.to_atom(String.downcase(word)), 1, &(&1 + 1)
  end

  def process_line(line) do
    line
      |> String.strip
      |> String.replace(".", " ")
      |> String.replace(",", " ")
      |> String.replace(":", " ")
      |> String.replace(";", " ")
      |> String.replace("?", " ")
      |> String.replace("!", " ")
      |> String.replace("-", " ")
  end

end