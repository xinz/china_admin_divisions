defmodule ChinaAdminDivisions do
  @moduledoc """
  Documentation for `ChinaAdminDivisions`.
  """
  alias ChinaAdminDivisions.Gen
  alias Gen.{Lv1s, Lv2d, Lv3x, Lv4xg}

  defguardp is_code?(x) when x in ?0..?9
  defguardp is_4digits_code?(c1, c2, c3, c4) when is_code?(c1) and is_code?(c2) and is_code?(c3) and is_code?(c4)
  defguardp is_6digits_code?(c1, c2, c3, c4, c5, c6) when is_4digits_code?(c1, c2, c3, c4) and is_code?(c5) and is_code?(c6)
  defguardp is_12digits_code?(c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12) when is_6digits_code?(c1, c2, c3, c4, c5, c6) and is_6digits_code?(c7, c8, c9, c10, c11, c12)

  @doc """
  Fetch the first level administrative divisions.

  ## Example

      iex> ChinaAdminDivisions.items()
      [
        %{"code" => "11", "name" => "北京市"},
        %{"code" => "12", "name" => "天津市"},
        %{"code" => "13", "name" => "河北省"},
        %{"code" => "14", "name" => "山西省"},
        %{"code" => "15", "name" => "内蒙古自治区"},
        %{"code" => "21", "name" => "辽宁省"},
        %{"code" => "22", "name" => "吉林省"},
        %{"code" => "23", "name" => "黑龙江省"},
        %{"code" => "31", "name" => "上海市"},
        %{"code" => "32", "name" => "江苏省"},
        %{"code" => "33", "name" => "浙江省"},
        %{"code" => "34", "name" => "安徽省"},
        %{"code" => "35", "name" => "福建省"},
        %{"code" => "36", "name" => "江西省"},
        %{"code" => "37", "name" => "山东省"},
        %{"code" => "41", "name" => "河南省"},
        %{"code" => "42", "name" => "湖北省"},
        %{"code" => "43", "name" => "湖南省"},
        %{"code" => "44", "name" => "广东省"},
        %{"code" => "45", "name" => "广西壮族自治区"},
        %{"code" => "46", "name" => "海南省"},
        %{"code" => "50", "name" => "重庆市"},
        %{"code" => "51", "name" => "四川省"},
        %{"code" => "52", "name" => "贵州省"},
        %{"code" => "53", "name" => "云南省"},
        %{"code" => "54", "name" => "西藏自治区"},
        %{"code" => "61", "name" => "陕西省"},
        %{"code" => "62", "name" => "甘肃省"},
        %{"code" => "63", "name" => "青海省"},
        %{"code" => "64", "name" => "宁夏回族自治区"},
        %{"code" => "65", "name" => "新疆维吾尔自治区"}
      ]
  """
  @spec items() :: list()
  defdelegate items(), to: Lv1s

  @doc """
  Fetch the corresponding divisions according to the input statistical division code or name, if not found any items return `nil`.

  ## Example

  Use the division code to query its subdivisions.

      iex> ChinaAdminDivisions.items("11")
      [%{"code" => "1101", "name" => "北京市/市辖区"}]
      iex> ChinaAdminDivisions.items("1101")
      [
        %{"code" => "110101", "name" => "东城区"},
        %{"code" => "110102", "name" => "西城区"},
        %{"code" => "110105", "name" => "朝阳区"},
        %{"code" => "110106", "name" => "丰台区"},
        %{"code" => "110107", "name" => "石景山区"},
        %{"code" => "110108", "name" => "海淀区"},
        %{"code" => "110109", "name" => "门头沟区"},
        %{"code" => "110111", "name" => "房山区"},
        %{"code" => "110112", "name" => "通州区"},
        %{"code" => "110113", "name" => "顺义区"},
        %{"code" => "110114", "name" => "昌平区"},
        %{"code" => "110115", "name" => "大兴区"},
        %{"code" => "110116", "name" => "怀柔区"},
        %{"code" => "110117", "name" => "平谷区"},
        %{"code" => "110118", "name" => "密云区"},
        %{"code" => "110119", "name" => "延庆区"}
      ]
      iex> ChinaAdminDivisions.items("110101")
      [
        %{"code" => "110101001000", "name" => "东华门街道"},
        %{"code" => "110101002000", "name" => "景山街道"},
        %{"code" => "110101003000", "name" => "交道口街道"},
        %{"code" => "110101004000", "name" => "安定门街道"},
        %{"code" => "110101005000", "name" => "北新桥街道"},
        %{"code" => "110101006000", "name" => "东四街道"},
        %{"code" => "110101007000", "name" => "朝阳门街道"},
        %{"code" => "110101008000", "name" => "建国门街道"},
        %{"code" => "110101009000", "name" => "东直门街道"},
        %{"code" => "110101010000", "name" => "和平里街道"},
        %{"code" => "110101011000", "name" => "前门街道"},
        %{"code" => "110101012000", "name" => "崇文门外街道"},
        %{"code" => "110101013000", "name" => "东花市街道"},
        %{"code" => "110101014000", "name" => "龙潭街道"},
        %{"code" => "110101015000", "name" => "体育馆路街道"},
        %{"code" => "110101016000", "name" => "天坛街道"},
        %{"code" => "110101017000", "name" => "永定门外街道"}
      ]

  Or use the division name to query its subdivisions.

      iex> ChinaAdminDivisions.items("上海市")
      [%{"code" => "3101", "name" => "上海市/市辖区"}]
      iex> ChinaAdminDivisions.items("上海市/市辖区")
      [
        %{"code" => "310101", "name" => "黄浦区"},
        %{"code" => "310104", "name" => "徐汇区"},
        %{"code" => "310105", "name" => "长宁区"},
        %{"code" => "310106", "name" => "静安区"},
        %{"code" => "310107", "name" => "普陀区"},
        %{"code" => "310109", "name" => "虹口区"},
        %{"code" => "310110", "name" => "杨浦区"},
        %{"code" => "310112", "name" => "闵行区"},
        %{"code" => "310113", "name" => "宝山区"},
        %{"code" => "310114", "name" => "嘉定区"},
        %{"code" => "310115", "name" => "浦东新区"},
        %{"code" => "310116", "name" => "金山区"},
        %{"code" => "310117", "name" => "松江区"},
        %{"code" => "310118", "name" => "青浦区"},
        %{"code" => "310120", "name" => "奉贤区"},
        %{"code" => "310151", "name" => "崇明区"}
      ]
      iex> ChinaAdminDivisions.items("闵行区")
      [
        %{"code" => "310112001000", "name" => "江川路街道"},
        %{"code" => "310112006000", "name" => "古美街道"},
        %{"code" => "310112008000", "name" => "新虹街道"},
        %{"code" => "310112009000", "name" => "浦锦街道"},
        %{"code" => "310112101000", "name" => "莘庄镇"},
        %{"code" => "310112102000", "name" => "七宝镇"},
        %{"code" => "310112103000", "name" => "颛桥镇"},
        %{"code" => "310112106000", "name" => "华漕镇"},
        %{"code" => "310112107000", "name" => "虹桥镇"},
        %{"code" => "310112108000", "name" => "梅陇镇"},
        %{"code" => "310112110000", "name" => "吴泾镇"},
        %{"code" => "310112112000", "name" => "马桥镇"},
        %{"code" => "310112114000", "name" => "浦江镇"},
        %{"code" => "310112501000", "name" => "莘庄工业区"}
      ]
  """
  @spec items(input :: String.t()) :: list() | nil
  def items(<<_::8, _::8>> = input), do: Lv1s.next(input)
  def items(<<c1::8, c2::8, c3::8, c4::8>> = input) when is_4digits_code?(c1, c2, c3, c4), do: Lv2d.next(input)
  def items(<<c1::8, c2::8, c3::8, c4::8, c5::8, c6::8>> = input) when is_6digits_code?(c1, c2, c3, c4, c5, c6), do: Lv3x.next(input)
  def items(input) when byte_size(input) >= 6 do
    # for Chinese characters
    Lv1s.next(input) || Lv2d.next(input) || Lv3x.next(input)
  end
  def items(_), do: nil

  @doc """
  According to the division code (`省级`, `地级`, `县级`, `乡级`), query the matched name or `nil`.

  ## Example

      iex> ChinaAdminDivisions.name("50")
      "重庆市"
      iex> ChinaAdminDivisions.name("5002")
      "重庆市/县"
      iex> ChinaAdminDivisions.name("310115")
      "浦东新区"
      iex> ChinaAdminDivisions.name("319115")
      nil
      iex> ChinaAdminDivisions.name("99")
      nil
  """
  @spec name(code :: String.t()) :: String.t() | nil
  def name(<<_::8, _::8>> = code), do: Lv1s.name(code)
  def name(<<c1::8, c2::8, c3::8, c4::8>> = code) when is_4digits_code?(c1, c2, c3, c4), do: Lv2d.name(code)
  def name(<<c1::8, c2::8, c3::8, c4::8, c5::8, c6::8>> = code) when is_6digits_code?(c1, c2, c3, c4, c5, c6), do: Lv3x.name(code)
  def name(<<c1::8, c2::8, c3::8, c4::8, c5::8, c6::8, c7::8, c8::8, c9::8, c10::8, c11::8, c12::8>> = code) when is_12digits_code?(c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12) do
    lv4gx_module(<<c1, c2, c3, c4>>).name(code)
  end
  def name(_), do: nil

  @doc """
  According to the division name (`省级`, `地级`, `县级`), query the matched code or `nil`, because there may be duplicate names at the `乡级` level,
  the query cannot be completed at this level.

  ## Example

      iex> ChinaAdminDivisions.code("广东省")
      "44"
      iex> ChinaAdminDivisions.code("广东")
      "44"
      iex> ChinaAdminDivisions.code("佛山市")
      "4406"
      iex> ChinaAdminDivisions.code("南海区")
      "440605"
      iex> ChinaAdminDivisions.code("桂城街道")
      nil
  """
  @spec code(name :: String.t()) :: String.t() | nil
  def code(name) when is_binary(name) do
    Lv1s.code(name) || Lv2d.code(name) || Lv3x.code(name)
  end
  def code(_), do: nil

  @doc """
  According to the division code (`省级`, `地级`, `县级`, `乡级`), query the all previous levels division names,
  if any part division is not found, the whole result is `nil`.

  ## Example

      iex> ChinaAdminDivisions.expand("44")
      ["广东省"]
      iex> ChinaAdminDivisions.expand("4401")
      ["广东省", "广州市"]
      iex> ChinaAdminDivisions.expand("440106")
      ["广东省", "广州市", "天河区"]
      iex> ChinaAdminDivisions.expand("440106014000")
      ["广东省", "广州市", "天河区", "冼村街道"]
      iex> ChinaAdminDivisions.expand("440190")
      nil
      iex> ChinaAdminDivisions.expand("440106014001")
      nil
  """
  def expand(<<_::8, _::8>> = code) do
    name = Lv1s.name(code)
    if name == nil, do: nil, else: [name]
  end
  def expand(<<c1::8, c2::8, c3::8, c4::8>> = code) when is_4digits_code?(c1, c2, c3, c4) do
    with lv1_name when lv1_name != nil <- Lv1s.name(<<c1, c2>>),
         lv2_name when lv2_name != nil <- Lv2d.name(code) do
      [lv1_name, lv2_name]
    else
      _ ->
        nil
    end
  end
  def expand(<<c1::8, c2::8, c3::8, c4::8, c5::8, c6::8>> = code) when is_6digits_code?(c1, c2, c3, c4, c5, c6) do
    with [lv1_name, lv2_name] <- expand(<<c1, c2, c3, c4>>),
         lv3_name when lv3_name != nil <- Lv3x.name(code) do
      [lv1_name, lv2_name, lv3_name]
    else
      _ ->
        nil
    end
  end
  def expand(<<c1::8, c2::8, c3::8, c4::8, c5::8, c6::8, c7::8, c8::8, c9::8, c10::8, c11::8, c12::8>> = code) when is_12digits_code?(c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12) do
    with [lv1_name, lv2_name, lv3_name] <- expand(<<c1, c2, c3, c4, c5, c6>>),
         lv4_name when lv4_name != nil <- lv4gx_module(<<c1, c2, c3, c4>>).name(code) do
      [lv1_name, lv2_name, lv3_name, lv4_name]
    else
      _ ->
        nil
    end
  end
  def expand(_), do: nil

  defp lv4gx_module(lv2_name), do: Module.concat([Lv4xg, "M#{lv2_name}"])

end
