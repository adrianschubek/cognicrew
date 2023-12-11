import { Card, Divider, Text, useTheme } from "react-native-paper";
import { VariantProp } from "react-native-paper/lib/typescript/components/Typography/types";

export default function statisticCategory(props: {
  data: {
    title: string;
    dataPointCategories: { dataPoints: string[]; textColor?: any }[];
  };
  textVariant?: string;
  titleVariant?: string;
}) {
  const theme = useTheme();
  const { data } = props;
  const textVariant = (props.textVariant || "bodyMedium") as VariantProp<never>;
  const titleVariant = (props.titleVariant ||
    "titleMedium") as VariantProp<never>;
  return data.dataPointCategories.map((category) => {
    return (
      <>
        <Card
          mode="contained"
          style={{
            backgroundColor: theme.colors.background,
          }}
        >
          <Card.Title titleVariant={titleVariant} title={data.title} />
          <Card.Content>
            {category.dataPoints.map((item, index) => {
              return (
                <Text
                  key={index}
                  variant={textVariant}
                  style={{
                    color: category.textColor
                      ? category.textColor
                      : theme.colors.onBackground,
                    marginBottom: 5,
                  }}
                >
                  {item}
                </Text>
              );
            })}
          </Card.Content>
        </Card>
        <Divider style={{ marginHorizontal: 10 }} />
      </>
    );
  });
}
