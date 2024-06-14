defmodule ChinaAdminDivisions.MixCadGenTest do
  use ExUnit.Case

  @input [
    %{
      "code" => "11",
      "name" => "lv1name",
      "children" => [
        %{
          "code" => "1101",
          "name" => "lv2name_1",
          "children" => [
            %{
              "code" => "110101",
              "name" => "lv3name_1",
              "children" => [
                %{"code" => "110101001000", "name" => "lv4name_1"},
                %{"code" => "110101002000", "name" => "lv4name_2"},
                %{"code" => "110101003000", "name" => "lv4name_3"},
              ]
            }
          ]
        },
        %{
          "code" => "1102",
          "name" => "lv2name_2",
          "children" => [
            %{
              "code" => "110201",
              "name" => "lv3name_2",
              "children" => [
                %{"code" => "110201001000", "name" => "lv4name_5"},
                %{"code" => "110201002000", "name" => "lv4name_4"}
              ]
            }
          ]
        }
      ]
    },
    %{
      "code" => "21",
      "name" => "lv1name_2",
      "children" => [
        %{
          "code" => "2101",
          "name" => "lv2name_3",
          "children" => [
            %{
              "code" => "210101",
              "name" => "lv3name_3",
              "children" => [
                %{"code" => "210101001000", "name" => "lv4name_6"},
                %{"code" => "210101002000", "name" => "lv4name_7"},
                %{"code" => "210101003000", "name" => "lv4name_8"}
              ]
            }
          ]
        }
      ]
    }
  ]

  test "loop_items" do
    assert {_, _, _, _} = Mix.Tasks.Cad.Gen.Lv2.loop_items(@input, 1)
  end
end
