import { Card, Text, useTheme } from "react-native-paper";
import { VariantProp } from "react-native-paper/lib/typescript/components/Typography/types";

export default function statisticCategory(props: {
  data: { title: string; dataPoints: string[] };
  textVariant?: string;
  textColor?: any;
}) {
  const theme = useTheme();
  const { data, textColor } = props;
  const textVariant = (props.textVariant || "bodyMedium") as VariantProp<never>;
  return (
    <>
      <Card
        mode="contained"
        style={{
          backgroundColor: theme.colors.background,
        }}
      >
        <Card.Title titleVariant="titleMedium" title={data.title} />
        <Card.Content>
          {data.dataPoints.map((item, index) => {
            return (
              <Text
                key={index}
                variant={textVariant}
                style={{
                  color: textColor ? textColor : theme.colors.onBackground,
                }}
              >
                {item}
              </Text>
            );
          })}
        </Card.Content>
      </Card>
    </>
  );
}
