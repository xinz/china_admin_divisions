defmodule ChinaAdminDivisionsTest do
  use ExUnit.Case

  test "iterate items by division code" do
    # China mainland's 31 first level administrative regions
    items_1st = ChinaAdminDivisions.items()
    assert length(items_1st) == 31
    assert items_1st == [
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
    assert ChinaAdminDivisions.items("31") == [%{"code" => "3101", "name" => "上海市/市辖区"}]
    assert ChinaAdminDivisions.items("3101") == [
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
    assert ChinaAdminDivisions.items("310101") == [
      %{"code" => "310101002000", "name" => "南京东路街道"},
      %{"code" => "310101013000", "name" => "外滩街道"},
      %{"code" => "310101015000", "name" => "半淞园路街道"},
      %{"code" => "310101017000", "name" => "小东门街道"},
      %{"code" => "310101018000", "name" => "豫园街道"},
      %{"code" => "310101019000", "name" => "老西门街道"},
      %{"code" => "310101020000", "name" => "五里桥街道"},
      %{"code" => "310101021000", "name" => "打浦桥街道"},
      %{"code" => "310101022000", "name" => "淮海中路街道"},
      %{"code" => "310101023000", "name" => "瑞金二路街道"}
    ]
  end

  test "iterate items by division name" do
    assert ChinaAdminDivisions.items("广东省") == 
      [
        %{"code" => "4401", "name" => "广州市"},
        %{"code" => "4402", "name" => "韶关市"},
        %{"code" => "4403", "name" => "深圳市"},
        %{"code" => "4404", "name" => "珠海市"},
        %{"code" => "4405", "name" => "汕头市"},
        %{"code" => "4406", "name" => "佛山市"},
        %{"code" => "4407", "name" => "江门市"},
        %{"code" => "4408", "name" => "湛江市"},
        %{"code" => "4409", "name" => "茂名市"},
        %{"code" => "4412", "name" => "肇庆市"},
        %{"code" => "4413", "name" => "惠州市"},
        %{"code" => "4414", "name" => "梅州市"},
        %{"code" => "4415", "name" => "汕尾市"},
        %{"code" => "4416", "name" => "河源市"},
        %{"code" => "4417", "name" => "阳江市"},
        %{"code" => "4418", "name" => "清远市"},
        %{"code" => "4419", "name" => "东莞市"},
        %{"code" => "4420", "name" => "中山市"},
        %{"code" => "4451", "name" => "潮州市"},
        %{"code" => "4452", "name" => "揭阳市"},
        %{"code" => "4453", "name" => "云浮市"}
      ]
    assert ChinaAdminDivisions.items("广州市") ==
      [
        %{"code" => "440103", "name" => "荔湾区"},
        %{"code" => "440104", "name" => "越秀区"},
        %{"code" => "440105", "name" => "海珠区"},
        %{"code" => "440106", "name" => "天河区"},
        %{"code" => "440111", "name" => "白云区"},
        %{"code" => "440112", "name" => "黄埔区"},
        %{"code" => "440113", "name" => "番禺区"},
        %{"code" => "440114", "name" => "花都区"},
        %{"code" => "440115", "name" => "南沙区"},
        %{"code" => "440117", "name" => "从化区"},
        %{"code" => "440118", "name" => "增城区"}
      ]
    assert ChinaAdminDivisions.items("荔湾区") ==
      [
        %{"code" => "440103001000", "name" => "沙面街道"},
        %{"code" => "440103002000", "name" => "岭南街道"},
        %{"code" => "440103003000", "name" => "华林街道"},
        %{"code" => "440103004000", "name" => "多宝街道"},
        %{"code" => "440103005000", "name" => "昌华街道"},
        %{"code" => "440103006000", "name" => "逢源街道"},
        %{"code" => "440103007000", "name" => "龙津街道"},
        %{"code" => "440103008000", "name" => "金花街道"},
        %{"code" => "440103009000", "name" => "彩虹街道"},
        %{"code" => "440103010000", "name" => "南源街道"},
        %{"code" => "440103011000", "name" => "西村街道"},
        %{"code" => "440103012000", "name" => "站前街道"},
        %{"code" => "440103013000", "name" => "桥中街道"},
        %{"code" => "440103014000", "name" => "白鹤洞街道"},
        %{"code" => "440103015000", "name" => "冲口街道"},
        %{"code" => "440103016000", "name" => "花地街道"},
        %{"code" => "440103017000", "name" => "石围塘街道"},
        %{"code" => "440103018000", "name" => "茶滘街道"},
        %{"code" => "440103019000", "name" => "东漖街道"},
        %{"code" => "440103020000", "name" => "海龙街道"},
        %{"code" => "440103021000", "name" => "东沙街道"},
        %{"code" => "440103022000", "name" => "中南街道"}
      ]
  end

  test "iterate items by division name with special suffix naming" do
    assert ChinaAdminDivisions.items("上海") == [%{"code" => "3101", "name" => "上海市/市辖区"}]

    assert ChinaAdminDivisions.items("上海市/市辖区") == [
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
  end

  test "map code to name" do
    assert ChinaAdminDivisions.name("44") == "广东省"
    assert ChinaAdminDivisions.name("5001") == "重庆市/市辖区"
    assert ChinaAdminDivisions.name("5002") == "重庆市/县"
    assert ChinaAdminDivisions.name("4406") == "佛山市"
    assert ChinaAdminDivisions.name("440605") == "南海区"
    assert ChinaAdminDivisions.name("440605011000") == "桂城街道"

    # invalid
    assert ChinaAdminDivisions.name("440a") == nil
    assert ChinaAdminDivisions.name("广东省") == nil
    assert ChinaAdminDivisions.name(44) == nil
  end

  test "map name to code" do
    assert ChinaAdminDivisions.code("广东省") == "44"
    assert ChinaAdminDivisions.code("广东") == "44"
    assert ChinaAdminDivisions.code("重庆市") == "50"
    assert ChinaAdminDivisions.code("重庆") == "50"
    assert ChinaAdminDivisions.code("重庆市/市辖区") == "5001"
    assert ChinaAdminDivisions.code("重庆市/县") == "5002"
    assert ChinaAdminDivisions.code("桂城街道") == nil

    # invalid
    assert ChinaAdminDivisions.code("重庆/市辖区") == nil
    assert ChinaAdminDivisions.code("重庆/县") == nil
    assert ChinaAdminDivisions.code("abc") == nil
    assert ChinaAdminDivisions.code(44) == nil
  end

  test "expand code" do
    assert ChinaAdminDivisions.expand("44") == ["广东省"]
    assert ChinaAdminDivisions.expand("4401") == ["广东省", "广州市"]
    assert ChinaAdminDivisions.expand("440106") == ["广东省", "广州市", "天河区"]
    assert ChinaAdminDivisions.expand("440106019000") == ["广东省", "广州市", "天河区", "凤凰街道"]
    assert ChinaAdminDivisions.expand("50") == ["重庆市"]
    assert ChinaAdminDivisions.expand("5001") == ["重庆市", "重庆市/市辖区"]
    assert ChinaAdminDivisions.expand("500101") == ["重庆市", "重庆市/市辖区", "万州区"]
    assert ChinaAdminDivisions.expand("500101001000") == ["重庆市", "重庆市/市辖区", "万州区", "高笋塘街道"]

    # invalid
    assert ChinaAdminDivisions.expand(44) == nil
    assert ChinaAdminDivisions.expand("500301") == nil
    assert ChinaAdminDivisions.expand("900101") == nil
    assert ChinaAdminDivisions.expand("509001") == nil
    assert ChinaAdminDivisions.expand("500190") == nil
    assert ChinaAdminDivisions.expand("北京市") == nil
    assert ChinaAdminDivisions.expand("江西省") == nil
  end
end
