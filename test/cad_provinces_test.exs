defmodule CadProvincesTest do
  use ExUnit.Case
  doctest ChinaAdminDivisions

  @repo_dir "Administrative-divisions-of-China/dist"
  @priv_path :code.priv_dir(:china_admin_divisions)
  @repo_dist_path Path.absname(@repo_dir, @priv_path)

  test "read dist/provinces.json" do
    content = File.read!("#{@repo_dist_path}/provinces.json")
    data = Jason.decode!(content)
    Enum.map(data, fn item -> IO.puts "#{inspect item}" end)
  end

  test "read dist/HK-MO-TW.json" do
    content = File.read!("#{@repo_dist_path}/HK-MO-TW.json")
    data = Jason.decode!(content)
    Enum.map(data, fn item -> IO.puts "#{inspect item}" end)
  end

  test "read dist/cities.json" do
    content = File.read!("#{@repo_dist_path}/cities.json")
    data = Jason.decode!(content)
    Enum.map(data, fn item -> IO.puts "#{inspect item}" end)
  end

  test "read dist/areas.json" do
    content = File.read!("#{@repo_dist_path}/areas.json")
    data = Jason.decode!(content)
    Enum.map(data, fn item -> IO.puts "#{inspect item}" end)
  end

  test "read dist/pcas-code.json" do
    content = File.read!("#{@repo_dist_path}/pcas-code.json")
    data = Jason.decode!(content)
    Enum.map(data, fn item -> IO.puts "#{inspect item}" end)
  end
end
