import React from "react";
import { View, Text, StyleSheet } from "react-native";
import { tokens } from "../design/tokens";

export function LoadingState({ title = "Loading…" }: { title?: string }) {
  return (
    <View style={styles.wrap}>
      <Text style={styles.title}>{title}</Text>
      <Text style={styles.sub}>Please wait.</Text>
    </View>
  );
}

export function EmptyState({
  title = "Nothing here yet",
  details = "Add items to get started.",
}: { title?: string; details?: string }) {
  return (
    <View style={styles.wrap}>
      <Text style={styles.title}>{title}</Text>
      <Text style={styles.sub}>{details}</Text>
    </View>
  );
}

export function ErrorState({
  title = "Something went wrong",
  details = "Try again.",
}: { title?: string; details?: string }) {
  return (
    <View style={styles.wrap}>
      <Text style={styles.title}>{title}</Text>
      <Text style={styles.sub}>{details}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  wrap: {
    padding: tokens.spacing.xl,
    borderRadius: tokens.radius.lg,
    backgroundColor: tokens.color.surface2,
    borderWidth: 1,
    borderColor: tokens.color.border,
  },
  title: { fontSize: tokens.type.h2, color: tokens.color.text, fontWeight: "700" },
  sub: { marginTop: tokens.spacing.sm, fontSize: tokens.type.body, color: tokens.color.muted },
});
