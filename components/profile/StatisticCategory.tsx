import { Fragment } from "react";
import { View } from "react-native";
import { Card, Divider, Text, useTheme } from "react-native-paper";
import { VariantProp } from "react-native-paper/lib/typescript/components/Typography/types";
import PieChart from "react-native-pie-chart";

export default function statisticCategory(props: {
  data: {
    title: string;
    dataPointCategories: { dataPoints: string[]; textColor?: any }[];
  };
  textVariant?: string;
  titleVariant?: string;
  pieChart?: { widthAndHeight: number; series: number[]; sliceColor: string[] };
}) {
  const theme = useTheme();
  const { data, pieChart } = props;
  const textVariant = (props.textVariant || "bodyMedium") as VariantProp<never>;
  const titleVariant = (props.titleVariant ||
    "titleMedium") as VariantProp<never>;
  return (
    <Fragment>
      <Card
        mode="contained"
        style={{
          backgroundColor: theme.colors.background,
        }}
      >
        <Card.Title titleVariant={titleVariant} title={data.title} />
        <Card.Content>
          <View
            style={{
              flexDirection: "row",
              justifyContent: "space-between",
              alignItems: "center",
              marginBottom: 20,
            }}
          >
            <View style={{ flexDirection: "column", gap: 20 }}>
              {data.dataPointCategories.map((category, categoryIndex) => {
                return (
                  <Fragment key={categoryIndex}>
                    {category.dataPoints.map((item, index) => {
                      return (
                        <Text
                          key={index}
                          variant={textVariant}
                          style={{
                            color: category.textColor
                              ? category.textColor
                              : theme.colors.onBackground,
                          }}
                        >
                          {item}
                        </Text>
                      );
                    })}

                    {
                      categoryIndex !== data.dataPointCategories.length - 1 && <Divider />
                    }
                  </Fragment>
                );
              })}
            </View>
            {pieChart && (
              <PieChart
                widthAndHeight={pieChart.widthAndHeight}
                series={pieChart.series}
                sliceColor={pieChart.sliceColor}
              />
            )}
          </View>
          {data.dataPointCategories.length === 1 && <Divider />}
        </Card.Content>
      </Card>
    </Fragment>
  );
}
