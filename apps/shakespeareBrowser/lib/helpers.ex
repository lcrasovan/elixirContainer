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

    fixedLength = Application.get_env(:shakespeareBrowser, :fixedLength)
    minLength = Application.get_env(:shakespeareBrowser, :minLength)
    wordLength = Application.get_env(:shakespeareBrowser, :length)
    isMinLength = minLength and (String.length(String.downcase(word)) >= wordLength)
    isFixedLength = fixedLength and (String.length(String.downcase(word)) == wordLength)

    if (isMinLength or isFixedLength) do
      Map.update acc, String.to_atom(String.downcase(word)), 1, &(&1 + 1)
    else
      acc
    end

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
      |> String.replace("]", "")
      |> String.replace("[", "")
  end

end

defmodule MyList do

  def span(from, to) when from > to, do: []

  def span(from, to) do
    [ from | span(from+1, to) ]
  end
end
