import React from "react";
import { View, Text, Pressable, StyleSheet } from "react-native";
import { tokens } from "../design/tokens";

export function PrimaryOptimizationCard(props: {
  title: string;
  description: string;
  ctaLabel: string;
  onPress: () => void;
  hint?: string;
}) {
  return (
    <View style={styles.card}>
      <Text style={styles.kicker}>Primary Optimization</Text>
      <Text style={styles.title}>{props.title}</Text>
      <Text style={styles.desc}>{props.description}</Text>
      {props.hint ? <Text style={styles.hint}>{props.hint}</Text> : null}
      <Pressable style={styles.cta} onPress={props.onPress} accessibilityRole="button">
        <Text style={styles.ctaText}>{props.ctaLabel}</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  card: { backgroundColor: tokens.color.surface, borderRadius: tokens.radius.xl, padding: tokens.spacing.xl, borderWidth: 1, borderColor: tokens.color.border },
  kicker: { fontSize: tokens.type.small, color: tokens.color.muted, marginBottom: tokens.spacing.sm, letterSpacing: 0.3 },
  title: { fontSize: tokens.type.h1, color: tokens.color.text, fontWeight: "800" },
  desc: { marginTop: tokens.spacing.sm, fontSize: tokens.type.body, color: tokens.color.muted, lineHeight: 20 },
  hint: { marginTop: tokens.spacing.md, fontSize: tokens.type.small, color: tokens.color.text, opacity: 0.9 },
  cta: { marginTop: tokens.spacing.lg, backgroundColor: tokens.color.accent2, paddingVertical: tokens.spacing.md, borderRadius: tokens.radius.lg, alignItems: "center" },
  ctaText: { color: "#06101F", fontWeight: "800", fontSize: tokens.type.body },
});
