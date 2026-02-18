import React, { useEffect } from "react";
import { View, Text, StyleSheet } from "react-native";
import { tokens } from "../../src/design/tokens";
import { LoadingState } from "../../src/ui/States";
import { analytics } from "../../src/analytics";

export default function PlanScreen() {
  useEffect(() => { analytics.track({ name: "tab_viewed", props: { tab: "plan" } }); }, []);
  return (
    <View style={styles.page}>
      <Text style={styles.h1}>Plan</Text>
      <LoadingState title="Planning tools (Phase 1)" />
    </View>
  );
}

const styles = StyleSheet.create({
  page: { flex: 1, backgroundColor: tokens.color.bg, padding: tokens.spacing.xl, gap: tokens.spacing.lg },
  h1: { fontSize: tokens.type.h1, color: tokens.color.text, fontWeight: "900" },
});
