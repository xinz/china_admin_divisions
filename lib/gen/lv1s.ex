defmodule ChinaAdminDivisions.Gen.Lv1s do
  @moduledoc false
  # 省级

  def code(name) when name == "北京市" or name == "北京", do: "11"
  def code(name) when name == "天津市" or name == "天津", do: "12"
  def code(name) when name == "河北省" or name == "河北", do: "13"
  def code(name) when name == "山西省" or name == "山西", do: "14"
  def code(name) when name == "内蒙古自治区" or name == "内蒙古", do: "15"
  def code(name) when name == "辽宁省" or name == "辽宁", do: "21"
  def code(name) when name == "吉林省" or name == "吉林", do: "22"
  def code(name) when name == "黑龙江省" or name == "黑龙江", do: "23"
  def code(name) when name == "上海市" or name == "上海", do: "31"
  def code(name) when name == "江苏省" or name == "江苏", do: "32"
  def code(name) when name == "浙江省" or name == "浙江", do: "33"
  def code(name) when name == "安徽省" or name == "安徽", do: "34"
  def code(name) when name == "福建省" or name == "福建", do: "35"
  def code(name) when name == "江西省" or name == "江西", do: "36"
  def code(name) when name == "山东省" or name == "山东", do: "37"
  def code(name) when name == "河南省" or name == "河南", do: "41"
  def code(name) when name == "湖北省" or name == "湖北", do: "42"
  def code(name) when name == "湖南省" or name == "湖南", do: "43"
  def code(name) when name == "广东省" or name == "广东", do: "44"
  def code(name) when name == "广西壮族自治区" or name == "广西", do: "45"
  def code(name) when name == "海南省" or name == "海南", do: "46"
  def code(name) when name == "重庆市" or name == "重庆", do: "50"
  def code(name) when name == "四川省" or name == "四川", do: "51"
  def code(name) when name == "贵州省" or name == "贵州", do: "52"
  def code(name) when name == "云南省" or name == "云南", do: "53"
  def code(name) when name == "西藏自治区" or name == "西藏", do: "54"
  def code(name) when name == "陕西省" or name == "陕西", do: "61"
  def code(name) when name == "甘肃省" or name == "甘肃", do: "62"
  def code(name) when name == "青海省" or name == "青海", do: "63"
  def code(name) when name == "宁夏回族自治区" or name == "宁夏", do: "64"
  def code(name) when name == "新疆维吾尔自治区" or name == "新疆", do: "65"
  def code(_unknown), do: nil

  def name("11"), do: {"北京市", "北京"}
  def name("12"), do: {"天津市", "天津"}
  def name("13"), do: {"河北省", "河北"}
  def name("14"), do: {"山西省", "山西"}
  def name("15"), do: {"内蒙古自治区", "内蒙古"}
  def name("21"), do: {"辽宁省", "辽宁"}
  def name("22"), do: {"吉林省", "吉林"}
  def name("23"), do: {"黑龙江省", "黑龙江"}
  def name("31"), do: {"上海市", "上海"}
  def name("32"), do: {"江苏省", "江苏"}
  def name("33"), do: {"浙江省", "浙江"}
  def name("34"), do: {"安徽省", "安徽"}
  def name("35"), do: {"福建省", "福建"}
  def name("36"), do: {"江西省", "江西"}
  def name("37"), do: {"山东省", "山东"}
  def name("41"), do: {"河南省", "河南"}
  def name("42"), do: {"湖北省", "湖北"}
  def name("43"), do: {"湖南省", "湖南"}
  def name("44"), do: {"广东省", "广东"}
  def name("45"), do: {"广西壮族自治区", "广西"}
  def name("46"), do: {"海南省", "海南"}
  def name("50"), do: {"重庆市", "重庆"}
  def name("51"), do: {"四川省", "四川"}
  def name("52"), do: {"贵州省", "贵州"}
  def name("53"), do: {"云南省", "云南"}
  def name("54"), do: {"西藏自治区", "西藏"}
  def name("61"), do: {"陕西省", "陕西"}
  def name("62"), do: {"甘肃省", "甘肃"}
  def name("63"), do: {"青海省", "青海"}
  def name("64"), do: {"宁夏回族自治区", "宁夏"}
  def name("65"), do: {"新疆维吾尔自治区", "新疆"}
  def name(_unknown), do: nil

  def names(),
    do: [
      "北京市",
      "天津市",
      "河北省",
      "山西省",
      "内蒙古自治区",
      "辽宁省",
      "吉林省",
      "黑龙江省",
      "上海市",
      "江苏省",
      "浙江省",
      "安徽省",
      "福建省",
      "江西省",
      "山东省",
      "河南省",
      "湖北省",
      "湖南省",
      "广东省",
      "广西壮族自治区",
      "海南省",
      "重庆市",
      "四川省",
      "贵州省",
      "云南省",
      "西藏自治区",
      "陕西省",
      "甘肃省",
      "青海省",
      "宁夏回族自治区",
      "新疆维吾尔自治区"
    ]

  def shorter_names(),
    do: [
      "北京",
      "天津",
      "河北",
      "山西",
      "内蒙古",
      "辽宁",
      "吉林",
      "黑龙江",
      "上海",
      "江苏",
      "浙江",
      "安徽",
      "福建",
      "江西",
      "山东",
      "河南",
      "湖北",
      "湖南",
      "广东",
      "广西",
      "海南",
      "重庆",
      "四川",
      "贵州",
      "云南",
      "西藏",
      "陕西",
      "甘肃",
      "青海",
      "宁夏",
      "新疆"
    ]

  def codes(),
    do: [
      "11",
      "12",
      "13",
      "14",
      "15",
      "21",
      "22",
      "23",
      "31",
      "32",
      "33",
      "34",
      "35",
      "36",
      "37",
      "41",
      "42",
      "43",
      "44",
      "45",
      "46",
      "50",
      "51",
      "52",
      "53",
      "54",
      "61",
      "62",
      "63",
      "64",
      "65"
    ]

  def next(input)
      when input == "新疆维吾尔自治区"
      when input == "新疆"
      when input == "65",
      do: [
        %{"name" => "乌鲁木齐市", "code" => "6501"},
        %{"name" => "克拉玛依市", "code" => "6502"},
        %{"name" => "吐鲁番市", "code" => "6504"},
        %{"name" => "哈密市", "code" => "6505"},
        %{"name" => "昌吉回族自治州", "code" => "6523"},
        %{"name" => "博尔塔拉蒙古自治州", "code" => "6527"},
        %{"name" => "巴音郭楞蒙古自治州", "code" => "6528"},
        %{"name" => "阿克苏地区", "code" => "6529"},
        %{"name" => "克孜勒苏柯尔克孜自治州", "code" => "6530"},
        %{"name" => "喀什地区", "code" => "6531"},
        %{"name" => "和田地区", "code" => "6532"},
        %{"name" => "伊犁哈萨克自治州", "code" => "6540"},
        %{"name" => "塔城地区", "code" => "6542"},
        %{"name" => "阿勒泰地区", "code" => "6543"},
        %{"name" => "新疆维吾尔自治区/自治区直辖县级行政区划", "code" => "6590"}
      ]

  def next(input)
      when input == "宁夏回族自治区"
      when input == "宁夏"
      when input == "64",
      do: [
        %{"name" => "银川市", "code" => "6401"},
        %{"name" => "石嘴山市", "code" => "6402"},
        %{"name" => "吴忠市", "code" => "6403"},
        %{"name" => "固原市", "code" => "6404"},
        %{"name" => "中卫市", "code" => "6405"}
      ]

  def next(input)
      when input == "青海省"
      when input == "青海"
      when input == "63",
      do: [
        %{"name" => "西宁市", "code" => "6301"},
        %{"name" => "海东市", "code" => "6302"},
        %{"name" => "海北藏族自治州", "code" => "6322"},
        %{"name" => "黄南藏族自治州", "code" => "6323"},
        %{"name" => "海南藏族自治州", "code" => "6325"},
        %{"name" => "果洛藏族自治州", "code" => "6326"},
        %{"name" => "玉树藏族自治州", "code" => "6327"},
        %{"name" => "海西蒙古族藏族自治州", "code" => "6328"}
      ]

  def next(input)
      when input == "甘肃省"
      when input == "甘肃"
      when input == "62",
      do: [
        %{"name" => "兰州市", "code" => "6201"},
        %{"name" => "嘉峪关市", "code" => "6202"},
        %{"name" => "金昌市", "code" => "6203"},
        %{"name" => "白银市", "code" => "6204"},
        %{"name" => "天水市", "code" => "6205"},
        %{"name" => "武威市", "code" => "6206"},
        %{"name" => "张掖市", "code" => "6207"},
        %{"name" => "平凉市", "code" => "6208"},
        %{"name" => "酒泉市", "code" => "6209"},
        %{"name" => "庆阳市", "code" => "6210"},
        %{"name" => "定西市", "code" => "6211"},
        %{"name" => "陇南市", "code" => "6212"},
        %{"name" => "临夏回族自治州", "code" => "6229"},
        %{"name" => "甘南藏族自治州", "code" => "6230"}
      ]

  def next(input)
      when input == "陕西省"
      when input == "陕西"
      when input == "61",
      do: [
        %{"name" => "西安市", "code" => "6101"},
        %{"name" => "铜川市", "code" => "6102"},
        %{"name" => "宝鸡市", "code" => "6103"},
        %{"name" => "咸阳市", "code" => "6104"},
        %{"name" => "渭南市", "code" => "6105"},
        %{"name" => "延安市", "code" => "6106"},
        %{"name" => "汉中市", "code" => "6107"},
        %{"name" => "榆林市", "code" => "6108"},
        %{"name" => "安康市", "code" => "6109"},
        %{"name" => "商洛市", "code" => "6110"}
      ]

  def next(input)
      when input == "西藏自治区"
      when input == "西藏"
      when input == "54",
      do: [
        %{"name" => "拉萨市", "code" => "5401"},
        %{"name" => "日喀则市", "code" => "5402"},
        %{"name" => "昌都市", "code" => "5403"},
        %{"name" => "林芝市", "code" => "5404"},
        %{"name" => "山南市", "code" => "5405"},
        %{"name" => "那曲市", "code" => "5406"},
        %{"name" => "阿里地区", "code" => "5425"}
      ]

  def next(input)
      when input == "云南省"
      when input == "云南"
      when input == "53",
      do: [
        %{"name" => "昆明市", "code" => "5301"},
        %{"name" => "曲靖市", "code" => "5303"},
        %{"name" => "玉溪市", "code" => "5304"},
        %{"name" => "保山市", "code" => "5305"},
        %{"name" => "昭通市", "code" => "5306"},
        %{"name" => "丽江市", "code" => "5307"},
        %{"name" => "普洱市", "code" => "5308"},
        %{"name" => "临沧市", "code" => "5309"},
        %{"name" => "楚雄彝族自治州", "code" => "5323"},
        %{"name" => "红河哈尼族彝族自治州", "code" => "5325"},
        %{"name" => "文山壮族苗族自治州", "code" => "5326"},
        %{"name" => "西双版纳傣族自治州", "code" => "5328"},
        %{"name" => "大理白族自治州", "code" => "5329"},
        %{"name" => "德宏傣族景颇族自治州", "code" => "5331"},
        %{"name" => "怒江傈僳族自治州", "code" => "5333"},
        %{"name" => "迪庆藏族自治州", "code" => "5334"}
      ]

  def next(input)
      when input == "贵州省"
      when input == "贵州"
      when input == "52",
      do: [
        %{"name" => "贵阳市", "code" => "5201"},
        %{"name" => "六盘水市", "code" => "5202"},
        %{"name" => "遵义市", "code" => "5203"},
        %{"name" => "安顺市", "code" => "5204"},
        %{"name" => "毕节市", "code" => "5205"},
        %{"name" => "铜仁市", "code" => "5206"},
        %{"name" => "黔西南布依族苗族自治州", "code" => "5223"},
        %{"name" => "黔东南苗族侗族自治州", "code" => "5226"},
        %{"name" => "黔南布依族苗族自治州", "code" => "5227"}
      ]

  def next(input)
      when input == "四川省"
      when input == "四川"
      when input == "51",
      do: [
        %{"name" => "成都市", "code" => "5101"},
        %{"name" => "自贡市", "code" => "5103"},
        %{"name" => "攀枝花市", "code" => "5104"},
        %{"name" => "泸州市", "code" => "5105"},
        %{"name" => "德阳市", "code" => "5106"},
        %{"name" => "绵阳市", "code" => "5107"},
        %{"name" => "广元市", "code" => "5108"},
        %{"name" => "遂宁市", "code" => "5109"},
        %{"name" => "内江市", "code" => "5110"},
        %{"name" => "乐山市", "code" => "5111"},
        %{"name" => "南充市", "code" => "5113"},
        %{"name" => "眉山市", "code" => "5114"},
        %{"name" => "宜宾市", "code" => "5115"},
        %{"name" => "广安市", "code" => "5116"},
        %{"name" => "达州市", "code" => "5117"},
        %{"name" => "雅安市", "code" => "5118"},
        %{"name" => "巴中市", "code" => "5119"},
        %{"name" => "资阳市", "code" => "5120"},
        %{"name" => "阿坝藏族羌族自治州", "code" => "5132"},
        %{"name" => "甘孜藏族自治州", "code" => "5133"},
        %{"name" => "凉山彝族自治州", "code" => "5134"}
      ]

  def next(input)
      when input == "重庆市"
      when input == "重庆"
      when input == "50",
      do: [%{"name" => "重庆市/市辖区", "code" => "5001"}, %{"name" => "重庆市/县", "code" => "5002"}]

  def next(input)
      when input == "海南省"
      when input == "海南"
      when input == "46",
      do: [
        %{"name" => "海口市", "code" => "4601"},
        %{"name" => "三亚市", "code" => "4602"},
        %{"name" => "三沙市", "code" => "4603"},
        %{"name" => "儋州市", "code" => "4604"},
        %{"name" => "海南省/省直辖县级行政区划", "code" => "4690"}
      ]

  def next(input)
      when input == "广西壮族自治区"
      when input == "广西"
      when input == "45",
      do: [
        %{"name" => "南宁市", "code" => "4501"},
        %{"name" => "柳州市", "code" => "4502"},
        %{"name" => "桂林市", "code" => "4503"},
        %{"name" => "梧州市", "code" => "4504"},
        %{"name" => "北海市", "code" => "4505"},
        %{"name" => "防城港市", "code" => "4506"},
        %{"name" => "钦州市", "code" => "4507"},
        %{"name" => "贵港市", "code" => "4508"},
        %{"name" => "玉林市", "code" => "4509"},
        %{"name" => "百色市", "code" => "4510"},
        %{"name" => "贺州市", "code" => "4511"},
        %{"name" => "河池市", "code" => "4512"},
        %{"name" => "来宾市", "code" => "4513"},
        %{"name" => "崇左市", "code" => "4514"}
      ]

  def next(input)
      when input == "广东省"
      when input == "广东"
      when input == "44",
      do: [
        %{"name" => "广州市", "code" => "4401"},
        %{"name" => "韶关市", "code" => "4402"},
        %{"name" => "深圳市", "code" => "4403"},
        %{"name" => "珠海市", "code" => "4404"},
        %{"name" => "汕头市", "code" => "4405"},
        %{"name" => "佛山市", "code" => "4406"},
        %{"name" => "江门市", "code" => "4407"},
        %{"name" => "湛江市", "code" => "4408"},
        %{"name" => "茂名市", "code" => "4409"},
        %{"name" => "肇庆市", "code" => "4412"},
        %{"name" => "惠州市", "code" => "4413"},
        %{"name" => "梅州市", "code" => "4414"},
        %{"name" => "汕尾市", "code" => "4415"},
        %{"name" => "河源市", "code" => "4416"},
        %{"name" => "阳江市", "code" => "4417"},
        %{"name" => "清远市", "code" => "4418"},
        %{"name" => "东莞市", "code" => "4419"},
        %{"name" => "中山市", "code" => "4420"},
        %{"name" => "潮州市", "code" => "4451"},
        %{"name" => "揭阳市", "code" => "4452"},
        %{"name" => "云浮市", "code" => "4453"}
      ]

  def next(input)
      when input == "湖南省"
      when input == "湖南"
      when input == "43",
      do: [
        %{"name" => "长沙市", "code" => "4301"},
        %{"name" => "株洲市", "code" => "4302"},
        %{"name" => "湘潭市", "code" => "4303"},
        %{"name" => "衡阳市", "code" => "4304"},
        %{"name" => "邵阳市", "code" => "4305"},
        %{"name" => "岳阳市", "code" => "4306"},
        %{"name" => "常德市", "code" => "4307"},
        %{"name" => "张家界市", "code" => "4308"},
        %{"name" => "益阳市", "code" => "4309"},
        %{"name" => "郴州市", "code" => "4310"},
        %{"name" => "永州市", "code" => "4311"},
        %{"name" => "怀化市", "code" => "4312"},
        %{"name" => "娄底市", "code" => "4313"},
        %{"name" => "湘西土家族苗族自治州", "code" => "4331"}
      ]

  def next(input)
      when input == "湖北省"
      when input == "湖北"
      when input == "42",
      do: [
        %{"name" => "武汉市", "code" => "4201"},
        %{"name" => "黄石市", "code" => "4202"},
        %{"name" => "十堰市", "code" => "4203"},
        %{"name" => "宜昌市", "code" => "4205"},
        %{"name" => "襄阳市", "code" => "4206"},
        %{"name" => "鄂州市", "code" => "4207"},
        %{"name" => "荆门市", "code" => "4208"},
        %{"name" => "孝感市", "code" => "4209"},
        %{"name" => "荆州市", "code" => "4210"},
        %{"name" => "黄冈市", "code" => "4211"},
        %{"name" => "咸宁市", "code" => "4212"},
        %{"name" => "随州市", "code" => "4213"},
        %{"name" => "恩施土家族苗族自治州", "code" => "4228"},
        %{"name" => "湖北省/省直辖县级行政区划", "code" => "4290"}
      ]

  def next(input)
      when input == "河南省"
      when input == "河南"
      when input == "41",
      do: [
        %{"name" => "郑州市", "code" => "4101"},
        %{"name" => "开封市", "code" => "4102"},
        %{"name" => "洛阳市", "code" => "4103"},
        %{"name" => "平顶山市", "code" => "4104"},
        %{"name" => "安阳市", "code" => "4105"},
        %{"name" => "鹤壁市", "code" => "4106"},
        %{"name" => "新乡市", "code" => "4107"},
        %{"name" => "焦作市", "code" => "4108"},
        %{"name" => "濮阳市", "code" => "4109"},
        %{"name" => "许昌市", "code" => "4110"},
        %{"name" => "漯河市", "code" => "4111"},
        %{"name" => "三门峡市", "code" => "4112"},
        %{"name" => "南阳市", "code" => "4113"},
        %{"name" => "商丘市", "code" => "4114"},
        %{"name" => "信阳市", "code" => "4115"},
        %{"name" => "周口市", "code" => "4116"},
        %{"name" => "驻马店市", "code" => "4117"},
        %{"name" => "河南省/省直辖县级行政区划", "code" => "4190"}
      ]

  def next(input)
      when input == "山东省"
      when input == "山东"
      when input == "37",
      do: [
        %{"name" => "济南市", "code" => "3701"},
        %{"name" => "青岛市", "code" => "3702"},
        %{"name" => "淄博市", "code" => "3703"},
        %{"name" => "枣庄市", "code" => "3704"},
        %{"name" => "东营市", "code" => "3705"},
        %{"name" => "烟台市", "code" => "3706"},
        %{"name" => "潍坊市", "code" => "3707"},
        %{"name" => "济宁市", "code" => "3708"},
        %{"name" => "泰安市", "code" => "3709"},
        %{"name" => "威海市", "code" => "3710"},
        %{"name" => "日照市", "code" => "3711"},
        %{"name" => "临沂市", "code" => "3713"},
        %{"name" => "德州市", "code" => "3714"},
        %{"name" => "聊城市", "code" => "3715"},
        %{"name" => "滨州市", "code" => "3716"},
        %{"name" => "菏泽市", "code" => "3717"}
      ]

  def next(input)
      when input == "江西省"
      when input == "江西"
      when input == "36",
      do: [
        %{"name" => "南昌市", "code" => "3601"},
        %{"name" => "景德镇市", "code" => "3602"},
        %{"name" => "萍乡市", "code" => "3603"},
        %{"name" => "九江市", "code" => "3604"},
        %{"name" => "新余市", "code" => "3605"},
        %{"name" => "鹰潭市", "code" => "3606"},
        %{"name" => "赣州市", "code" => "3607"},
        %{"name" => "吉安市", "code" => "3608"},
        %{"name" => "宜春市", "code" => "3609"},
        %{"name" => "抚州市", "code" => "3610"},
        %{"name" => "上饶市", "code" => "3611"}
      ]

  def next(input)
      when input == "福建省"
      when input == "福建"
      when input == "35",
      do: [
        %{"name" => "福州市", "code" => "3501"},
        %{"name" => "厦门市", "code" => "3502"},
        %{"name" => "莆田市", "code" => "3503"},
        %{"name" => "三明市", "code" => "3504"},
        %{"name" => "泉州市", "code" => "3505"},
        %{"name" => "漳州市", "code" => "3506"},
        %{"name" => "南平市", "code" => "3507"},
        %{"name" => "龙岩市", "code" => "3508"},
        %{"name" => "宁德市", "code" => "3509"}
      ]

  def next(input)
      when input == "安徽省"
      when input == "安徽"
      when input == "34",
      do: [
        %{"name" => "合肥市", "code" => "3401"},
        %{"name" => "芜湖市", "code" => "3402"},
        %{"name" => "蚌埠市", "code" => "3403"},
        %{"name" => "淮南市", "code" => "3404"},
        %{"name" => "马鞍山市", "code" => "3405"},
        %{"name" => "淮北市", "code" => "3406"},
        %{"name" => "铜陵市", "code" => "3407"},
        %{"name" => "安庆市", "code" => "3408"},
        %{"name" => "黄山市", "code" => "3410"},
        %{"name" => "滁州市", "code" => "3411"},
        %{"name" => "阜阳市", "code" => "3412"},
        %{"name" => "宿州市", "code" => "3413"},
        %{"name" => "六安市", "code" => "3415"},
        %{"name" => "亳州市", "code" => "3416"},
        %{"name" => "池州市", "code" => "3417"},
        %{"name" => "宣城市", "code" => "3418"}
      ]

  def next(input)
      when input == "浙江省"
      when input == "浙江"
      when input == "33",
      do: [
        %{"name" => "杭州市", "code" => "3301"},
        %{"name" => "宁波市", "code" => "3302"},
        %{"name" => "温州市", "code" => "3303"},
        %{"name" => "嘉兴市", "code" => "3304"},
        %{"name" => "湖州市", "code" => "3305"},
        %{"name" => "绍兴市", "code" => "3306"},
        %{"name" => "金华市", "code" => "3307"},
        %{"name" => "衢州市", "code" => "3308"},
        %{"name" => "舟山市", "code" => "3309"},
        %{"name" => "台州市", "code" => "3310"},
        %{"name" => "丽水市", "code" => "3311"}
      ]

  def next(input)
      when input == "江苏省"
      when input == "江苏"
      when input == "32",
      do: [
        %{"name" => "南京市", "code" => "3201"},
        %{"name" => "无锡市", "code" => "3202"},
        %{"name" => "徐州市", "code" => "3203"},
        %{"name" => "常州市", "code" => "3204"},
        %{"name" => "苏州市", "code" => "3205"},
        %{"name" => "南通市", "code" => "3206"},
        %{"name" => "连云港市", "code" => "3207"},
        %{"name" => "淮安市", "code" => "3208"},
        %{"name" => "盐城市", "code" => "3209"},
        %{"name" => "扬州市", "code" => "3210"},
        %{"name" => "镇江市", "code" => "3211"},
        %{"name" => "泰州市", "code" => "3212"},
        %{"name" => "宿迁市", "code" => "3213"}
      ]

  def next(input)
      when input == "上海市"
      when input == "上海"
      when input == "31",
      do: [%{"name" => "上海市/市辖区", "code" => "3101"}]

  def next(input)
      when input == "黑龙江省"
      when input == "黑龙江"
      when input == "23",
      do: [
        %{"name" => "哈尔滨市", "code" => "2301"},
        %{"name" => "齐齐哈尔市", "code" => "2302"},
        %{"name" => "鸡西市", "code" => "2303"},
        %{"name" => "鹤岗市", "code" => "2304"},
        %{"name" => "双鸭山市", "code" => "2305"},
        %{"name" => "大庆市", "code" => "2306"},
        %{"name" => "伊春市", "code" => "2307"},
        %{"name" => "佳木斯市", "code" => "2308"},
        %{"name" => "七台河市", "code" => "2309"},
        %{"name" => "牡丹江市", "code" => "2310"},
        %{"name" => "黑河市", "code" => "2311"},
        %{"name" => "绥化市", "code" => "2312"},
        %{"name" => "大兴安岭地区", "code" => "2327"}
      ]

  def next(input)
      when input == "吉林省"
      when input == "吉林"
      when input == "22",
      do: [
        %{"name" => "长春市", "code" => "2201"},
        %{"name" => "吉林市", "code" => "2202"},
        %{"name" => "四平市", "code" => "2203"},
        %{"name" => "辽源市", "code" => "2204"},
        %{"name" => "通化市", "code" => "2205"},
        %{"name" => "白山市", "code" => "2206"},
        %{"name" => "松原市", "code" => "2207"},
        %{"name" => "白城市", "code" => "2208"},
        %{"name" => "延边朝鲜族自治州", "code" => "2224"}
      ]

  def next(input)
      when input == "辽宁省"
      when input == "辽宁"
      when input == "21",
      do: [
        %{"name" => "沈阳市", "code" => "2101"},
        %{"name" => "大连市", "code" => "2102"},
        %{"name" => "鞍山市", "code" => "2103"},
        %{"name" => "抚顺市", "code" => "2104"},
        %{"name" => "本溪市", "code" => "2105"},
        %{"name" => "丹东市", "code" => "2106"},
        %{"name" => "锦州市", "code" => "2107"},
        %{"name" => "营口市", "code" => "2108"},
        %{"name" => "阜新市", "code" => "2109"},
        %{"name" => "辽阳市", "code" => "2110"},
        %{"name" => "盘锦市", "code" => "2111"},
        %{"name" => "铁岭市", "code" => "2112"},
        %{"name" => "朝阳市", "code" => "2113"},
        %{"name" => "葫芦岛市", "code" => "2114"}
      ]

  def next(input)
      when input == "内蒙古自治区"
      when input == "内蒙古"
      when input == "15",
      do: [
        %{"name" => "呼和浩特市", "code" => "1501"},
        %{"name" => "包头市", "code" => "1502"},
        %{"name" => "乌海市", "code" => "1503"},
        %{"name" => "赤峰市", "code" => "1504"},
        %{"name" => "通辽市", "code" => "1505"},
        %{"name" => "鄂尔多斯市", "code" => "1506"},
        %{"name" => "呼伦贝尔市", "code" => "1507"},
        %{"name" => "巴彦淖尔市", "code" => "1508"},
        %{"name" => "乌兰察布市", "code" => "1509"},
        %{"name" => "兴安盟", "code" => "1522"},
        %{"name" => "锡林郭勒盟", "code" => "1525"},
        %{"name" => "阿拉善盟", "code" => "1529"}
      ]

  def next(input)
      when input == "山西省"
      when input == "山西"
      when input == "14",
      do: [
        %{"name" => "太原市", "code" => "1401"},
        %{"name" => "大同市", "code" => "1402"},
        %{"name" => "阳泉市", "code" => "1403"},
        %{"name" => "长治市", "code" => "1404"},
        %{"name" => "晋城市", "code" => "1405"},
        %{"name" => "朔州市", "code" => "1406"},
        %{"name" => "晋中市", "code" => "1407"},
        %{"name" => "运城市", "code" => "1408"},
        %{"name" => "忻州市", "code" => "1409"},
        %{"name" => "临汾市", "code" => "1410"},
        %{"name" => "吕梁市", "code" => "1411"}
      ]

  def next(input)
      when input == "河北省"
      when input == "河北"
      when input == "13",
      do: [
        %{"name" => "石家庄市", "code" => "1301"},
        %{"name" => "唐山市", "code" => "1302"},
        %{"name" => "秦皇岛市", "code" => "1303"},
        %{"name" => "邯郸市", "code" => "1304"},
        %{"name" => "邢台市", "code" => "1305"},
        %{"name" => "保定市", "code" => "1306"},
        %{"name" => "张家口市", "code" => "1307"},
        %{"name" => "承德市", "code" => "1308"},
        %{"name" => "沧州市", "code" => "1309"},
        %{"name" => "廊坊市", "code" => "1310"},
        %{"name" => "衡水市", "code" => "1311"}
      ]

  def next(input)
      when input == "天津市"
      when input == "天津"
      when input == "12",
      do: [%{"name" => "天津市/市辖区", "code" => "1201"}]

  def next(input)
      when input == "北京市"
      when input == "北京"
      when input == "11",
      do: [%{"name" => "北京市/市辖区", "code" => "1101"}]

  def next(_unknown), do: nil
end