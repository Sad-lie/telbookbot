defmodule EpubExtract do
  alias Floki

  def unzip_and_parse_epub(epub_path) do
    temp_dir = create_temp_dir()

    {:ok, _} = unzip_epub(epub_path, temp_dir)

    extracted_content = read_temp_dir(temp_dir)
    parsed_segments = parse_with_floki(extracted_content)
    :ok = File.rm_rf!(temp_dir)

    parsed_segments
  end

  defp unzip_epub(epub_path, extract_path) do
    epub_file = File.read!(epub_path)
    :zip.unzip(epub_file, [{:cwd, extract_path}])
  end

  defp create_temp_dir do
    {:ok, temp_dir} = File.Temp.dir!("epub_extraction")
    temp_dir
  end

  defp read_temp_dir(temp_dir) do
    File.read!(temp_dir)
  end

  defp parse_with_floki(content) do
    parsed_segments = Floki.find(content, "your_floki_selector")
    parsed_segments
  end
end
