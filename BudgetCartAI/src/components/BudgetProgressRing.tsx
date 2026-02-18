import React from "react";
import { View, Text, StyleSheet } from "react-native";
import { tokens } from "../design/tokens";

export function BudgetProgressRing(props: { spent: number; budget: number }) {
  const pct = props.budget <= 0 ? 0 : Math.max(0, Math.min(1, props.spent / props.budget));
  const pctText = `${Math.round(pct * 100)}%`;

  return (
    <View style={styles.wrap}>
      <View style={styles.ring}>
        <Text style={styles.pct}>{pctText}</Text>
        <Text style={styles.sub}>${props.spent.toFixed(0)} / ${props.budget.toFixed(0)}</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  wrap: { alignItems: "flex-start" },
  ring: { width: 120, height: 120, borderRadius: 60, backgroundColor: tokens.color.surface2, borderWidth: 2, borderColor: tokens.color.border, alignItems: "center", justifyContent: "center" },
  pct: { fontSize: 22, fontWeight: "900", color: tokens.color.text },
  sub: { marginTop: 6, fontSize: tokens.type.small, color: tokens.color.muted },
});
