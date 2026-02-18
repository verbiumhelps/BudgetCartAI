import React, { useEffect } from "react";
import { View, Text, StyleSheet } from "react-native";
import { tokens } from "../../src/design/tokens";
import { EmptyState } from "../../src/ui/States";
import { analytics } from "../../src/analytics";

export default function ShopScreen() {
  useEffect(() => { analytics.track({ name: "tab_viewed", props: { tab: "shop" } }); }, []);
  return (
    <View style={styles.page}>
      <Text style={styles.h1}>Shop</Text>
      <EmptyState title="In-store mode (Phase 3)" details="This will show your list and substitutions as ranked artifacts." />
    </View>
  );
}

const styles = StyleSheet.create({
  page: { flex: 1, backgroundColor: tokens.color.bg, padding: tokens.spacing.xl, gap: tokens.spacing.lg },
  h1: { fontSize: tokens.type.h1, color: tokens.color.text, fontWeight: "900" },
});
