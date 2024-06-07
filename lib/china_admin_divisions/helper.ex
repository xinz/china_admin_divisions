defmodule ChinaAdminDivisions.Helper do
  @moduledoc false

  def make_lv1_name_shorter(name) do
    String.replace(name, ["省", "市", "自治区", "壮族自治区", "回族自治区", "维吾尔自治区"], "")
  end

  def make_lv2_name_shorter(name) do
    String.replace(name, ["市", "自治州", "地区", "蒙古自治州", "回族自治州", "哈萨克自治州", "藏族自治州",
      "蒙古族藏族自治州", "哈尼族彝族自治州", "壮族苗族自治州", "白族自治州", "傣族景颇族自治州", "傈僳族自治州", "藏族自治州",
      "苗族侗族自治州", "布依族苗族自治州", "藏族羌族自治州", "彝族自治州", "土家族苗族自治州", "傣族自治州", "盟"], "")
  end

  def make_lv3_name_shorter(name) do
    String.replace(name, ["土家族苗族自治县"], "")
  end

end
